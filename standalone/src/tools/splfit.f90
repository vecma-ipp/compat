!> Module for curves approximation and evalution using non periodic splines.

module splfit

contains
  
  !> @brief     Determine the knot span index 
  !>
  !> @param[in]  n     number of control points 
  !> @param[in]  p     spline degree 
  !> @param[in]  U     Knot vector 
  !> @param[in]  uu    given knot 
  !> @param[out] span  span index 
  function find_span(n, p, uu, U) result (span)
  implicit none
    integer(kind=4), intent(in) :: n, p
    real   (kind=8), intent(in) :: uu, U(0:n+p+1)
    integer(kind=4)             :: span
    integer(kind=4) low, high

    if (uu >= U(n+1)) then
       span = n
       return
    end if
    if (uu <= U(p)) then
       span = p
       return
    end if
    low  = p
    high = n+1
    span = (low + high) / 2
    do while (uu < U(span) .or. uu >= U(span+1))
       if (uu < U(span)) then
          high = span
       else
          low  = span
       end if
       span = (low + high) / 2
    end do

  end function find_span

  !> @brief      Compute the nonvanishing basis functions
  !>
  !> @param[in]  p    spline degree 
  !> @param[in]  U    Knot vector 
  !> @param[in]  uu   Knot 
  !> @param[in]  i    span of a knot 
  !> @param[out] N    all (p+1) Splines non-vanishing at uu 
  subroutine basis_funs(i, uu , p, U, N)
    implicit none
    integer(kind=4), intent(in) :: i, p
    real   (kind=8), intent(in) :: uu, U(0:i+p)
    real   (kind=8), intent(out):: N(0:p)
    
    integer(kind=4) :: j, r
    real   (kind=8) :: left(p), right(p), saved, temp

    N(0) = 1.0
    do j = 1, p
       left(j)  = uu - U(i+1-j)
       right(j) = U(i+j) - uu
       saved = 0.0
       do r = 0, j-1
          temp = N(r) / (right(r+1) + left(j-r))
          N(r) = saved + right(r+1) * temp
          saved = left(j-r) * temp
       end do
       N(j) = saved
    end do

  end subroutine basis_funs

  !> @brief    Computes collocation matrix 
  !>
  !> @param[in]  n      number of control points 
  !> @param[in]  p      spline degree 
  !> @param[in]  knots  Knot vector 
  !> @param[in]  arr_x  array of sites for evaluation 
  !> @param[out] mat    mat is a dense matrix of size (n_points, m_points) 
  !>                    where m depends on the boundary condition
  subroutine collocation_matrix(n, p, knots, arr_x, mat)
  implicit none
    integer,                 intent(in)  :: n
    integer,                 intent(in)  :: p
    real(8), dimension(:),   intent(in)  :: knots
    real(8), dimension(:),   intent(in)  :: arr_x 
    real(8), dimension(:,:), intent(inout) :: mat 
    
    integer :: i
    integer :: j
    integer :: span
    integer :: n_points
    real(8) :: x
    real(8), dimension(:,:), allocatable :: batx
    integer, dimension(:), allocatable :: spans
    
    n_points = size(arr_x, 1)
    allocate(batx(p+1,n_points))
    allocate(spans(n_points))
    
    do i = 1, n_points
      x = arr_x(i) 
      span = find_span(n-1, p, x, knots)
      spans(i) = span
      call basis_funs(span, x, p, knots, batx(:,i))
    end do
   
    mat = 0.0d0
    do i = 1, n_points
      span = spans(i)
      do j = 0, p
        mat(i,span-p+j+1) = batx(j+1,i)
      enddo
    enddo
    
    deallocate(spans)
    deallocate(batx)

  end subroutine collocation_matrix 
  
  ! Computes the Spline parameterization
  subroutine sites(x, y, method, u)

    implicit none

    real(8), dimension(:), intent(in) :: x
    real(8), dimension(:), intent(in) :: y
    character(*), intent(in) :: method
    real(8), dimension(:), intent(inout) :: u

    real(8), dimension(:), allocatable :: di
    integer :: i, n, d

    n  = size(x, 1)  
    if (size(y) /= n) then
      write(*,*) "ERROR: x and y should have the same size."
      stop
    end if
    
    allocate(di(n-1))

    if (method == "uniform") then
      do i = 0, n-1
        u(i+1) = i/(n-1)
      enddo

    else
      u(:) = 0.0
      u(n) = 1.
      di(:) = 0.0
      d = 0.0

      if (method == "chord") then
        do i =2, n
          di(i-1) = dsqrt((x(i)-x(i-1))**2 + (y(i)-y(i-1))**2)
          d = d + di(i-1)
        enddo
      endif
      
      if (method == "centripetal") then
        do i = 2, n
          di(i-1) = dsqrt(dsqrt((x(i)-x(i-1))**2 + (y(i)-y(i-1))**2))
          d = d + di(i-1)
        enddo
      endif

      do i = 2, n-1
        u(i) = u(i-1) + di(i-1)/d
      enddo
      
    endif

    deallocate(di)
    return 
    
  end subroutine sites

  !> @brief  Curve fitting of a set of m points (coordinates are (x[i], y[i]) 
  !          using Least Squares approximation. The endpoints are interpolated.
  !>
  !> @param[in]  X,Y     The coordinates of the 1D curve
  !> @param[in]  n       The number of control points (n>p)
  !> @param[in]  p       Spline degree 
  !> @param[in]  method  The parameterization method 
  !> @param[out] T       The Knots  vector
  !> @param[out] C       The control points
  subroutine approximate_curve(X, Y, n, p, method, T, C)
    implicit none

    real(8), dimension(:), intent(in) :: X
    real(8), dimension(:), intent(in) :: Y
    integer, intent(in) :: ne
    integer, intent(in) :: p
    character(*), intent(in) :: method

    real(8), dimension(:), intent(inout) :: T
    real(8), dimension(:, :), intent(inout) :: C

    real(8), dimension(:), allocatable :: u
    real(8), dimension(:, :), allocatable :: N, M, R, B

    integer, dimension(:), allocatable :: IPIV
    integer :: info, nc, nv, i
    

    ! Check sizes
    if (size(T) /= n+p+1) then
      write(*,*) "ERROR: T has wrong size."
      stop
    end if
    if( (size(C,1) /= n).or.(size(C,2) /= 2)) then
      write(*,*) "ERROR: C has wrong size."
      stop
    end if

    ! Number of verticies
    m = size(X)

    ! The parameter values
    allocate(u(m))
    call sites(X, Y, method, u)

    ! Knots vector   
    do i =1, p+1
      T(i) = 0.0
      T(n+i) = 1.0
    enddo
    do i = 1, n-p-1
      T(p+i+1) = 1.0*i/(n-p)
    enddo
    
    ! Collocation matrix of size (nc, nv)
    allocate(N(m, n))

    call collocation_matrix(nc, p, T, u, N)

    ! Get matrix and rhs for Least Squares Linear system
    ! M = Dt*D (D = N(2:m-1, 2:n-1)
    ! removed lines and rows correspond to the interpolated endpoints
    allocate(M(n-2, n-2))
    M = matmul(transpose(N(2:m-1, 2:n-1)), N(2:m-1, 2:n-1))
    
    ! RHS
    allocate(B(n-2, 2))
    allocate(R(m-2, 2))

    do i=2, m-1
      R(i-1, 1) = x(i) - N(i,1)*x(1) - N(i,n)*x(m)
      R(i-1, 2) = y(i) - N(i,1)*y(1) - N(i,n)*y(m)
    enddo

    B(:, 1) = matmul(N(2:m-1, 2:n-1), R(:, 1))
    B(:, 2) = matmul(N(2:m-1, 2:n-1), R(:, 2))

    ! For  factorization
    allocate(IPIV(n-2))

    ! Solve the linear syestem using  LAPACK
    call dgesv(n-2, 2, M, n-2, IPIV, B, n-2, info) 

   ! Check for the exact singularity.
    if( info.gt.0 ) then
      write(*,*)'The diagonal element of the triangular factor of M,'
      write(*,*)'U(',INFO,',',INFO,') is zero, so that'
      write(*,*)'M is singular; the solution could not be computed.'
      stop
    end if

    ! Control points
    
    ! Interpolate endpoints
    C(1,1) = X(1)
    C(1,2) = Y(1)
    C(n,1) = X(m)
    C(n,2) = Y(m)
    C(2:nc-1,1) = B(:,1)
    C(2:nc-1,1) = B(:,2)

    ! Dellocations
    deallocate(u) 
    deallocate(N) 
    deallocate(M) 
    deallocate(B) 
    deallocate(R) 
    deallocate(IPIV) 

  end subroutine approximate_curve

end module splfit
