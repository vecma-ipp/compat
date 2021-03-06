! ITM FORTRAN 90 type definitions
! Contains the type definition of all CPOs
! and type definition for CPO mask structure (CPO structures with leaves of integer type, all type names have a _mask extension) 

module euITM_utilities    ! declare the set of types common to all sub-trees
use iso_c_binding
use euitm_ual_defs


  
type type_codeparam  !    
  character(len=132), dimension(:), pointer ::codename => null()       ! /codeparam/codename - Name of the code
  character(len=132), dimension(:), pointer ::codeversion => null()       ! /codeparam/codeversion - Version of the code (as in the ITM repository)
  character(len=132), dimension(:), pointer ::parameters => null()       ! /codeparam/parameters - List of the code specific parameters, string expected to be in XML format.
  character(len=132), dimension(:), pointer ::output_diag => null()       ! /codeparam/output_diag - List of the code specific diagnostic/output, string expected to be in XML format.
  integer  :: output_flag=-999999999       ! /codeparam/output_flag - Output flag : 0 means the run is successful, other values meaning some difficulty has been encounter
endtype

  
type type_param  !    
  character(len=132), dimension(:), pointer ::parameters => null()       ! /param/parameters - Actual value of the code parameters (instance of coparam/parameters in XML format).
  character(len=132), dimension(:), pointer ::default_param => null()       ! /param/default_param - Default value of the code parameters (instance of coparam/parameters in XML format).
  character(len=132), dimension(:), pointer ::schema => null()       ! /param/schema - Code parameters schema.
endtype

  
type type_composition  !    
  real(EUITM_R8),pointer  :: amn(:) => null()     ! /composition/amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zn(:) => null()     ! /composition/zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zion(:) => null()     ! /composition/zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer,pointer  :: imp_flag(:) => null()      ! /composition/imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  character(len=132), dimension(:), pointer ::label => null()       ! /composition/label - Label for the ions - note the charge state is not included; String Vector (nion)
endtype

  
type type_desc_impur  !    
  real(EUITM_R8),pointer  :: amn(:) => null()     ! /desc_impur/amn - Atomic mass number of the impurity; Vector (nimp)
  integer,pointer  :: zn(:) => null()      ! /desc_impur/zn - Nuclear charge of the impurity; Vector (nimp)
  integer,pointer  :: i_ion(:) => null()      ! /desc_impur/i_ion - Index of the impurity species in the coreprof ion species ordering. Vector (nimp)
  integer,pointer  :: nzimp(:) => null()      ! /desc_impur/nzimp - Number of charge states (or bundles) considered for each impurity species. Vector (nimp)
  integer,pointer  :: zmin(:,:) => null()     ! /desc_impur/zmin - Minimum Z of impurity ionisation state bundle. Matrix (nimp,max_nzimp)
  integer,pointer  :: zmax(:,:) => null()     ! /desc_impur/zmax - Maximum Z of impurity ionisation state bundle. If no bundle, zmax=zmin. Matrix (nimp,max_nzimp)
  character(len=132), dimension(:), pointer ::label => null()       ! /desc_impur/label - Label for the impurities - note that the charge state is not included; String Vector (nimp)
endtype

  
type type_whatref  !    
  character(len=132), dimension(:), pointer ::user => null()       ! /whatref/user - Name of the user if private data, public if public ITM database.
  character(len=132), dimension(:), pointer ::machine => null()       ! /whatref/machine - Name of the device
  integer  :: shot=-999999999       ! /whatref/shot - Shot number
  integer  :: run=-999999999       ! /whatref/run - Run number
  integer  :: occurrence=-999999999       ! /whatref/occurrence - Occurrence number of the CPO in the reference entry
endtype

  
type type_putinfo  !    Structure which is type independent, describing the data item
  character(len=132), dimension(:), pointer ::putmethod => null()       ! /putinfo/putmethod - Storage method for this data
  character(len=132), dimension(:), pointer ::putaccess => null()       ! /putinfo/putaccess - Instructions to access the data using this method
  character(len=132), dimension(:), pointer ::putlocation => null()       ! /putinfo/putlocation - Name of this data under this method
  character(len=132), dimension(:), pointer ::rights => null()       ! /putinfo/rights - Access rights to this data
endtype

  
type type_datainfo  !    
  character(len=132), dimension(:), pointer ::dataprovider => null()       ! /datainfo/dataprovider - Name of the actual data provider (the person who filled the data)
  character(len=132), dimension(:), pointer ::putdate => null()       ! /datainfo/putdate - Date at which the data has been put in the DB
  character(len=132), dimension(:), pointer ::source => null()       ! /datainfo/source - Exact reference of the data source (e.g. original reference in the native machine data base)
  character(len=132), dimension(:), pointer ::comment => null()       ! /datainfo/comment - Any additional comment
  integer  :: cocos=-999999999       ! /datainfo/cocos - COordinates COnventionS followed by this CPO
  integer  :: id=-999999999       ! /datainfo/id - CPO id for checking its provenance in the workflow
  integer  :: isref=-999999999       ! /datainfo/isref - 1 if the data can be found in the present data base entry; 2 if the data can be found in a parent da
  type (type_whatref) :: whatref  ! /datainfo/whatref - 
  type (type_putinfo) :: putinfo  ! /datainfo/putinfo - 
endtype
  
type type_codeparam_mask  !    
  integer  :: codename=0       ! /codeparam/codename - Name of the code
  integer  :: codeversion=0       ! /codeparam/codeversion - Version of the code (as in the ITM repository)
  integer  :: parameters=0       ! /codeparam/parameters - List of the code specific parameters, string expected to be in XML format.
  integer  :: output_diag=0       ! /codeparam/output_diag - List of the code specific diagnostic/output, string expected to be in XML format.
  integer  :: output_flag=0       ! /codeparam/output_flag - Output flag : 0 means the run is successful, other values meaning some difficulty has been encounter
endtype
  
type type_param_mask  !    
  integer  :: parameters=0       ! /param/parameters - Actual value of the code parameters (instance of coparam/parameters in XML format).
  integer  :: default_param=0       ! /param/default_param - Default value of the code parameters (instance of coparam/parameters in XML format).
  integer  :: schema=0       ! /param/schema - Code parameters schema.
endtype
  
type type_composition_mask  !    
  integer  :: amn=0       ! /composition/amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  integer  :: zn=0       ! /composition/zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  integer  :: zion=0       ! /composition/zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer  :: imp_flag=0       ! /composition/imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  integer  :: label=0       ! /composition/label - Label for the ions - note the charge state is not included; String Vector (nion)
endtype
  
type type_desc_impur_mask  !    
  integer  :: amn=0       ! /desc_impur/amn - Atomic mass number of the impurity; Vector (nimp)
  integer  :: zn=0       ! /desc_impur/zn - Nuclear charge of the impurity; Vector (nimp)
  integer  :: i_ion=0       ! /desc_impur/i_ion - Index of the impurity species in the coreprof ion species ordering. Vector (nimp)
  integer  :: nzimp=0       ! /desc_impur/nzimp - Number of charge states (or bundles) considered for each impurity species. Vector (nimp)
  integer  :: zmin=0       ! /desc_impur/zmin - Minimum Z of impurity ionisation state bundle. Matrix (nimp,max_nzimp)
  integer  :: zmax=0       ! /desc_impur/zmax - Maximum Z of impurity ionisation state bundle. If no bundle, zmax=zmin. Matrix (nimp,max_nzimp)
  integer  :: label=0       ! /desc_impur/label - Label for the impurities - note that the charge state is not included; String Vector (nimp)
endtype
  
type type_whatref_mask  !    
  integer  :: user=0       ! /whatref/user - Name of the user if private data, public if public ITM database.
  integer  :: machine=0       ! /whatref/machine - Name of the device
  integer  :: shot=0       ! /whatref/shot - Shot number
  integer  :: run=0       ! /whatref/run - Run number
  integer  :: occurrence=0       ! /whatref/occurrence - Occurrence number of the CPO in the reference entry
endtype
  
type type_putinfo_mask  !    Structure which is type independent, describing the data item
  integer  :: putmethod=0       ! /putinfo/putmethod - Storage method for this data
  integer  :: putaccess=0       ! /putinfo/putaccess - Instructions to access the data using this method
  integer  :: putlocation=0       ! /putinfo/putlocation - Name of this data under this method
  integer  :: rights=0       ! /putinfo/rights - Access rights to this data
endtype
  
type type_datainfo_mask  !    
  integer  :: dataprovider=0       ! /datainfo/dataprovider - Name of the actual data provider (the person who filled the data)
  integer  :: putdate=0       ! /datainfo/putdate - Date at which the data has been put in the DB
  integer  :: source=0       ! /datainfo/source - Exact reference of the data source (e.g. original reference in the native machine data base)
  integer  :: comment=0       ! /datainfo/comment - Any additional comment
  integer  :: cocos=0       ! /datainfo/cocos - COordinates COnventionS followed by this CPO
  integer  :: id=0       ! /datainfo/id - CPO id for checking its provenance in the workflow
  integer  :: isref=0       ! /datainfo/isref - 1 if the data can be found in the present data base entry; 2 if the data can be found in a parent da
  type (type_whatref_mask) :: whatref  ! /datainfo/whatref - 
  type (type_putinfo_mask) :: putinfo  ! /datainfo/putinfo - 
endtype

  
type type_objects  !    Definition of space objects (nodes, edges, faces, cells, ...).; A space object of dimension n is defined; by enumerating the (n-1)
  integer,pointer  :: boundary(:,:) => null()     ! /objects(i)/boundary - Lists of (n-1)-dimensional space objects defining the boundary of an n-dimensional space object.; Ma
  integer,pointer  :: neighbour(:,:,:) => null()     ! /objects(i)/neighbour - Connectivity information. Array (number of objects, maximum number of boundaries per object, maximum
  real(EUITM_R8),pointer  :: geo(:,:,:,:) => null()     ! /objects(i)/geo - Geometry data matrix associated with every object. Float array (number of objects, number of geometr
  real(EUITM_R8),pointer  :: measure(:,:) => null()     ! /objects(i)/measure - Measure of space objects, i.e. physical size (length for 1d, area for 2d, volume for 3d objects,...)
endtype

  
type type_nuclei  !    
  real(EUITM_R8)  :: zn=-9.0E40_EUITM_R8       ! /nuclei(i)/zn - Nuclear charge [units of elementary charge];
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /nuclei(i)/amn - Mass of atom [amu]
  character(len=132), dimension(:), pointer ::label => null()       ! /nuclei(i)/label - String identifying element (e.g. H, D, T, He, C, ...)
endtype

  
type type_ions  !    
  integer  :: nucindex=-999999999       ! /ions(i)/nucindex - Index into list of nuclei; int
  real(EUITM_R8)  :: zion=-9.0E40_EUITM_R8       ! /ions(i)/zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer  :: imp_flag=-999999999       ! /ions(i)/imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  character(len=132), dimension(:), pointer ::label => null()       ! /ions(i)/label - String identifying ion (e.g. H+, D+, T+, He+2, C+, ...)
endtype

  
type type_impurities  !    
  integer  :: nucindex=-999999999       ! /impurities(i)/nucindex - Index into list of nuclei; int
  integer  :: i_ion=-999999999       ! /impurities(i)/i_ion - Index of the impurity species in the ions array of structures. Vector (nimp)
  integer  :: nzimp=-999999999       ! /impurities(i)/nzimp - Number of charge states (or bundles) considered for this impurity species.
  real(EUITM_R8),pointer  :: zmin(:) => null()     ! /impurities(i)/zmin - Minimum Z of impurity ionisation state bundle. Vector (nzimp)
  real(EUITM_R8),pointer  :: zmax(:) => null()     ! /impurities(i)/zmax - Maximum Z of impurity ionisation state bundle. If no bundle, zmax=zmin. Vector (nzimp)
  character(len=132), dimension(:), pointer ::label => null()       ! /impurities(i)/label - String array (nzimp) identifying impurities (e.g. C+, C+2 , C+3, C+4, C+5, C+6, ...)
endtype

  
type type_edgespecies  !    
  integer  :: nucindex=-999999999       ! /edgespecies(i)/nucindex - Index into list of nuclei; int
  real(EUITM_R8)  :: zmin=-9.0E40_EUITM_R8       ! /edgespecies(i)/zmin - Minimum Z of species charge state bundle
  real(EUITM_R8)  :: zmax=-9.0E40_EUITM_R8       ! /edgespecies(i)/zmax - Maximum Z of species charge state bundle
  character(len=132), dimension(:), pointer ::label => null()       ! /edgespecies(i)/label - String identifying the species (e.g. D0, D+, C0, C+, C+2, ...)
endtype
  
type type_objects_mask  !    Definition of space objects (nodes, edges, faces, cells, ...).; A space object of dimension n is defined; by enumerating the (n-1)
  integer  :: boundary=0       ! /objects(i)/boundary - Lists of (n-1)-dimensional space objects defining the boundary of an n-dimensional space object.; Ma
  integer  :: neighbour=0       ! /objects(i)/neighbour - Connectivity information. Array (number of objects, maximum number of boundaries per object, maximum
  integer  :: geo=0       ! /objects(i)/geo - Geometry data matrix associated with every object. Float array (number of objects, number of geometr
  integer  :: measure=0       ! /objects(i)/measure - Measure of space objects, i.e. physical size (length for 1d, area for 2d, volume for 3d objects,...)
endtype
  
type type_nuclei_mask  !    
  integer  :: zn=0       ! /nuclei(i)/zn - Nuclear charge [units of elementary charge];
  integer  :: amn=0       ! /nuclei(i)/amn - Mass of atom [amu]
  integer  :: label=0       ! /nuclei(i)/label - String identifying element (e.g. H, D, T, He, C, ...)
endtype
  
type type_ions_mask  !    
  integer  :: nucindex=0       ! /ions(i)/nucindex - Index into list of nuclei; int
  integer  :: zion=0       ! /ions(i)/zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer  :: imp_flag=0       ! /ions(i)/imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  integer  :: label=0       ! /ions(i)/label - String identifying ion (e.g. H+, D+, T+, He+2, C+, ...)
endtype
  
type type_impurities_mask  !    
  integer  :: nucindex=0       ! /impurities(i)/nucindex - Index into list of nuclei; int
  integer  :: i_ion=0       ! /impurities(i)/i_ion - Index of the impurity species in the ions array of structures. Vector (nimp)
  integer  :: nzimp=0       ! /impurities(i)/nzimp - Number of charge states (or bundles) considered for this impurity species.
  integer  :: zmin=0       ! /impurities(i)/zmin - Minimum Z of impurity ionisation state bundle. Vector (nzimp)
  integer  :: zmax=0       ! /impurities(i)/zmax - Maximum Z of impurity ionisation state bundle. If no bundle, zmax=zmin. Vector (nzimp)
  integer  :: label=0       ! /impurities(i)/label - String array (nzimp) identifying impurities (e.g. C+, C+2 , C+3, C+4, C+5, C+6, ...)
endtype
  
type type_edgespecies_mask  !    
  integer  :: nucindex=0       ! /edgespecies(i)/nucindex - Index into list of nuclei; int
  integer  :: zmin=0       ! /edgespecies(i)/zmin - Minimum Z of species charge state bundle
  integer  :: zmax=0       ! /edgespecies(i)/zmax - Maximum Z of species charge state bundle
  integer  :: label=0       ! /edgespecies(i)/label - String identifying the species (e.g. D0, D+, C0, C+, C+2, ...)
endtype

  
type type_b0r0  !    Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, normalisation used by the ETS
  real(EUITM_R8)  :: r0=-9.0E40_EUITM_R8       ! /r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  real(EUITM_R8)  :: b0=-9.0E40_EUITM_R8       ! /b0 - Vacuum field at r0 [T]; Positive sign means anti-clockwise when viewed from above. Scalar. Time-depe
endtype

  
type type_boundaryel  !    Structure for the boundary condition of core transport equations (electrons) Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=-999999999       ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  real(EUITM_R8)  :: rho_tor=-9.0E40_EUITM_R8       ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype

  
type type_boundaryion  !    Structure for the boundary condition of core transport equations (ions) Time-dependent
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer,pointer  :: type(:) => null()      ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype

  
type type_complexgrid_space  !    Description of a grid space
  integer,pointer  :: geotype(:) => null()      ! /geotype - Type of space geometry (id flags). Flags defining how the geometry (objects.geo) fields associated w
  character(len=132), dimension(:), pointer ::geotypeid => null()       ! /geotypeid - Type of space geometries (id string). See geotype.
  integer,pointer  :: coordtype(:,:) => null()     ! /coordtype - Type of coordinates describing the physical space. Vector (number of space dimensions); The size of 
  type (type_objects),pointer :: objects(:) => null()  ! /objects(i) - Definition of the space objects.; Array of structures (dimension of highest-dimensional objects).; F
  integer,pointer  :: xpoints(:) => null()      ! /xpoints - List of indices of all nodes which are x-points. Vector (number of x-points)
endtype

  
type type_complexgrid_indexlist  !    An index list describing a list of indices or a range of indices.; If the explicit index list ind is defined and has nonzero size,
  integer,pointer  :: range(:) => null()      ! /range - Defines an index range enumerating from range[1] to range[2] (with both range[1] and range[2] includ
  integer,pointer  :: ind(:) => null()      ! /ind - An explicit list of indices. If this member is defined and has nonzero size, the list is assumed to 
endtype

  
type type_complexgrid_objectlist  !    A list of grid objects with a common class, either in explicit of implicit form.; The list is explicit if the matrix ind is given 
  integer,pointer  :: cls(:) => null()      ! /cls - Class tuple of the grid objects in this object list. Vector (number of grid spaces)
  type (type_complexgrid_indexlist),pointer :: indset(:) => null()  ! /indset(i) - Implicit list of the object indices.;  Array of structures (number of grid spaces = length of index 
  integer,pointer  :: ind(:,:) => null()     ! /ind - Explicit list of index tuples. Matrix (number of objects, number of spaces in grid).; First dimensio
endtype

  
type type_complexgrid_subgrid  !    Subgrid definition. A subgrid is a list of grid objects, given as a list of explict or implicit object lists.
  character(len=132), dimension(:), pointer ::id => null()       ! /id - ID string (name) of the subgrid.
  type (type_complexgrid_objectlist),pointer :: list(:) => null()  ! /list(i) - List of object lists. Array of structures (number of object lists).
endtype

  
type type_complexgrid_scalar_simplestruct  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: subgrid=-999999999       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
        			
  real(EUITM_R8),pointer  :: scalar(:) => null()     ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  real(EUITM_R8),pointer  :: vector(:,:) => null()     ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  real(EUITM_R8),pointer  :: matrix(:,:,:) => null()     ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype

  
type type_complexgrid_scalar  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=-999999999       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  real(EUITM_R8),pointer  :: scalar(:) => null()     ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  real(EUITM_R8),pointer  :: vector(:,:) => null()     ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  real(EUITM_R8),pointer  :: matrix(:,:,:) => null()     ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype

  
type type_complexgrid_scalar_int  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=-999999999       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  integer,pointer  :: scalar(:) => null()      ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  integer,pointer  :: vector(:,:) => null()     ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  integer,pointer  :: matrix(:,:,:) => null()     ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype

  
type type_complexgrid_scalar_cplx  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=-999999999       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  COMPLEX(EUITM_R8),pointer  :: scalar(:) => null()     ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  COMPLEX(EUITM_R8),pointer  :: vector(:,:) => null()     ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  COMPLEX(EUITM_R8),pointer  :: matrix(:,:,:) => null()     ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype

  
type type_complexgrid_vector_simplestruct  !    A vector quantity stored on a grid, with components possibly explicitly aligned to a coordinate direction. To be used as simple st
  character(len=132), dimension(:), pointer ::label => null()       ! /label - Label describing the data
  type (type_complexgrid_scalar),pointer :: comp(:) => null()  ! /comp(i) - Components of the vector. Vector of griddata(ndim). Time-dependent; FIXME: inherit time-dependence f
  integer,pointer  :: align(:) => null()      ! /align - Alignment of vector components, numerical flag. Int vector(ndim)
  character(len=132), dimension(:), pointer ::alignid => null()       ! /alignid - Alignment of vector components, string description. String vector(ndim)
endtype

  
type type_complexgrid_vector  !    A vector quantity stored on a grid, with components possibly explicitly aligned to a coordinate direction. To be used as array of 
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  character(len=132), dimension(:), pointer ::label => null()       ! /label - Label describing the data
  type (type_complexgrid_scalar),pointer :: comp(:) => null()  ! /comp(i) - Components of the vector. Array of structures (number of vector components). Time-dependent; FIXME: 
  integer,pointer  :: align(:) => null()      ! /align - Alignment flag for vector components. Integer vector (number of vector components).
  character(len=132), dimension(:), pointer ::alignid => null()       ! /alignid - Alignment id for vector components. String vector (number of vector components).
  integer  :: basis=-999999999       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
endtype

  
type type_complexgrid_metric  !    Metric information for grid objects
  type (type_complexgrid_scalar),pointer :: measure(:) => null()  ! /measure(i) - Measure of object, i.e. physical size (length for 1d, area for 2d, volume for 3d objects). [m^dim].;
  type (type_complexgrid_scalar),pointer :: g11(:) => null()  ! /g11(i) - Metric coefficients g11. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: g12(:) => null()  ! /g12(i) - Metric coefficients g12. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: g13(:) => null()  ! /g13(i) - Metric coefficients g13. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: g22(:) => null()  ! /g22(i) - Metric coefficients g22. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: g23(:) => null()  ! /g23(i) - Metric coefficients g23. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: g33(:) => null()  ! /g33(i) - Metric coefficients g33. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar),pointer :: jacobian(:) => null()  ! /jacobian(i) - Jacobian. Array of structures (number of subgrids this information is stored on)
endtype

  
type type_complexgrid_geo_global  !    Geometry information for implicitly defined grid objects (which cannot be stored in the space definitions); Array of structures (n
  integer  :: geotype=-999999999       ! /geotype - Type of geometry (id flag). A flag defining how the geometry data associated with grid objects is to
  character(len=132), dimension(:), pointer ::geotypeid => null()       ! /geotypeid - Type of geometry (id string). 
  integer,pointer  :: coordtype(:) => null()      ! /coordtype - Type of coordinates describing the physical space. Vector (number of space dimensions); The size of 
  type (type_complexgrid_scalar),pointer :: geo_matrix(:) => null()  ! /geo_matrix(i) - Geometry data matrix associated with implicit objects. Array of structures (number of subgrids this 
  type (type_complexgrid_scalar),pointer :: measure(:) => null()  ! /measure(i) - Measure of object, i.e. physical size (length for 1d, area for 2d, volume for 3d objects) in this ge
endtype

  
type type_complexgrid  !    Generic definition of a complex grid
  integer  :: uid=-999999999       ! /uid - Unique index of this grid. Used for handling multiple grids
  character(len=132), dimension(:), pointer ::id => null()       ! /id - Name / identifier string for this grid
  type (type_complexgrid_space),pointer :: spaces(:) => null()  ! /spaces(i) - Definitions of grid spaces. Array of structures (number of spaces)
  type (type_complexgrid_subgrid),pointer :: subgrids(:) => null()  ! /subgrids(i) - Definitions of subgrids. Array of structures (number of subgrids)
  type (type_complexgrid_metric) :: metric  ! /metric - Metric coefficients
  type (type_complexgrid_geo_global),pointer :: geo(:) => null()  ! /geo(i) - Geometry data for implicit objects
  type (type_complexgrid_vector),pointer :: bases(:) => null()  ! /bases(i) - Vector bases. Used for aligned vector representation. Time-dependent (added systematically for the C
endtype

  
type type_identifier  !    Standard type for identifiers. The three fields: id, flag and description are all representations of the same information. Associa
  character(len=132), dimension(:), pointer ::id => null()       ! /id - Short string identifier
  integer  :: flag=-999999999       ! /flag - Integer identifier
  character(len=132), dimension(:), pointer ::description => null()       ! /description - Verbose description of identifier
endtype

  
type type_composition_neutrals_neutcomp  !    Array of components to the atom or molecule. Vector (ncomp)
  integer  :: nucindex=-999999999       ! /nucindex - Index into list of nuclei; int
  integer  :: multiplicity=-999999999       ! /multiplicity - Multiplicity of the atom; int
endtype

  
type type_composition_neutralscomp  !    Array of neutrals.
  type (type_composition_neutrals_neutcomp),pointer :: neutcomp(:) => null()  ! /neutcomp(i) - Array of components to the atom or molecule. Vector (ncomp)
  type (type_identifier),pointer :: type(:) => null()  ! /type(i) - Type of neutral, in terms of energy : 0=cold, 1=thermal, 2= fast, 3=NBI. Vector (ntype) of identifie
  character(len=132), dimension(:), pointer ::label => null()       ! /label - String identifying the atom or molecule (e.g. D2, DT, CD4, ...)
endtype

  
type type_compositions_type  !    Generic declaration of Plasma composition for a simulation
  type (type_nuclei),pointer :: nuclei(:) => null()  ! /nuclei(i) - Array of nuclei considered.
  type (type_ions),pointer :: ions(:) => null()  ! /ions(i) - Array of main plasma ions.
  type (type_impurities),pointer :: impurities(:) => null()  ! /impurities(i) - Array of impurities.
  type (type_composition_neutralscomp),pointer :: neutralscomp(:) => null()  ! /neutralscomp(i) - Array of neutrals.
  type (type_edgespecies),pointer :: edgespecies(:) => null()  ! /edgespecies(i) - Array of edge species.
  type (type_identifier) :: signature  ! /signature - Identifier for species choices. The goal of this is to uniquely capture the species blocks so that i
endtype

  
type type_entry_def  !    Structure defining a database entry
  character(len=132), dimension(:), pointer ::user => null()       ! /user - Name of the user if private data. Value should be ITM if stored in the official common ITM tree
  character(len=132), dimension(:), pointer ::machine => null()       ! /machine - Name of the device
  integer  :: shot=-999999999       ! /shot - Shot number
  integer  :: run=-999999999       ! /run - Run number
endtype

  
type type_exp0D  !    Structure for experimental time-dependent scalar signal
  real(EUITM_R8)  :: value=-9.0E40_EUITM_R8       ! /value - Signal value; Time-dependent; Scalar
  real(EUITM_R8)  :: abserror=-9.0E40_EUITM_R8       ! /abserror - Absolute error on signal; Time-dependent; Scalar
  real(EUITM_R8)  :: relerror=-9.0E40_EUITM_R8       ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Scalar
endtype

  
type type_exp1D  !    Structure for experimental 1D signal
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Time-dependent; Vector
  real(EUITM_R8),pointer  :: abserror(:) => null()     ! /abserror - Absolute error on signal; Time-dependent; Vector
  real(EUITM_R8),pointer  :: relerror(:) => null()     ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Vector
endtype

  
type type_exp2D  !    Structure for experimental 2D signal
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Signal value; Time-dependent; Matrix
  real(EUITM_R8),pointer  :: abserror(:,:) => null()     ! /abserror - Absolute error on signal; Time-dependent; Matrix
  real(EUITM_R8),pointer  :: relerror(:,:) => null()     ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Matrix
endtype

  
type type_enum_instance  !    Specifies a specific enumerated instance of an object or process in term of its type, name and an index. E.g. the input could be t
  type (type_identifier) :: type  ! /type - Identify the type of the object or process.
  character(len=132), dimension(:), pointer ::name => null()       ! /name - The name of the object or process. Here the object should be an instans of the type specified in the
  integer  :: index=-999999999       ! /index - Index the separating objects or processes with the same name.
endtype

  
type type_equatorial_plane  !    Description of the equitorial plane or any other omnigeuous surfaces. Time-dependent
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius coordinate of the equitorial plane (m). Time-dependent; Vector(n_equitorial_grid)
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Major radius coordinate of the equitorial plane (m). Time-dependent; Vector(n_equitorial_grid)
  real(EUITM_R8),pointer  :: s(:) => null()     ! /s - Distance along the poloidal projection of the equitorial plane (m). Here s=0 should be at the magnet
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0 is the reference magne
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], evaluated without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vec
  real(EUITM_R8),pointer  :: b_mod(:) => null()     ! /b_mod - The modulous of the magnetic field along the equitorial plane, or more generally of the omnigeuous s
endtype

  
type type_fast_thermal_separation_filter  !    Description of how the fast and the thermal particle populations were separated.
  type (type_identifier) :: method  ! /method - Identifier describing the method used to separate the fast and thermal particle population (see fast
  real(EUITM_R8),pointer  :: energy_sep(:) => null()     ! /energy_sep - Energy at which the fast and thermal particle populations were separated [eV]. Vector (nrho). Time-d
endtype

  
type type_offdiagel  !    Subtree containing the full transport matrix from a transport model, for the electrons. Time-dependent.
  real(EUITM_R8),pointer  :: d_ni(:,:) => null()     ! /d_ni - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  real(EUITM_R8),pointer  :: d_ti(:,:) => null()     ! /d_ti - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  real(EUITM_R8),pointer  :: d_ne(:) => null()     ! /d_ne - Off-Diagonal term coupling electron density gradient to the transport equation [m.^2.s^-1]. Time-dep
  real(EUITM_R8),pointer  :: d_te(:) => null()     ! /d_te - Off-Diagonal term coupling electron temperature gradient to the transport equation [m.^2.s^-1]. Time
  real(EUITM_R8),pointer  :: d_epar(:) => null()     ! /d_epar - Off-Diagonal term coupling parallel electric field to the transport equation [m.^2.s^-1]. Time-depen
  real(EUITM_R8),pointer  :: d_mtor(:) => null()     ! /d_mtor - Off-Diagonal term coupling total toroidal momentum to the transport equation [m.^2.s^-1]. Time-depen
endtype

  
type type_offdiagion  !    Subtree containing the full transport matrix from a transport model, for the various ion species
  real(EUITM_R8),pointer  :: d_ni(:,:,:) => null()     ! /d_ni - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  real(EUITM_R8),pointer  :: d_ti(:,:,:) => null()     ! /d_ti - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  real(EUITM_R8),pointer  :: d_ne(:,:) => null()     ! /d_ne - Off-Diagonal term coupling electron density gradient to the transport equation [m.^2.s^-1]. Time-dep
  real(EUITM_R8),pointer  :: d_te(:,:) => null()     ! /d_te - Off-Diagonal term coupling electron temperature gradient to the transport equation [m.^2.s^-1]. Time
  real(EUITM_R8),pointer  :: d_epar(:,:) => null()     ! /d_epar - Off-Diagonal term coupling parallel electric field to the transport equation [m.^2.s^-1]. Time-depen
  real(EUITM_R8),pointer  :: d_mtor(:,:) => null()     ! /d_mtor - Off-Diagonal term coupling total toroidal momentum to the transport equation [m.^2.s^-1]. Time-depen
endtype

  
type type_reduced  !    Structure for a reduced data signal (0D data)
  real(EUITM_R8)  :: value=-9.0E40_EUITM_R8       ! /value - Data value; Real
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal); String
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Time (exact time slice used from the time array of the source signal); Real
endtype

  
type type_reggrid  !    Generic structure for a regular grid
  real(EUITM_R8),pointer  :: dim1(:) => null()     ! /dim1 - First dimension values; Vector (ndim1) 
  real(EUITM_R8),pointer  :: dim2(:) => null()     ! /dim2 - Second dimension values; Vector (ndim2) 
endtype

  
type type_rz0D  !    Structure for one (R,Z) position (0D)
  real(EUITM_R8)  :: r=-9.0E40_EUITM_R8       ! /r - Major radius [m]
  real(EUITM_R8)  :: z=-9.0E40_EUITM_R8       ! /z - Altitude [m]
endtype

  
type type_rz1D  !    Structure for list of R,Z positions (1D)
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]
endtype

  
type type_rz1Dexp  !    Structure for list of R,Z positions (1D), with R and Z time-depent and experimental.
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]. Vector(npoints). Time-dependent
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]. Vector(npoints). Time-dependent
endtype

  
type type_rz1D_npoints  !    Structure for list of R,Z positions (1D), with mention of the number of points relevant for a given time slice
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]. Vector(max_npoints). Time-dependent
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]. Vector(max_npoints). Time-dependent
  integer  :: npoints=-999999999       ! /npoints - Number of meaningful points in the above vectors at a given time slice. Time-dependent
endtype

  
type type_rz2D  !    Structure for list of R,Z positions (2D)
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - Altitude [m]
endtype

  
type type_rz3D  !    Structure for list of R,Z positions (3D)
  real(EUITM_R8),pointer  :: r(:,:,:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:,:,:) => null()     ! /z - Altitude [m]
endtype

  
type type_rzphi0D  !    Structure for a single R,Z,phi position (0D)
  real(EUITM_R8)  :: r=-9.0E40_EUITM_R8       ! /r - Major radius [m]
  real(EUITM_R8)  :: z=-9.0E40_EUITM_R8       ! /z - Altitude [m]
  real(EUITM_R8)  :: phi=-9.0E40_EUITM_R8       ! /phi - Toroidal angle [rad]
endtype

  
type type_rzphi1D  !    Structure for list of R,Z,phi positions (1D)
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Toroidal angle [rad]
endtype

  
type type_rzphidrdzdphi1D  !    Structure for list of R,Z,phi positions and width dR dZ dphi (1D)
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Position : major radius [m]
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Position : altitude [m]
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Position : toroidal angle [rad]
  real(EUITM_R8),pointer  :: dr(:) => null()     ! /dr - Width : major radius [m]
  real(EUITM_R8),pointer  :: dz(:) => null()     ! /dz - Width : altitude [m]
  real(EUITM_R8),pointer  :: dphi(:) => null()     ! /dphi - Width : toroidal angle [rad]
endtype

  
type type_rzphi1Dexp  !    Structure for list of R,Z,phi positions (1D) with experimental structure (value, abserror, relerror)
  type (type_exp1D) :: r  ! /r - Major radius [m]
  type (type_exp1D) :: z  ! /z - Altitude [m]
  type (type_exp1D) :: phi  ! /phi - Toroidal angle [rad]
endtype

  
type type_rzphi1Dexperimental  !    Structure for list of R,Z,phi positions (1D) with additional appinfo tags to have some nodes both in MD and DM
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Toroidal angle [rad]
endtype

  
type type_rzphi2D  !    Structure for list of R,Z,phi positions (2D)
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - Altitude [m]
  real(EUITM_R8),pointer  :: phi(:,:) => null()     ! /phi - Toroidal angle [rad]
endtype

  
type type_rzphi3D  !    Structure for list of R,Z,phi positions (3D)
  real(EUITM_R8),pointer  :: r(:,:,:) => null()     ! /r - Major radius [m]
  real(EUITM_R8),pointer  :: z(:,:,:) => null()     ! /z - Altitude [m]
  real(EUITM_R8),pointer  :: phi(:,:,:) => null()     ! /phi - Toroidal angle [rad]
endtype

  
type type_xyz0D  !    Structure for a single (x,y,z) position (0D)
  real(EUITM_R8)  :: x=-9.0E40_EUITM_R8       ! /x - Spatial coordinate x [m]
  real(EUITM_R8)  :: y=-9.0E40_EUITM_R8       ! /y - Spatial coordinate y [m]
  real(EUITM_R8)  :: z=-9.0E40_EUITM_R8       ! /z - Spatial coordinate z [m]
endtype

  
type type_trianglexyz  !    Triangular surface described by its three corners: point1, point2, and point3. The normal vector of this triangle is defined to be
  type (type_xyz0D) :: point1  ! /point1 - Point 1 on the triangle
  type (type_xyz0D) :: point2  ! /point2 - Point 2 on the triangle
  type (type_xyz0D) :: point3  ! /point3 - Point 3 on the triangle
endtype

  
type type_rectanglexyz  !    Rectangle defined by its four corners. These form an ordered sequence: point00, point01, point11, point10. Here the first point ca
  type (type_xyz0D) :: point01  ! /point01 - Point 01 on the rectangle
  type (type_xyz0D) :: point11  ! /point11 - Point 11 on the rectangle
  type (type_xyz0D) :: point10  ! /point10 - Point 10 on the rectangle
endtype

  
type type_flat_polygon  !    Polygon lying on a flat surface on a 3D cartesian space (x,y,z). The coordinate system on the surface is defined by the origin, "o
  type (type_xyz0D) :: origin  ! /origin - Origin of the surface coordinate system.
  type (type_xyz0D) :: basis1  ! /basis1 - First basis vector on the surface.
  type (type_xyz0D) :: basis2  ! /basis2 - First basis vector on the surface.
  real(EUITM_R8),pointer  :: coord1(:) => null()     ! /coord1 - First coordinate of the polygon points, conjugate to basis1.
  real(EUITM_R8),pointer  :: coord2(:) => null()     ! /coord2 - Second coordinate of the polygon points, conjugate to basis2.
endtype

  
type type_setup_line  !    Geometric description of the lines of sight for line integral diagnostic
  type (type_rzphi1D) :: pivot_point  ! /pivot_point - Pivot point of each line of sight; Vector (nchords)
  real(EUITM_R8),pointer  :: horchordang1(:) => null()     ! /horchordang1 - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS chord -
  real(EUITM_R8),pointer  :: verchordang1(:) => null()     ! /verchordang1 - Angle of chord with vertical axis (0 for bottom-top chord, Pi for top-bottom chord - see Convention_
  real(EUITM_R8),pointer  :: width(:) => null()     ! /width - Width of the laser beam (1/e) [m]; Vector (nchords)
  type (type_rzphi1D) :: second_point  ! /second_point - Second point defining the line of sight together with the pivot_point. In case the probing wave is r
  real(EUITM_R8),pointer  :: horchordang2(:) => null()     ! /horchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle [rad] of horizontal projection of reflected 
  real(EUITM_R8),pointer  :: verchordang2(:) => null()     ! /verchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle of reflected chord with vertical axis (0 for
  type (type_rzphi1D) :: third_point  ! /third_point - Third point defining the reflected line of sight together with the second_point (undefined if the pr
  integer  :: nchordpoints=-999999999       ! /nchordpoints - Number of points along the viewing chords (used for synthetic diagnostic signal reconstruction)
endtype

  
type type_setup_line_exp  !    Geometric description of the lines of sight for line integral diagnostic with additional appinfo tags to have some nodes both in M
  type (type_rzphi1Dexperimental) :: pivot_point  ! /pivot_point - Pivot point of each line of sight; Vector (nchords)
  real(EUITM_R8),pointer  :: horchordang1(:) => null()     ! /horchordang1 - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS chord -
  real(EUITM_R8),pointer  :: verchordang1(:) => null()     ! /verchordang1 - Angle of chord with vertical axis (0 for bottom-top chord, Pi for top-bottom chord - see Convention_
  real(EUITM_R8),pointer  :: width(:) => null()     ! /width - Width of the laser beam (1/e) [m]; Vector (nchords)
  type (type_rzphi1Dexperimental) :: second_point  ! /second_point - Second point defining the line of sight together with the pivot_point. In case the probing wave is r
  real(EUITM_R8),pointer  :: horchordang2(:) => null()     ! /horchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle [rad] of horizontal projection of reflected 
  real(EUITM_R8),pointer  :: verchordang2(:) => null()     ! /verchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle of reflected chord with vertical axis (0 for
  type (type_rzphi1Dexperimental) :: third_point  ! /third_point - Third point defining the reflected line of sight together with the second_point (undefined if the pr
  integer  :: nchordpoints=-999999999       ! /nchordpoints - Number of points along the viewing chords (used for synthetic diagnostic signal reconstruction)
endtype

  
type type_species_desc  !    Description of a single ion species or bundled charge state.
  character(len=132), dimension(:), pointer ::label => null()       ! /label - Name of species
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /amn - Atomic mass number of the species
  real(EUITM_R8)  :: zn=-9.0E40_EUITM_R8       ! /zn - Nuclear charge of the impurity
  real(EUITM_R8)  :: zmin=-9.0E40_EUITM_R8       ! /zmin - Minimum Z of species charge state bundle
  real(EUITM_R8)  :: zmax=-9.0E40_EUITM_R8       ! /zmax - Maximum Z of species charge state bundle
endtype

  
type type_species_reference  !    Defines a reference to a single species in a CPO that includes a compositions structure.
  type (type_identifier) :: type  ! /type - The type species: type.flag=1 for electron source; type.flag=2 for ion source taken from composition
  integer  :: index=-999999999       ! /index - Index of the species. This definition of index depends on the value of type; if the species is an io
endtype

  
type type_source_ion  !    Subtree containing source terms for the various ion species
  real(EUITM_R8),pointer  :: exp(:,:) => null()     ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: imp(:,:) => null()     ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Matrix (nrho,nion)
endtype

  
type type_source_imp  !    Subtree containing source terms for the impurity species
  real(EUITM_R8),pointer  :: exp(:,:) => null()     ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Array2d (nrho,nzimp)
  real(EUITM_R8),pointer  :: imp(:,:) => null()     ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Array2d (nrho,nzimp)
endtype

  
type type_source_vec  !    Subtree containing vector source term (radial dimension only)
  real(EUITM_R8),pointer  :: exp(:) => null()     ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Vector (nrho)
  real(EUITM_R8),pointer  :: imp(:) => null()     ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Vector (nrho)
endtype

  
type type_transcoefion  !    Subtree containing transport coefficients from a transport model, for the various ion species, including the energy exchange term 
  real(EUITM_R8),pointer  :: diff_eff(:,:) => null()     ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: vconv_eff(:,:) => null()     ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: exchange(:,:) => null()     ! /exchange - Ion to electron energy exchange [W.m^-3]. Time-dependent. Matrix(nrho,nion).
  real(EUITM_R8),pointer  :: qgi(:,:) => null()     ! /qgi - Energy exchange term due to transport. [W.m^-3]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: flux(:,:) => null()     ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=-999999999       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_transcoefel  !    Subtree containing transport coefficients from a transport model, for the electrons
  real(EUITM_R8),pointer  :: diff_eff(:) => null()     ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Vector (nrho)
  real(EUITM_R8),pointer  :: vconv_eff(:) => null()     ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Vector (nrho)
  real(EUITM_R8),pointer  :: flux(:) => null()     ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagel) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=-999999999       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_transcoefvtor  !    Subtree containing transport coefficients from a transport model, for the various ion species
  real(EUITM_R8),pointer  :: diff_eff(:,:) => null()     ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: vconv_eff(:,:) => null()     ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: flux(:,:) => null()     ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=-999999999       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_transcoefimp  !    Subtree containing transport coefficients from a transport model, for the various impurity species (multiple charge states)
  real(EUITM_R8),pointer  :: diff_eff(:,:) => null()     ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Array2d (nrho,nzimp)
  real(EUITM_R8),pointer  :: vconv_eff(:,:) => null()     ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Array2d (nrho,nzimp)
  real(EUITM_R8),pointer  :: exchange(:,:) => null()     ! /exchange - Ion to electron energy exchange [W.m^-3]. Time-dependent. Array2d (nrho,nzimp)
  real(EUITM_R8),pointer  :: flux(:,:) => null()     ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  integer  :: flag=-999999999       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_lineintegraldiag  !    General line integral diagnostic
  type (type_datainfo) :: datainfo  ! /datainfo - 
  character(len=132), dimension(:), pointer ::expression => null()       ! /expression - Formal expression for the line integral to be evaluated as a function of ne, ni, Te, Ti, Zeff, Br, B
  type (type_setup_line) :: setup_line  ! /setup_line - Geometric description of the lines of sight
  type (type_exp1D) :: measure  ! /measure - Measured value. Time-dependent; Vector (nchords)
  type (type_codeparam) :: codeparam  ! /codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Time [s]; Time-dependent; Scalar
endtype

  
type type_limiter_unit  !    Vector of limiting surfaces. Replicate this limiter_unit element ncomponents times. Each unit contains a plasma facing component t
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name or description of the limiter_unit
  character(len=132), dimension(:), pointer ::closed => null()       ! /closed - Identify whether the contour is closed (y) or open (n)
  type (type_rz1D) :: position  ! /position - Position (R,Z coordinates) of a limiting surface. No need to repeat first point for closed contours 
  real(EUITM_R8)  :: eta=-9.0E40_EUITM_R8       ! /eta - Wall resistivity [ohm.m]; Scalar
  real(EUITM_R8)  :: delta=-9.0E40_EUITM_R8       ! /delta - Wall thickness [m] (Optional if a closed facing component is given but useful for simpler closed con
  real(EUITM_R8)  :: permeability=-9.0E40_EUITM_R8       ! /permeability - Vessel relative permeability; Scalar
endtype

  
type type_weighted_markers  !    Array of NMARK weighted markers in NDIM dimensions
  type (type_identifier),pointer :: variable_ids(:) => null()  ! /variable_ids(i) - Identifier for the variable_ids stored in the coord matrix (see coordinate_identifier_definitions in
  real(EUITM_R8),pointer  :: coord(:,:) => null()     ! /coord - Coordinates of the markers. The coordinates used is specified in variable_ids. Time-dependent; Float
  real(EUITM_R8),pointer  :: weight(:) => null()     ! /weight - Weight of the marker; number of real particles represented by the marker. Time-dependent; Float(NMAR
endtype
  
type type_b0r0_mask  !    Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, normalisation used by the ETS
  integer  :: r0=0       ! /r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  integer  :: b0=0       ! /b0 - Vacuum field at r0 [T]; Positive sign means anti-clockwise when viewed from above. Scalar. Time-depe
endtype
  
type type_boundaryel_mask  !    Structure for the boundary condition of core transport equations (electrons) Time-dependent;
  integer  :: value=0       ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  integer  :: source=0       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=0       ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  integer  :: rho_tor=0       ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype
  
type type_boundaryion_mask  !    Structure for the boundary condition of core transport equations (ions) Time-dependent
  integer  :: value=0       ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  integer  :: source=0       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=0       ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  integer  :: rho_tor=0       ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype
  
type type_complexgrid_space_mask  !    Description of a grid space
  integer  :: geotype=0       ! /geotype - Type of space geometry (id flags). Flags defining how the geometry (objects.geo) fields associated w
  integer  :: geotypeid=0       ! /geotypeid - Type of space geometries (id string). See geotype.
  integer  :: coordtype=0       ! /coordtype - Type of coordinates describing the physical space. Vector (number of space dimensions); The size of 
  type (type_objects_mask),pointer :: objects(:) => null()  ! /objects(i) - Definition of the space objects.; Array of structures (dimension of highest-dimensional objects).; F
  integer  :: xpoints=0       ! /xpoints - List of indices of all nodes which are x-points. Vector (number of x-points)
endtype
  
type type_complexgrid_indexlist_mask  !    An index list describing a list of indices or a range of indices.; If the explicit index list ind is defined and has nonzero size,
  integer  :: range=0       ! /range - Defines an index range enumerating from range[1] to range[2] (with both range[1] and range[2] includ
  integer  :: ind=0       ! /ind - An explicit list of indices. If this member is defined and has nonzero size, the list is assumed to 
endtype
  
type type_complexgrid_objectlist_mask  !    A list of grid objects with a common class, either in explicit of implicit form.; The list is explicit if the matrix ind is given 
  integer  :: cls=0       ! /cls - Class tuple of the grid objects in this object list. Vector (number of grid spaces)
  type (type_complexgrid_indexlist_mask),pointer :: indset(:) => null()  ! /indset(i) - Implicit list of the object indices.;  Array of structures (number of grid spaces = length of index 
  integer  :: ind=0       ! /ind - Explicit list of index tuples. Matrix (number of objects, number of spaces in grid).; First dimensio
endtype
  
type type_complexgrid_subgrid_mask  !    Subgrid definition. A subgrid is a list of grid objects, given as a list of explict or implicit object lists.
  integer  :: id=0       ! /id - ID string (name) of the subgrid.
  type (type_complexgrid_objectlist_mask),pointer :: list(:) => null()  ! /list(i) - List of object lists. Array of structures (number of object lists).
endtype
  
type type_complexgrid_scalar_simplestruct_mask  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: subgrid=0       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
        			
  integer  :: scalar=0       ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  integer  :: vector=0       ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  integer  :: matrix=0       ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype
  
type type_complexgrid_scalar_mask  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=0       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  integer  :: scalar=0       ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  integer  :: vector=0       ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  integer  :: matrix=0       ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype
  
type type_complexgrid_scalar_int_mask  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=0       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  integer  :: scalar=0       ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  integer  :: vector=0       ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  integer  :: matrix=0       ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype
  
type type_complexgrid_scalar_cplx_mask  !    A quantity stored on a grid. The data is given either as a vector of scalars, vectors or matrices.; Note that the vector and matri
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this scalar quantity is associated with.
  integer  :: subgrid=0       ! /subgrid - Index of the subgrid (as stored in grid.subgrids) the data is stored on.
  integer  :: scalar=0       ! /scalar - Scalar representation of data. One scalar entry is stored per object in the subgrid.; The order is i
  integer  :: vector=0       ! /vector - Vector representation of data. One vector is stored per object in the subgrid. The order is implicit
  integer  :: matrix=0       ! /matrix - Matrix representation of data. One matrix is stored per object in the subgrid. The order is implicit
endtype
  
type type_complexgrid_vector_simplestruct_mask  !    A vector quantity stored on a grid, with components possibly explicitly aligned to a coordinate direction. To be used as simple st
  integer  :: label=0       ! /label - Label describing the data
  type (type_complexgrid_scalar_mask),pointer :: comp(:) => null()  ! /comp(i) - Components of the vector. Vector of griddata(ndim). Time-dependent; FIXME: inherit time-dependence f
  integer  :: align=0       ! /align - Alignment of vector components, numerical flag. Int vector(ndim)
  integer  :: alignid=0       ! /alignid - Alignment of vector components, string description. String vector(ndim)
endtype
  
type type_complexgrid_vector_mask  !    A vector quantity stored on a grid, with components possibly explicitly aligned to a coordinate direction. To be used as array of 
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  integer  :: label=0       ! /label - Label describing the data
  type (type_complexgrid_scalar_mask),pointer :: comp(:) => null()  ! /comp(i) - Components of the vector. Array of structures (number of vector components). Time-dependent; FIXME: 
  integer  :: align=0       ! /align - Alignment flag for vector components. Integer vector (number of vector components).
  integer  :: alignid=0       ! /alignid - Alignment id for vector components. String vector (number of vector components).
  integer  :: basis=0       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
endtype
  
type type_complexgrid_metric_mask  !    Metric information for grid objects
  type (type_complexgrid_scalar_mask),pointer :: measure(:) => null()  ! /measure(i) - Measure of object, i.e. physical size (length for 1d, area for 2d, volume for 3d objects). [m^dim].;
  type (type_complexgrid_scalar_mask),pointer :: g11(:) => null()  ! /g11(i) - Metric coefficients g11. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: g12(:) => null()  ! /g12(i) - Metric coefficients g12. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: g13(:) => null()  ! /g13(i) - Metric coefficients g13. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: g22(:) => null()  ! /g22(i) - Metric coefficients g22. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: g23(:) => null()  ! /g23(i) - Metric coefficients g23. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: g33(:) => null()  ! /g33(i) - Metric coefficients g33. Array of structures (number of subgrids this information is stored on)
  type (type_complexgrid_scalar_mask),pointer :: jacobian(:) => null()  ! /jacobian(i) - Jacobian. Array of structures (number of subgrids this information is stored on)
endtype
  
type type_complexgrid_geo_global_mask  !    Geometry information for implicitly defined grid objects (which cannot be stored in the space definitions); Array of structures (n
  integer  :: geotype=0       ! /geotype - Type of geometry (id flag). A flag defining how the geometry data associated with grid objects is to
  integer  :: geotypeid=0       ! /geotypeid - Type of geometry (id string). 
  integer  :: coordtype=0       ! /coordtype - Type of coordinates describing the physical space. Vector (number of space dimensions); The size of 
  type (type_complexgrid_scalar_mask),pointer :: geo_matrix(:) => null()  ! /geo_matrix(i) - Geometry data matrix associated with implicit objects. Array of structures (number of subgrids this 
  type (type_complexgrid_scalar_mask),pointer :: measure(:) => null()  ! /measure(i) - Measure of object, i.e. physical size (length for 1d, area for 2d, volume for 3d objects) in this ge
endtype
  
type type_complexgrid_mask  !    Generic definition of a complex grid
  integer  :: uid=0       ! /uid - Unique index of this grid. Used for handling multiple grids
  integer  :: id=0       ! /id - Name / identifier string for this grid
  type (type_complexgrid_space_mask),pointer :: spaces(:) => null()  ! /spaces(i) - Definitions of grid spaces. Array of structures (number of spaces)
  type (type_complexgrid_subgrid_mask),pointer :: subgrids(:) => null()  ! /subgrids(i) - Definitions of subgrids. Array of structures (number of subgrids)
  type (type_complexgrid_metric_mask) :: metric  ! /metric - Metric coefficients
  type (type_complexgrid_geo_global_mask),pointer :: geo(:) => null()  ! /geo(i) - Geometry data for implicit objects
  type (type_complexgrid_vector_mask),pointer :: bases(:) => null()  ! /bases(i) - Vector bases. Used for aligned vector representation. Time-dependent (added systematically for the C
endtype
  
type type_identifier_mask  !    Standard type for identifiers. The three fields: id, flag and description are all representations of the same information. Associa
  integer  :: id=0       ! /id - Short string identifier
  integer  :: flag=0       ! /flag - Integer identifier
  integer  :: description=0       ! /description - Verbose description of identifier
endtype
  
type type_composition_neutrals_neutcomp_mask  !    Array of components to the atom or molecule. Vector (ncomp)
  integer  :: nucindex=0       ! /nucindex - Index into list of nuclei; int
  integer  :: multiplicity=0       ! /multiplicity - Multiplicity of the atom; int
endtype
  
type type_composition_neutralscomp_mask  !    Array of neutrals.
  type (type_composition_neutrals_neutcomp_mask),pointer :: neutcomp(:) => null()  ! /neutcomp(i) - Array of components to the atom or molecule. Vector (ncomp)
  type (type_identifier_mask),pointer :: type(:) => null()  ! /type(i) - Type of neutral, in terms of energy : 0=cold, 1=thermal, 2= fast, 3=NBI. Vector (ntype) of identifie
  integer  :: label=0       ! /label - String identifying the atom or molecule (e.g. D2, DT, CD4, ...)
endtype
  
type type_compositions_type_mask  !    Generic declaration of Plasma composition for a simulation
  type (type_nuclei_mask),pointer :: nuclei(:) => null()  ! /nuclei(i) - Array of nuclei considered.
  type (type_ions_mask),pointer :: ions(:) => null()  ! /ions(i) - Array of main plasma ions.
  type (type_impurities_mask),pointer :: impurities(:) => null()  ! /impurities(i) - Array of impurities.
  type (type_composition_neutralscomp_mask),pointer :: neutralscomp(:) => null()  ! /neutralscomp(i) - Array of neutrals.
  type (type_edgespecies_mask),pointer :: edgespecies(:) => null()  ! /edgespecies(i) - Array of edge species.
  type (type_identifier_mask) :: signature  ! /signature - Identifier for species choices. The goal of this is to uniquely capture the species blocks so that i
endtype
  
type type_entry_def_mask  !    Structure defining a database entry
  integer  :: user=0       ! /user - Name of the user if private data. Value should be ITM if stored in the official common ITM tree
  integer  :: machine=0       ! /machine - Name of the device
  integer  :: shot=0       ! /shot - Shot number
  integer  :: run=0       ! /run - Run number
endtype
  
type type_exp0D_mask  !    Structure for experimental time-dependent scalar signal
  integer  :: value=0       ! /value - Signal value; Time-dependent; Scalar
  integer  :: abserror=0       ! /abserror - Absolute error on signal; Time-dependent; Scalar
  integer  :: relerror=0       ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Scalar
endtype
  
type type_exp1D_mask  !    Structure for experimental 1D signal
  integer  :: value=0       ! /value - Signal value; Time-dependent; Vector
  integer  :: abserror=0       ! /abserror - Absolute error on signal; Time-dependent; Vector
  integer  :: relerror=0       ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Vector
endtype
  
type type_exp2D_mask  !    Structure for experimental 2D signal
  integer  :: value=0       ! /value - Signal value; Time-dependent; Matrix
  integer  :: abserror=0       ! /abserror - Absolute error on signal; Time-dependent; Matrix
  integer  :: relerror=0       ! /relerror - Relative error on signal (normalised to signal value); Time-dependent; Matrix
endtype
  
type type_enum_instance_mask  !    Specifies a specific enumerated instance of an object or process in term of its type, name and an index. E.g. the input could be t
  type (type_identifier_mask) :: type  ! /type - Identify the type of the object or process.
  integer  :: name=0       ! /name - The name of the object or process. Here the object should be an instans of the type specified in the
  integer  :: index=0       ! /index - Index the separating objects or processes with the same name.
endtype
  
type type_equatorial_plane_mask  !    Description of the equitorial plane or any other omnigeuous surfaces. Time-dependent
  integer  :: r=0       ! /r - Major radius coordinate of the equitorial plane (m). Time-dependent; Vector(n_equitorial_grid)
  integer  :: z=0       ! /z - Major radius coordinate of the equitorial plane (m). Time-dependent; Vector(n_equitorial_grid)
  integer  :: s=0       ! /s - Distance along the poloidal projection of the equitorial plane (m). Here s=0 should be at the magnet
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0 is the reference magne
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], evaluated without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vec
  integer  :: b_mod=0       ! /b_mod - The modulous of the magnetic field along the equitorial plane, or more generally of the omnigeuous s
endtype
  
type type_fast_thermal_separation_filter_mask  !    Description of how the fast and the thermal particle populations were separated.
  type (type_identifier_mask) :: method  ! /method - Identifier describing the method used to separate the fast and thermal particle population (see fast
  integer  :: energy_sep=0       ! /energy_sep - Energy at which the fast and thermal particle populations were separated [eV]. Vector (nrho). Time-d
endtype
  
type type_offdiagel_mask  !    Subtree containing the full transport matrix from a transport model, for the electrons. Time-dependent.
  integer  :: d_ni=0       ! /d_ni - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  integer  :: d_ti=0       ! /d_ti - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  integer  :: d_ne=0       ! /d_ne - Off-Diagonal term coupling electron density gradient to the transport equation [m.^2.s^-1]. Time-dep
  integer  :: d_te=0       ! /d_te - Off-Diagonal term coupling electron temperature gradient to the transport equation [m.^2.s^-1]. Time
  integer  :: d_epar=0       ! /d_epar - Off-Diagonal term coupling parallel electric field to the transport equation [m.^2.s^-1]. Time-depen
  integer  :: d_mtor=0       ! /d_mtor - Off-Diagonal term coupling total toroidal momentum to the transport equation [m.^2.s^-1]. Time-depen
endtype
  
type type_offdiagion_mask  !    Subtree containing the full transport matrix from a transport model, for the various ion species
  integer  :: d_ni=0       ! /d_ni - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  integer  :: d_ti=0       ! /d_ti - Off-Diagonal term coupling ion density gradient to the transport equation [m.^2.s^-1]. Time-dependen
  integer  :: d_ne=0       ! /d_ne - Off-Diagonal term coupling electron density gradient to the transport equation [m.^2.s^-1]. Time-dep
  integer  :: d_te=0       ! /d_te - Off-Diagonal term coupling electron temperature gradient to the transport equation [m.^2.s^-1]. Time
  integer  :: d_epar=0       ! /d_epar - Off-Diagonal term coupling parallel electric field to the transport equation [m.^2.s^-1]. Time-depen
  integer  :: d_mtor=0       ! /d_mtor - Off-Diagonal term coupling total toroidal momentum to the transport equation [m.^2.s^-1]. Time-depen
endtype
  
type type_reduced_mask  !    Structure for a reduced data signal (0D data)
  integer  :: value=0       ! /value - Data value; Real
  integer  :: source=0       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal); String
  integer  :: time=0       ! /time - Time (exact time slice used from the time array of the source signal); Real
endtype
  
type type_reggrid_mask  !    Generic structure for a regular grid
  integer  :: dim1=0       ! /dim1 - First dimension values; Vector (ndim1) 
  integer  :: dim2=0       ! /dim2 - Second dimension values; Vector (ndim2) 
endtype
  
type type_rz0D_mask  !    Structure for one (R,Z) position (0D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
endtype
  
type type_rz1D_mask  !    Structure for list of R,Z positions (1D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
endtype
  
type type_rz1Dexp_mask  !    Structure for list of R,Z positions (1D), with R and Z time-depent and experimental.
  integer  :: r=0       ! /r - Major radius [m]. Vector(npoints). Time-dependent
  integer  :: z=0       ! /z - Altitude [m]. Vector(npoints). Time-dependent
endtype
  
type type_rz1D_npoints_mask  !    Structure for list of R,Z positions (1D), with mention of the number of points relevant for a given time slice
  integer  :: r=0       ! /r - Major radius [m]. Vector(max_npoints). Time-dependent
  integer  :: z=0       ! /z - Altitude [m]. Vector(max_npoints). Time-dependent
  integer  :: npoints=0       ! /npoints - Number of meaningful points in the above vectors at a given time slice. Time-dependent
endtype
  
type type_rz2D_mask  !    Structure for list of R,Z positions (2D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
endtype
  
type type_rz3D_mask  !    Structure for list of R,Z positions (3D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
endtype
  
type type_rzphi0D_mask  !    Structure for a single R,Z,phi position (0D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
  integer  :: phi=0       ! /phi - Toroidal angle [rad]
endtype
  
type type_rzphi1D_mask  !    Structure for list of R,Z,phi positions (1D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
  integer  :: phi=0       ! /phi - Toroidal angle [rad]
endtype
  
type type_rzphidrdzdphi1D_mask  !    Structure for list of R,Z,phi positions and width dR dZ dphi (1D)
  integer  :: r=0       ! /r - Position : major radius [m]
  integer  :: z=0       ! /z - Position : altitude [m]
  integer  :: phi=0       ! /phi - Position : toroidal angle [rad]
  integer  :: dr=0       ! /dr - Width : major radius [m]
  integer  :: dz=0       ! /dz - Width : altitude [m]
  integer  :: dphi=0       ! /dphi - Width : toroidal angle [rad]
endtype
  
type type_rzphi1Dexp_mask  !    Structure for list of R,Z,phi positions (1D) with experimental structure (value, abserror, relerror)
  type (type_exp1D_mask) :: r  ! /r - Major radius [m]
  type (type_exp1D_mask) :: z  ! /z - Altitude [m]
  type (type_exp1D_mask) :: phi  ! /phi - Toroidal angle [rad]
endtype
  
type type_rzphi1Dexperimental_mask  !    Structure for list of R,Z,phi positions (1D) with additional appinfo tags to have some nodes both in MD and DM
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
  integer  :: phi=0       ! /phi - Toroidal angle [rad]
endtype
  
type type_rzphi2D_mask  !    Structure for list of R,Z,phi positions (2D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
  integer  :: phi=0       ! /phi - Toroidal angle [rad]
endtype
  
type type_rzphi3D_mask  !    Structure for list of R,Z,phi positions (3D)
  integer  :: r=0       ! /r - Major radius [m]
  integer  :: z=0       ! /z - Altitude [m]
  integer  :: phi=0       ! /phi - Toroidal angle [rad]
endtype
  
type type_xyz0D_mask  !    Structure for a single (x,y,z) position (0D)
  integer  :: x=0       ! /x - Spatial coordinate x [m]
  integer  :: y=0       ! /y - Spatial coordinate y [m]
  integer  :: z=0       ! /z - Spatial coordinate z [m]
endtype
  
type type_trianglexyz_mask  !    Triangular surface described by its three corners: point1, point2, and point3. The normal vector of this triangle is defined to be
  type (type_xyz0D_mask) :: point1  ! /point1 - Point 1 on the triangle
  type (type_xyz0D_mask) :: point2  ! /point2 - Point 2 on the triangle
  type (type_xyz0D_mask) :: point3  ! /point3 - Point 3 on the triangle
endtype
  
type type_rectanglexyz_mask  !    Rectangle defined by its four corners. These form an ordered sequence: point00, point01, point11, point10. Here the first point ca
  type (type_xyz0D_mask) :: point01  ! /point01 - Point 01 on the rectangle
  type (type_xyz0D_mask) :: point11  ! /point11 - Point 11 on the rectangle
  type (type_xyz0D_mask) :: point10  ! /point10 - Point 10 on the rectangle
endtype
  
type type_flat_polygon_mask  !    Polygon lying on a flat surface on a 3D cartesian space (x,y,z). The coordinate system on the surface is defined by the origin, "o
  type (type_xyz0D_mask) :: origin  ! /origin - Origin of the surface coordinate system.
  type (type_xyz0D_mask) :: basis1  ! /basis1 - First basis vector on the surface.
  type (type_xyz0D_mask) :: basis2  ! /basis2 - First basis vector on the surface.
  integer  :: coord1=0       ! /coord1 - First coordinate of the polygon points, conjugate to basis1.
  integer  :: coord2=0       ! /coord2 - Second coordinate of the polygon points, conjugate to basis2.
endtype
  
type type_setup_line_mask  !    Geometric description of the lines of sight for line integral diagnostic
  type (type_rzphi1D_mask) :: pivot_point  ! /pivot_point - Pivot point of each line of sight; Vector (nchords)
  integer  :: horchordang1=0       ! /horchordang1 - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS chord -
  integer  :: verchordang1=0       ! /verchordang1 - Angle of chord with vertical axis (0 for bottom-top chord, Pi for top-bottom chord - see Convention_
  integer  :: width=0       ! /width - Width of the laser beam (1/e) [m]; Vector (nchords)
  type (type_rzphi1D_mask) :: second_point  ! /second_point - Second point defining the line of sight together with the pivot_point. In case the probing wave is r
  integer  :: horchordang2=0       ! /horchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle [rad] of horizontal projection of reflected 
  integer  :: verchordang2=0       ! /verchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle of reflected chord with vertical axis (0 for
  type (type_rzphi1D_mask) :: third_point  ! /third_point - Third point defining the reflected line of sight together with the second_point (undefined if the pr
  integer  :: nchordpoints=0       ! /nchordpoints - Number of points along the viewing chords (used for synthetic diagnostic signal reconstruction)
endtype
  
type type_setup_line_exp_mask  !    Geometric description of the lines of sight for line integral diagnostic with additional appinfo tags to have some nodes both in M
  type (type_rzphi1Dexperimental_mask) :: pivot_point  ! /pivot_point - Pivot point of each line of sight; Vector (nchords)
  integer  :: horchordang1=0       ! /horchordang1 - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS chord -
  integer  :: verchordang1=0       ! /verchordang1 - Angle of chord with vertical axis (0 for bottom-top chord, Pi for top-bottom chord - see Convention_
  integer  :: width=0       ! /width - Width of the laser beam (1/e) [m]; Vector (nchords)
  type (type_rzphi1Dexperimental_mask) :: second_point  ! /second_point - Second point defining the line of sight together with the pivot_point. In case the probing wave is r
  integer  :: horchordang2=0       ! /horchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle [rad] of horizontal projection of reflected 
  integer  :: verchordang2=0       ! /verchordang2 - For reflected l.o.s. only (undefined otherwise) : Angle of reflected chord with vertical axis (0 for
  type (type_rzphi1Dexperimental_mask) :: third_point  ! /third_point - Third point defining the reflected line of sight together with the second_point (undefined if the pr
  integer  :: nchordpoints=0       ! /nchordpoints - Number of points along the viewing chords (used for synthetic diagnostic signal reconstruction)
endtype
  
type type_species_desc_mask  !    Description of a single ion species or bundled charge state.
  integer  :: label=0       ! /label - Name of species
  integer  :: amn=0       ! /amn - Atomic mass number of the species
  integer  :: zn=0       ! /zn - Nuclear charge of the impurity
  integer  :: zmin=0       ! /zmin - Minimum Z of species charge state bundle
  integer  :: zmax=0       ! /zmax - Maximum Z of species charge state bundle
endtype
  
type type_species_reference_mask  !    Defines a reference to a single species in a CPO that includes a compositions structure.
  type (type_identifier_mask) :: type  ! /type - The type species: type.flag=1 for electron source; type.flag=2 for ion source taken from composition
  integer  :: index=0       ! /index - Index of the species. This definition of index depends on the value of type; if the species is an io
endtype
  
type type_source_ion_mask  !    Subtree containing source terms for the various ion species
  integer  :: exp=0       ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Matrix (nrho,nion)
  integer  :: imp=0       ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Matrix (nrho,nion)
endtype
  
type type_source_imp_mask  !    Subtree containing source terms for the impurity species
  integer  :: exp=0       ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Array2d (nrho,nzimp)
  integer  :: imp=0       ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Array2d (nrho,nzimp)
endtype
  
type type_source_vec_mask  !    Subtree containing vector source term (radial dimension only)
  integer  :: exp=0       ! /exp - Explicit source term [same unit as root quantity]. Time-dependent. Vector (nrho)
  integer  :: imp=0       ! /imp - Implicit source term [s^-1.m^-3]. Time-dependent. Vector (nrho)
endtype
  
type type_transcoefion_mask  !    Subtree containing transport coefficients from a transport model, for the various ion species, including the energy exchange term 
  integer  :: diff_eff=0       ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Matrix (nrho,nion)
  integer  :: vconv_eff=0       ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Matrix (nrho,nion)
  integer  :: exchange=0       ! /exchange - Ion to electron energy exchange [W.m^-3]. Time-dependent. Matrix(nrho,nion).
  integer  :: qgi=0       ! /qgi - Energy exchange term due to transport. [W.m^-3]. Time-dependent. Matrix (nrho,nion)
  integer  :: flux=0       ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion_mask) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=0       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_transcoefel_mask  !    Subtree containing transport coefficients from a transport model, for the electrons
  integer  :: diff_eff=0       ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Vector (nrho)
  integer  :: vconv_eff=0       ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Vector (nrho)
  integer  :: flux=0       ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagel_mask) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=0       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_transcoefvtor_mask  !    Subtree containing transport coefficients from a transport model, for the various ion species
  integer  :: diff_eff=0       ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Matrix (nrho,nion)
  integer  :: vconv_eff=0       ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Matrix (nrho,nion)
  integer  :: flux=0       ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion_mask) :: off_diagonal  ! /off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=0       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_transcoefimp_mask  !    Subtree containing transport coefficients from a transport model, for the various impurity species (multiple charge states)
  integer  :: diff_eff=0       ! /diff_eff - Effective diffusivity [m^2.s^-1]. Time-dependent. Array2d (nrho,nzimp)
  integer  :: vconv_eff=0       ! /vconv_eff - Effective convection [m.s^-1]. Time-dependent. Array2d (nrho,nzimp)
  integer  :: exchange=0       ! /exchange - Ion to electron energy exchange [W.m^-3]. Time-dependent. Array2d (nrho,nzimp)
  integer  :: flux=0       ! /flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  integer  :: flag=0       ! /flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_lineintegraldiag_mask  !    General line integral diagnostic
  type (type_datainfo_mask) :: datainfo  ! /datainfo - 
  integer  :: expression=0       ! /expression - Formal expression for the line integral to be evaluated as a function of ne, ni, Te, Ti, Zeff, Br, B
  type (type_setup_line_mask) :: setup_line  ! /setup_line - Geometric description of the lines of sight
  type (type_exp1D_mask) :: measure  ! /measure - Measured value. Time-dependent; Vector (nchords)
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
  integer  :: time=0       ! /time - Time [s]; Time-dependent; Scalar
endtype
  
type type_limiter_unit_mask  !    Vector of limiting surfaces. Replicate this limiter_unit element ncomponents times. Each unit contains a plasma facing component t
  integer  :: name=0       ! /name - Name or description of the limiter_unit
  integer  :: closed=0       ! /closed - Identify whether the contour is closed (y) or open (n)
  type (type_rz1D_mask) :: position  ! /position - Position (R,Z coordinates) of a limiting surface. No need to repeat first point for closed contours 
  integer  :: eta=0       ! /eta - Wall resistivity [ohm.m]; Scalar
  integer  :: delta=0       ! /delta - Wall thickness [m] (Optional if a closed facing component is given but useful for simpler closed con
  integer  :: permeability=0       ! /permeability - Vessel relative permeability; Scalar
endtype
  
type type_weighted_markers_mask  !    Array of NMARK weighted markers in NDIM dimensions
  type (type_identifier_mask),pointer :: variable_ids(:) => null()  ! /variable_ids(i) - Identifier for the variable_ids stored in the coord matrix (see coordinate_identifier_definitions in
  integer  :: coord=0       ! /coord - Coordinates of the markers. The coordinates used is specified in variable_ids. Time-dependent; Float
  integer  :: weight=0       ! /weight - Weight of the marker; number of real particles represented by the marker. Time-dependent; Float(NMAR
endtype

end module ! end of the utilities module

module     euitm_schemas       ! declaration of all CPOs

use euITM_utilities

integer, parameter :: NON_TIMED=0
integer, parameter :: TIMED=1
integer, parameter :: TIMED_CLEAR=2

! ***********  Include amns.xsd
  
type type_amns_constituentType  !    Contains all of the information to characterize an AMNS constituent.
  character(len=132), dimension(:), pointer ::label => null()       ! /label - String identifier for reaction constituent (e.g. "D", "C").
  integer  :: zn=-999999999       ! /zn - Number of protons in the nucleus (nuclear charge); 0 if none (e-, gamma)
  integer  :: mn=-999999999       ! /mn - Number of nucleons in the nucleus (nuclear mass); 0 if none (e-, gamma); Not set if not important (e
  real(EUITM_R8)  :: multiplicity=-9.0E40_EUITM_R8       ! /multiplicity - Multiplicity in the compound
endtype

  
type type_reacprodType  !    Characterizes a reactant or product in an AMNS reaction.
  character(len=132), dimension(:), pointer ::label => null()       ! /label - String identifier for reaction participant (e.g. "D", "e", "W", "CD4", "photon", "n").
  type (type_amns_constituentType),pointer :: constituents(:) => null()  ! /constituents(i) - Array specifying the constituents of this reactant/product; For an atom or ion the array will be of 
  type (type_identifier) :: role  ! /role - Identifier for the role of this paricipant in the reaction. For surface reactions distinguish betwee
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /amn - Mass of the participant (amu).
  integer  :: relative=-999999999       ! /relative - This is a flag indicating that charges are absolute (if set to 0), relative (if 1) or irrelevant (-1
  real(EUITM_R8)  :: za=-9.0E40_EUITM_R8       ! /za - Charge of the participant. Not set if not important (e.g. for a nuclear reaction). For the case wher
  real(EUITM_R8)  :: multiplicity=-9.0E40_EUITM_R8       ! /multiplicity - Multiplicity in the reaction
  integer,pointer  :: metastable(:) => null()      ! /metastable - An array identifying the metastable; if zero-length, then not a metastable; if of length 1, then the
  character(len=132), dimension(:), pointer ::metastable_label => null()       ! /metastable_label - Label identifying in text form the metastable

endtype

  
type type_amns_processType  !    Contains all of the information to characterize an AMNS process; Vector(nprocs).
  character(len=132), dimension(:), pointer ::proc_label => null()       ! /proc_label - Label for process (e.g. EI, RC; could also include error estimates)
  type (type_reacprodType),pointer :: reactant(:) => null()  ! /reactant(i) - Array of reactants; Vector(nreac).
  type (type_reacprodType),pointer :: product(:) => null()  ! /product(i) - Array of products; Vector(nprod).
  character(len=132), dimension(:), pointer ::sup_string => null()       ! /sup_string - String array to be used if supplementary information is required.
  real(EUITM_R8),pointer  :: sup_real(:) => null()     ! /sup_real - Real array to be used if supplementary information is required.
  integer,pointer  :: sup_int(:) => null()      ! /sup_int - Int array to be used if supplementary information is required.
  type (type_identifier) :: quality  ! /quality - Characterize the data quality
  character(len=132), dimension(:), pointer ::err_proc_label => null()       ! /err_proc_label - "proc_label" of an associated error table of the same type as the primary quantity
endtype
  
type type_amns_constituentType_mask  !    Contains all of the information to characterize an AMNS constituent.
  integer  :: label=0       ! /label - String identifier for reaction constituent (e.g. "D", "C").
  integer  :: zn=0       ! /zn - Number of protons in the nucleus (nuclear charge); 0 if none (e-, gamma)
  integer  :: mn=0       ! /mn - Number of nucleons in the nucleus (nuclear mass); 0 if none (e-, gamma); Not set if not important (e
  integer  :: multiplicity=0       ! /multiplicity - Multiplicity in the compound
endtype
  
type type_reacprodType_mask  !    Characterizes a reactant or product in an AMNS reaction.
  integer  :: label=0       ! /label - String identifier for reaction participant (e.g. "D", "e", "W", "CD4", "photon", "n").
  type (type_amns_constituentType_mask),pointer :: constituents(:) => null()  ! /constituents(i) - Array specifying the constituents of this reactant/product; For an atom or ion the array will be of 
  type (type_identifier_mask) :: role  ! /role - Identifier for the role of this paricipant in the reaction. For surface reactions distinguish betwee
  integer  :: amn=0       ! /amn - Mass of the participant (amu).
  integer  :: relative=0       ! /relative - This is a flag indicating that charges are absolute (if set to 0), relative (if 1) or irrelevant (-1
  integer  :: za=0       ! /za - Charge of the participant. Not set if not important (e.g. for a nuclear reaction). For the case wher
  integer  :: multiplicity=0       ! /multiplicity - Multiplicity in the reaction
  integer  :: metastable=0       ! /metastable - An array identifying the metastable; if zero-length, then not a metastable; if of length 1, then the
  integer  :: metastable_label=0       ! /metastable_label - Label identifying in text form the metastable

endtype
  
type type_amns_processType_mask  !    Contains all of the information to characterize an AMNS process; Vector(nprocs).
  integer  :: proc_label=0       ! /proc_label - Label for process (e.g. EI, RC; could also include error estimates)
  type (type_reacprodType_mask),pointer :: reactant(:) => null()  ! /reactant(i) - Array of reactants; Vector(nreac).
  type (type_reacprodType_mask),pointer :: product(:) => null()  ! /product(i) - Array of products; Vector(nprod).
  integer  :: sup_string=0       ! /sup_string - String array to be used if supplementary information is required.
  integer  :: sup_real=0       ! /sup_real - Real array to be used if supplementary information is required.
  integer  :: sup_int=0       ! /sup_int - Int array to be used if supplementary information is required.
  type (type_identifier_mask) :: quality  ! /quality - Characterize the data quality
  integer  :: err_proc_label=0       ! /err_proc_label - "proc_label" of an associated error table of the same type as the primary quantity
endtype

  
type type_table  !    Stores the interpolation table (0d to 7d). Only one entry should be used.
  integer  :: filled=-999999999       ! /amns/tables(i)/table(i)/filled - Identifier whether the tables have real data.
  real(EUITM_R8)  :: table_0d=-9.0E40_EUITM_R8       ! /amns/tables(i)/table(i)/table_0d - 
  real(EUITM_R8),pointer  :: table_1d(:) => null()     ! /amns/tables(i)/table(i)/table_1d - 
  real(EUITM_R8),pointer  :: table_2d(:,:) => null()     ! /amns/tables(i)/table(i)/table_2d - 
  real(EUITM_R8),pointer  :: table_3d(:,:,:) => null()     ! /amns/tables(i)/table(i)/table_3d - 
  real(EUITM_R8),pointer  :: table_4d(:,:,:,:) => null()     ! /amns/tables(i)/table(i)/table_4d - 
  real(EUITM_R8),pointer  :: table_5d(:,:,:,:,:) => null()     ! /amns/tables(i)/table(i)/table_5d - 
  real(EUITM_R8),pointer  :: table_6d(:,:,:,:,:,:) => null()     ! /amns/tables(i)/table(i)/table_6d - 
  character(len=132), dimension(:), pointer ::coord1_str => null()       ! /amns/tables(i)/table(i)/coord1_str - If needed, an array of strings describing coordinate 1
  character(len=132), dimension(:), pointer ::coord2_str => null()       ! /amns/tables(i)/table(i)/coord2_str - If needed, an array of strings describing coordinate 2
  character(len=132), dimension(:), pointer ::coord3_str => null()       ! /amns/tables(i)/table(i)/coord3_str - If needed, an array of strings describing coordinate 3
  character(len=132), dimension(:), pointer ::coord4_str => null()       ! /amns/tables(i)/table(i)/coord4_str - If needed, an array of strings describing coordinate 4
  character(len=132), dimension(:), pointer ::coord5_str => null()       ! /amns/tables(i)/table(i)/coord5_str - If needed, an array of strings describing coordinate 5
  character(len=132), dimension(:), pointer ::coord6_str => null()       ! /amns/tables(i)/table(i)/coord6_str - If needed, an array of strings describing coordinate 6
  type (type_identifier) :: quality  ! /amns/tables(i)/table(i)/quality - Characterize the data quality
endtype

  
type type_coords  !    Specification of coordinates in one dimension. Can be either a range of real values or a set of discrete values (if interp_type=0)
  real(EUITM_R8),pointer  :: coord(:) => null()     ! /amns/tables_coord(i)/coords(i)/coord - Coordinate values. Vector(npoints).
  character(len=132), dimension(:), pointer ::coord_label => null()       ! /amns/tables_coord(i)/coords(i)/coord_label - String description of discrete coordinate values (if interp_type=0). Vector(npoints). E.g., for spec
  integer,pointer  :: extrap_type(:) => null()      ! /amns/tables_coord(i)/coords(i)/extrap_type - Extrapolation strategy when leaving the domain. Vector(2). Entry 1: behaviour at lower bound, entry 
  integer  :: interp_type=-999999999       ! /amns/tables_coord(i)/coords(i)/interp_type - Interpolation strategy in this coordinate direction. Integer flag: 0=discrete (no interpolation); 1=
  character(len=132), dimension(:), pointer ::label => null()       ! /amns/tables_coord(i)/coords(i)/label - Description of coordinate (e.g. "Electron temperature")
  character(len=132), dimension(:), pointer ::unit => null()       ! /amns/tables_coord(i)/coords(i)/unit - Units of coordinate (e.g. [eV])
  integer  :: transform=-999999999       ! /amns/tables_coord(i)/coords(i)/transform - Coordinate transformation applied to coordinate values stored in coord. Integer flag: 0=none; 1=log1
  integer  :: spacing=-999999999       ! /amns/tables_coord(i)/coords(i)/spacing - Flag for specific coordinate spacing (for optimization purposes). Integer flag: 0=undefined; 1=unifo
endtype

  
type type_data_release  !    Stores information about each entry available at this version.
  integer  :: shot=-999999999       ! /amns/version_ind(i)/data_release(i)/shot - Shot number = Mass*100+Nuclear_charge.
  integer  :: run=-999999999       ! /amns/version_ind(i)/data_release(i)/run - Which run number is the active run number for this version.
  character(len=132), dimension(:), pointer ::description => null()       ! /amns/version_ind(i)/data_release(i)/description - Possible description of why this version of the data is the current version.
endtype
  
type type_table_mask  !    Stores the interpolation table (0d to 7d). Only one entry should be used.
  integer  :: filled=0       ! /amns/tables(i)/table(i)/filled - Identifier whether the tables have real data.
  integer  :: table_0d=0       ! /amns/tables(i)/table(i)/table_0d - 
  integer  :: table_1d=0       ! /amns/tables(i)/table(i)/table_1d - 
  integer  :: table_2d=0       ! /amns/tables(i)/table(i)/table_2d - 
  integer  :: table_3d=0       ! /amns/tables(i)/table(i)/table_3d - 
  integer  :: table_4d=0       ! /amns/tables(i)/table(i)/table_4d - 
  integer  :: table_5d=0       ! /amns/tables(i)/table(i)/table_5d - 
  integer  :: table_6d=0       ! /amns/tables(i)/table(i)/table_6d - 
  integer  :: coord1_str=0       ! /amns/tables(i)/table(i)/coord1_str - If needed, an array of strings describing coordinate 1
  integer  :: coord2_str=0       ! /amns/tables(i)/table(i)/coord2_str - If needed, an array of strings describing coordinate 2
  integer  :: coord3_str=0       ! /amns/tables(i)/table(i)/coord3_str - If needed, an array of strings describing coordinate 3
  integer  :: coord4_str=0       ! /amns/tables(i)/table(i)/coord4_str - If needed, an array of strings describing coordinate 4
  integer  :: coord5_str=0       ! /amns/tables(i)/table(i)/coord5_str - If needed, an array of strings describing coordinate 5
  integer  :: coord6_str=0       ! /amns/tables(i)/table(i)/coord6_str - If needed, an array of strings describing coordinate 6
  type (type_identifier_mask) :: quality  ! /amns/tables(i)/table(i)/quality - Characterize the data quality
endtype
  
type type_coords_mask  !    Specification of coordinates in one dimension. Can be either a range of real values or a set of discrete values (if interp_type=0)
  integer  :: coord=0       ! /amns/tables_coord(i)/coords(i)/coord - Coordinate values. Vector(npoints).
  integer  :: coord_label=0       ! /amns/tables_coord(i)/coords(i)/coord_label - String description of discrete coordinate values (if interp_type=0). Vector(npoints). E.g., for spec
  integer  :: extrap_type=0       ! /amns/tables_coord(i)/coords(i)/extrap_type - Extrapolation strategy when leaving the domain. Vector(2). Entry 1: behaviour at lower bound, entry 
  integer  :: interp_type=0       ! /amns/tables_coord(i)/coords(i)/interp_type - Interpolation strategy in this coordinate direction. Integer flag: 0=discrete (no interpolation); 1=
  integer  :: label=0       ! /amns/tables_coord(i)/coords(i)/label - Description of coordinate (e.g. "Electron temperature")
  integer  :: unit=0       ! /amns/tables_coord(i)/coords(i)/unit - Units of coordinate (e.g. [eV])
  integer  :: transform=0       ! /amns/tables_coord(i)/coords(i)/transform - Coordinate transformation applied to coordinate values stored in coord. Integer flag: 0=none; 1=log1
  integer  :: spacing=0       ! /amns/tables_coord(i)/coords(i)/spacing - Flag for specific coordinate spacing (for optimization purposes). Integer flag: 0=undefined; 1=unifo
endtype
  
type type_data_release_mask  !    Stores information about each entry available at this version.
  integer  :: shot=0       ! /amns/version_ind(i)/data_release(i)/shot - Shot number = Mass*100+Nuclear_charge.
  integer  :: run=0       ! /amns/version_ind(i)/data_release(i)/run - Which run number is the active run number for this version.
  integer  :: description=0       ! /amns/version_ind(i)/data_release(i)/description - Possible description of why this version of the data is the current version.
endtype

  
type type_tables  !    Definition of a process
  integer  :: ndim=-999999999       ! /amns/tables(i)/ndim - Table dimensionality of the process. Indicates which of the tables is filled.
  integer  :: coord_index=-999999999       ! /amns/tables(i)/coord_index - Index in tables_coord, specifying what coordinate specification to use for this table.
  character(len=132), dimension(:), pointer ::result_label => null()       ! /amns/tables(i)/result_label - Description of the process result (rate, cross section, sputtering yield, ...)
  character(len=132), dimension(:), pointer ::result_unit => null()       ! /amns/tables(i)/result_unit - Unit of the process result
  integer  :: result_trans=-999999999       ! /amns/tables(i)/result_trans - Transformation of the process result. Integer flag: 0=no transformation; 1=10^; 2=exp()
  integer,pointer  :: zmin(:) => null()      ! /amns/tables(i)/zmin - Minimum charge state [units of elementary charge]; if equal to zmax then no bundling; Vector(ncharge
  integer,pointer  :: zmax(:) => null()      ! /amns/tables(i)/zmax - Maximum charge state [units of elementary charge]; if equal to zmin then no bundling; Vector(ncharge
  character(len=132), dimension(:), pointer ::state_label => null()       ! /amns/tables(i)/state_label - Label for charge state (e.g. D0, D1+, ...); Vector(nchargestates)
  type (type_table),pointer :: table(:) => null()  ! /amns/tables(i)/table(i) - Array of data tables, one entry per species. Vector(nchargestates)
  character(len=132), dimension(:), pointer ::data_source => null()       ! /amns/tables(i)/data_source - Filename or subroutine name used to provide this data.
  character(len=132), dimension(:), pointer ::data_provide => null()       ! /amns/tables(i)/data_provide - ITM responsible person for this data.
  character(len=132), dimension(:), pointer ::data_citation => null()       ! /amns/tables(i)/data_citation - Reference to publication(s).
endtype

  
type type_tables_coord  !    Definition of coordinates for one specific coordinate system used in one or more tables.
  type (type_coords),pointer :: coords(:) => null()  ! /amns/tables_coord(i)/coords(i) - Vector(ndim) of coordinates. ndim is number of parameters for a process.
endtype

  
type type_version_ind  !    
  character(len=132), dimension(:), pointer ::description => null()       ! /amns/version_ind(i)/description - Description of each version.
  character(len=132), dimension(:), pointer ::releasedate => null()       ! /amns/version_ind(i)/releasedate - Release date
  type (type_data_release),pointer :: data_release(:) => null()  ! /amns/version_ind(i)/data_release(i) - For this release, an array over each data item (i.e. shot/run pair containing the actual data) inclu
endtype
  
type type_tables_mask  !    Definition of a process
  integer  :: ndim=0       ! /amns/tables(i)/ndim - Table dimensionality of the process. Indicates which of the tables is filled.
  integer  :: coord_index=0       ! /amns/tables(i)/coord_index - Index in tables_coord, specifying what coordinate specification to use for this table.
  integer  :: result_label=0       ! /amns/tables(i)/result_label - Description of the process result (rate, cross section, sputtering yield, ...)
  integer  :: result_unit=0       ! /amns/tables(i)/result_unit - Unit of the process result
  integer  :: result_trans=0       ! /amns/tables(i)/result_trans - Transformation of the process result. Integer flag: 0=no transformation; 1=10^; 2=exp()
  integer  :: zmin=0       ! /amns/tables(i)/zmin - Minimum charge state [units of elementary charge]; if equal to zmax then no bundling; Vector(ncharge
  integer  :: zmax=0       ! /amns/tables(i)/zmax - Maximum charge state [units of elementary charge]; if equal to zmin then no bundling; Vector(ncharge
  integer  :: state_label=0       ! /amns/tables(i)/state_label - Label for charge state (e.g. D0, D1+, ...); Vector(nchargestates)
  type (type_table_mask),pointer :: table(:) => null()  ! /amns/tables(i)/table(i) - Array of data tables, one entry per species. Vector(nchargestates)
  integer  :: data_source=0       ! /amns/tables(i)/data_source - Filename or subroutine name used to provide this data.
  integer  :: data_provide=0       ! /amns/tables(i)/data_provide - ITM responsible person for this data.
  integer  :: data_citation=0       ! /amns/tables(i)/data_citation - Reference to publication(s).
endtype
  
type type_tables_coord_mask  !    Definition of coordinates for one specific coordinate system used in one or more tables.
  type (type_coords_mask),pointer :: coords(:) => null()  ! /amns/tables_coord(i)/coords(i) - Vector(ndim) of coordinates. ndim is number of parameters for a process.
endtype
  
type type_version_ind_mask  !    
  integer  :: description=0       ! /amns/version_ind(i)/description - Description of each version.
  integer  :: releasedate=0       ! /amns/version_ind(i)/releasedate - Release date
  type (type_data_release_mask),pointer :: data_release(:) => null()  ! /amns/version_ind(i)/data_release(i) - For this release, an array over each data item (i.e. shot/run pair containing the actual data) inclu
endtype

  
type type_amns  !    Description of AMNS processes for one species.
  type (type_datainfo) :: datainfo  ! /amns/datainfo - 
  character(len=132), dimension(:), pointer ::version => null()       ! /amns/version - Version of the data.
  character(len=132), dimension(:), pointer ::source => null()       ! /amns/source - Source of the data.
  integer  :: zn=-999999999       ! /amns/zn - Nuclear charge [units of elementary charge];
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /amns/amn - Mass of atom [amu]
  type (type_amns_processType),pointer :: process(:) => null()  ! /amns/process(i) - Identifiers for processes; Vector(nprocs)
  type (type_tables),pointer :: tables(:) => null()  ! /amns/tables(i) - Rate tables for processes. Vector(nprocs)
  type (type_tables_coord),pointer :: tables_coord(:) => null()  ! /amns/tables_coord(i) - Array of possible coordinate systems for tables. Vector(ncoordbases)
  type (type_version_ind),pointer :: version_ind(:) => null()  ! /amns/version_ind(i) - Array of available releases/versions of the AMNS data; each element contains information about the A
  type (type_codeparam) :: codeparam  ! /amns/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /amns/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_amns_mask  !    Description of AMNS processes for one species.
  type (type_datainfo_mask) :: datainfo  ! /amns/datainfo - 
  integer  :: version=0       ! /amns/version - Version of the data.
  integer  :: source=0       ! /amns/source - Source of the data.
  integer  :: zn=0       ! /amns/zn - Nuclear charge [units of elementary charge];
  integer  :: amn=0       ! /amns/amn - Mass of atom [amu]
  type (type_amns_processType_mask),pointer :: process(:) => null()  ! /amns/process(i) - Identifiers for processes; Vector(nprocs)
  type (type_tables_mask),pointer :: tables(:) => null()  ! /amns/tables(i) - Rate tables for processes. Vector(nprocs)
  type (type_tables_coord_mask),pointer :: tables_coord(:) => null()  ! /amns/tables_coord(i) - Array of possible coordinate systems for tables. Vector(ncoordbases)
  type (type_version_ind_mask),pointer :: version_ind(:) => null()  ! /amns/version_ind(i) - Array of available releases/versions of the AMNS data; each element contains information about the A
  type (type_codeparam_mask) :: codeparam  ! /amns/codeparam - 
  integer  :: time=0       ! /amns/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include antennas.xsd
  
type type_waveguides  !    
  integer  :: nwm_theta=-999999999       ! /modules/waveguides/nwm_theta - Number of waveguides per module in the poloidal direction.
  integer  :: nwm_phi=-999999999       ! /modules/waveguides/nwm_phi - Number of waveguides per module in the toroidal direction.
  integer,pointer  :: mask(:) => null()      ! /modules/waveguides/mask - Mask of passive and active waveguides for an internal module; Vector of integers (nwm_phi)
  integer  :: npwbm_phi=-999999999       ! /modules/waveguides/npwbm_phi - Number of passive waveguide between modules in the toroidal direction
  integer  :: npwe_phi=-999999999       ! /modules/waveguides/npwe_phi - Number of passive waveguides on each antenna edge in the toroidal direction
  real(EUITM_R8)  :: sw_theta=-9.0E40_EUITM_R8       ! /modules/waveguides/sw_theta - Spacing between poloidally neighboring waveguides [m]
  real(EUITM_R8)  :: hw_theta=-9.0E40_EUITM_R8       ! /modules/waveguides/hw_theta - Height of waveguides in the poloidal direction [m]
  real(EUITM_R8)  :: bwa=-9.0E40_EUITM_R8       ! /modules/waveguides/bwa - Width of active waveguides [m]; Float
  real(EUITM_R8)  :: biwp=-9.0E40_EUITM_R8       ! /modules/waveguides/biwp - Width of internal passive waveguides [m]; Float
  real(EUITM_R8)  :: bewp=-9.0E40_EUITM_R8       ! /modules/waveguides/bewp - Width of edge passive waveguides [m]; Float
  real(EUITM_R8),pointer  :: e_phi(:) => null()     ! /modules/waveguides/e_phi - Thickness between waveguides in the toroidal direction [m], Vector (nthick_phi). Reminder : nthick_p
  real(EUITM_R8),pointer  :: scl(:) => null()     ! /modules/waveguides/scl - Short circuit length for passive waveguides [m], Vector (nshort_phi). Reminder : nshort _phi = nmp_p
endtype
  
type type_waveguides_mask  !    
  integer  :: nwm_theta=0       ! /modules/waveguides/nwm_theta - Number of waveguides per module in the poloidal direction.
  integer  :: nwm_phi=0       ! /modules/waveguides/nwm_phi - Number of waveguides per module in the toroidal direction.
  integer  :: mask=0       ! /modules/waveguides/mask - Mask of passive and active waveguides for an internal module; Vector of integers (nwm_phi)
  integer  :: npwbm_phi=0       ! /modules/waveguides/npwbm_phi - Number of passive waveguide between modules in the toroidal direction
  integer  :: npwe_phi=0       ! /modules/waveguides/npwe_phi - Number of passive waveguides on each antenna edge in the toroidal direction
  integer  :: sw_theta=0       ! /modules/waveguides/sw_theta - Spacing between poloidally neighboring waveguides [m]
  integer  :: hw_theta=0       ! /modules/waveguides/hw_theta - Height of waveguides in the poloidal direction [m]
  integer  :: bwa=0       ! /modules/waveguides/bwa - Width of active waveguides [m]; Float
  integer  :: biwp=0       ! /modules/waveguides/biwp - Width of internal passive waveguides [m]; Float
  integer  :: bewp=0       ! /modules/waveguides/bewp - Width of edge passive waveguides [m]; Float
  integer  :: e_phi=0       ! /modules/waveguides/e_phi - Thickness between waveguides in the toroidal direction [m], Vector (nthick_phi). Reminder : nthick_p
  integer  :: scl=0       ! /modules/waveguides/scl - Short circuit length for passive waveguides [m], Vector (nshort_phi). Reminder : nshort _phi = nmp_p
endtype

  
type type_spot  !    
  real(EUITM_R8),pointer  :: size(:) => null()     ! /spot/size - Size of the spot ellipse [m], Vector (2). Time-dependent
  real(EUITM_R8)  :: angle=-9.0E40_EUITM_R8       ! /spot/angle - Rotation angle for the spot ellipse [rd], Float. Time-dependent
endtype

  
type type_phaseellipse  !    
  real(EUITM_R8),pointer  :: invcurvrad(:) => null()     ! /phaseellipse/invcurvrad - Inverse curvature radii for the phase ellipse [m-1], positive/negative for divergent/convergent beam
  real(EUITM_R8)  :: angle=-9.0E40_EUITM_R8       ! /phaseellipse/angle - Rotation angle for the phase ellipse [rd], Float. Time-dependent
endtype

  
type type_modules  !    
  integer  :: nma_theta=-999999999       ! /modules/nma_theta - Number of modules per antenna in the poloidal direction.
  integer  :: nma_phi=-999999999       ! /modules/nma_phi - Number of modules per antenna in the toroidal direction.
  integer,pointer  :: ima_theta(:) => null()      ! /modules/ima_theta - Position index of the module in the poloidal direction (from low theta to high theta, i.e. from bott
  integer,pointer  :: ima_phi(:) => null()      ! /modules/ima_phi - Position index of the module in the toroidal direction (from low phi to high phi, counter-clockwise 
  real(EUITM_R8)  :: sm_theta=-9.0E40_EUITM_R8       ! /modules/sm_theta - Spacing between poloidally neighboring modules [m]
  type (type_exp1D) :: amplitude  ! /modules/amplitude - Amplitude of the TE10 mode injected in the module [W], Vector exp1d (nmodules). Time-dependent
  type (type_exp1D) :: phase  ! /modules/phase - Phase of the TE10 mode injected in the module [radians], Vector exp1d (nmodules). Time-dependent
  type (type_waveguides) :: waveguides  ! /modules/waveguides - Waveguides description
endtype

  
type type_straps  !    
  type (type_exp0D) :: current  ! /straps(i)/current - Root mean square current flowing along the strap [A]; Time-Dependent; Float
  type (type_exp0D) :: phase  ! /straps(i)/phase - Phase of strap current [rad]; Time-dependent; exp0D
  real(EUITM_R8)  :: phi_centre=-9.0E40_EUITM_R8       ! /straps(i)/phi_centre - Toroidal angle at the centre of the strap [rad]; Float
  real(EUITM_R8)  :: width=-9.0E40_EUITM_R8       ! /straps(i)/width - Width of strap in the toroidal direction [m]; Float
  real(EUITM_R8)  :: dist2wall=-9.0E40_EUITM_R8       ! /straps(i)/dist2wall - Distance to conducting wall or other conducter behind the antenna straps [m]; Float
  type (type_rz1D) :: coord_strap  ! /straps(i)/coord_strap - Coordinates (R,z) of polygon describing the antenna in the poloidal plane; rz1d vector (ncoord_strap
endtype

  
type type_current  !    
  integer,pointer  :: mpol(:) => null()      ! /current/mpol - Poloidal modes, used to describe the spectrum of the antenna current. The poloidal angle is defined 
  integer,pointer  :: ntor(:) => null()      ! /current/ntor - Toroidal modes, used to describe the spectrum of the antenna current. Time-Dependent; Integer(n_toro
  type (type_exp1D) :: spectrum  ! /current/spectrum - Spectrum of the total surface current on the antenna strap and passive components expressed in poloi
  type (type_rz0D) :: rz_reference  ! /current/rz_reference - Reference point used to define the poloidal angle, e.g. the geometrical centre of the vacuum vessel.
endtype
  
type type_spot_mask  !    
  integer  :: size=0       ! /spot/size - Size of the spot ellipse [m], Vector (2). Time-dependent
  integer  :: angle=0       ! /spot/angle - Rotation angle for the spot ellipse [rd], Float. Time-dependent
endtype
  
type type_phaseellipse_mask  !    
  integer  :: invcurvrad=0       ! /phaseellipse/invcurvrad - Inverse curvature radii for the phase ellipse [m-1], positive/negative for divergent/convergent beam
  integer  :: angle=0       ! /phaseellipse/angle - Rotation angle for the phase ellipse [rd], Float. Time-dependent
endtype
  
type type_modules_mask  !    
  integer  :: nma_theta=0       ! /modules/nma_theta - Number of modules per antenna in the poloidal direction.
  integer  :: nma_phi=0       ! /modules/nma_phi - Number of modules per antenna in the toroidal direction.
  integer  :: ima_theta=0       ! /modules/ima_theta - Position index of the module in the poloidal direction (from low theta to high theta, i.e. from bott
  integer  :: ima_phi=0       ! /modules/ima_phi - Position index of the module in the toroidal direction (from low phi to high phi, counter-clockwise 
  integer  :: sm_theta=0       ! /modules/sm_theta - Spacing between poloidally neighboring modules [m]
  type (type_exp1D_mask) :: amplitude  ! /modules/amplitude - Amplitude of the TE10 mode injected in the module [W], Vector exp1d (nmodules). Time-dependent
  type (type_exp1D_mask) :: phase  ! /modules/phase - Phase of the TE10 mode injected in the module [radians], Vector exp1d (nmodules). Time-dependent
  type (type_waveguides_mask) :: waveguides  ! /modules/waveguides - Waveguides description
endtype
  
type type_straps_mask  !    
  type (type_exp0D_mask) :: current  ! /straps(i)/current - Root mean square current flowing along the strap [A]; Time-Dependent; Float
  type (type_exp0D_mask) :: phase  ! /straps(i)/phase - Phase of strap current [rad]; Time-dependent; exp0D
  integer  :: phi_centre=0       ! /straps(i)/phi_centre - Toroidal angle at the centre of the strap [rad]; Float
  integer  :: width=0       ! /straps(i)/width - Width of strap in the toroidal direction [m]; Float
  integer  :: dist2wall=0       ! /straps(i)/dist2wall - Distance to conducting wall or other conducter behind the antenna straps [m]; Float
  type (type_rz1D_mask) :: coord_strap  ! /straps(i)/coord_strap - Coordinates (R,z) of polygon describing the antenna in the poloidal plane; rz1d vector (ncoord_strap
endtype
  
type type_current_mask  !    
  integer  :: mpol=0       ! /current/mpol - Poloidal modes, used to describe the spectrum of the antenna current. The poloidal angle is defined 
  integer  :: ntor=0       ! /current/ntor - Toroidal modes, used to describe the spectrum of the antenna current. Time-Dependent; Integer(n_toro
  type (type_exp1D_mask) :: spectrum  ! /current/spectrum - Spectrum of the total surface current on the antenna strap and passive components expressed in poloi
  type (type_rz0D_mask) :: rz_reference  ! /current/rz_reference - Reference point used to define the poloidal angle, e.g. the geometrical centre of the vacuum vessel.
endtype

  
type type_rfbeam  !    Beam characteristics
  type (type_spot) :: spot  ! /spot - Spot characteristics
  type (type_phaseellipse) :: phaseellipse  ! /phaseellipse - Phase ellipse characteristics
endtype

  
type type_antennalh_setup  !    Detailed description of LH antennas
  type (type_modules) :: modules  ! /modules - Modules description. NB there are nmodules per antenna, distributed among nma_phi toroidal positions
endtype

  
type type_antennaic_setup  !    Detailed description of an ICRH antenna; hardware and settings
  type (type_straps),pointer :: straps(:) => null()  ! /straps(i) - Properties of the IC antenna strap; Time-dependent; Vector(nstraps)
  type (type_current) :: current  ! /current - Description of the IC surface currents on the antenna straps and on passive components.
endtype
  
type type_rfbeam_mask  !    Beam characteristics
  type (type_spot_mask) :: spot  ! /spot - Spot characteristics
  type (type_phaseellipse_mask) :: phaseellipse  ! /phaseellipse - Phase ellipse characteristics
endtype
  
type type_antennalh_setup_mask  !    Detailed description of LH antennas
  type (type_modules_mask) :: modules  ! /modules - Modules description. NB there are nmodules per antenna, distributed among nma_phi toroidal positions
endtype
  
type type_antennaic_setup_mask  !    Detailed description of an ICRH antenna; hardware and settings
  type (type_straps_mask),pointer :: straps(:) => null()  ! /straps(i) - Properties of the IC antenna strap; Time-dependent; Vector(nstraps)
  type (type_current_mask) :: current  ! /current - Description of the IC surface currents on the antenna straps and on passive components.
endtype

  
type type_launchangles  !    
  real(EUITM_R8)  :: alpha=-9.0E40_EUITM_R8       ! /antennas/antenna_ec(i)/launchangles/alpha - Poloidal launching angle between the horizontal plane and the poloidal component of the nominal beam
  real(EUITM_R8)  :: beta=-9.0E40_EUITM_R8       ! /antennas/antenna_ec(i)/launchangles/beta - Toroidal launching angle between the poloidal plane and the nominal beam centerline [rad], Sin(beta)
endtype

  
type type_plasmaedge  !    
  integer  :: npoints=-999999999       ! /antennas/antenna_lh(i)/plasmaedge/npoints - Number of points in the distance grid. Integer
  real(EUITM_R8),pointer  :: distance(:) => null()     ! /antennas/antenna_lh(i)/plasmaedge/distance - Grid for electron density, defined as the perpendicular distance to the antenna waveguide plane (the
  real(EUITM_R8),pointer  :: density(:) => null()     ! /antennas/antenna_lh(i)/plasmaedge/density - Electron density in front of the antenna [m^-3]. Vector (npoints). Time-dependent.
endtype
  
type type_launchangles_mask  !    
  integer  :: alpha=0       ! /antennas/antenna_ec(i)/launchangles/alpha - Poloidal launching angle between the horizontal plane and the poloidal component of the nominal beam
  integer  :: beta=0       ! /antennas/antenna_ec(i)/launchangles/beta - Toroidal launching angle between the poloidal plane and the nominal beam centerline [rad], Sin(beta)
endtype
  
type type_plasmaedge_mask  !    
  integer  :: npoints=0       ! /antennas/antenna_lh(i)/plasmaedge/npoints - Number of points in the distance grid. Integer
  integer  :: distance=0       ! /antennas/antenna_lh(i)/plasmaedge/distance - Grid for electron density, defined as the perpendicular distance to the antenna waveguide plane (the
  integer  :: density=0       ! /antennas/antenna_lh(i)/plasmaedge/density - Electron density in front of the antenna [m^-3]. Vector (npoints). Time-dependent.
endtype

  
type type_antenna_ec  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /antennas/antenna_ec(i)/name - Antenna name
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /antennas/antenna_ec(i)/frequency - Frequency [Hz]
  type (type_exp0D) :: power  ! /antennas/antenna_ec(i)/power - Power [W]; Time-dependent
  integer  :: mode=-999999999       ! /antennas/antenna_ec(i)/mode - Incoming wave mode (+ or -1 for O/X mode); Time-dependent
  type (type_rzphi0D) :: position  ! /antennas/antenna_ec(i)/position - Launching position in the global reference system; Time-dependent
  type (type_launchangles) :: launchangles  ! /antennas/antenna_ec(i)/launchangles - Launching angles of the beam
  type (type_rfbeam) :: beam  ! /antennas/antenna_ec(i)/beam - Beam characteristics at the launching position
  type (type_codeparam) :: codeparam  ! /antennas/antenna_ec(i)/codeparam - Code parameters of the code constructing the antenna.
endtype

  
type type_antenna_ic  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /antennas/antenna_ic(i)/name - Antenna name; String
  type (type_exp0D) :: frequency  ! /antennas/antenna_ic(i)/frequency - Frequency [Hz]; Time-dependent; Exp0d
  type (type_exp0D) :: power  ! /antennas/antenna_ic(i)/power - Power [W]; Time-dependent; Exp0d
  integer,pointer  :: ntor(:) => null()      ! /antennas/antenna_ic(i)/ntor - Toroidal mode numbers [-]; Time-dependent; Vector(n_ntor)
  real(EUITM_R8),pointer  :: power_ntor(:) => null()     ! /antennas/antenna_ic(i)/power_ntor - Power coupled in each toroidal mode [W]; Time-dependent; Vector(n_ntor)
  type (type_antennaic_setup) :: setup  ! /antennas/antenna_ic(i)/setup - Detailed description of IC antenna hardware and internal settings
  type (type_codeparam) :: codeparam  ! /antennas/antenna_ic(i)/codeparam - Code parameters of the code constructing the antenna.
endtype

  
type type_antenna_lh  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /antennas/antenna_lh(i)/name - Antenna name, String
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /antennas/antenna_lh(i)/frequency - Frequency [Hz]
  type (type_exp0D) :: power  ! /antennas/antenna_lh(i)/power - Power [W]; Exp0d. Time-dependent
  real(EUITM_R8)  :: n_par=-9.0E40_EUITM_R8       ! /antennas/antenna_lh(i)/n_par - Main parallel refractive index of the launched spectrum, for multi-junction antennas. Time-dependent
  type (type_rzphi0D) :: position  ! /antennas/antenna_lh(i)/position - Reference global antenna position. Time-dependent
  type (type_antennalh_setup) :: setup  ! /antennas/antenna_lh(i)/setup - Detailed description of LH antennas.
  type (type_plasmaedge) :: plasmaedge  ! /antennas/antenna_lh(i)/plasmaedge - Plasma edge characteristics in front of the antenna.
  type (type_rfbeam) :: beam  ! /antennas/antenna_lh(i)/beam - Beam characteristics
  type (type_codeparam) :: codeparam  ! /antennas/antenna_lh(i)/codeparam - Code parameters of the code constructing the antenna.
endtype
  
type type_antenna_ec_mask  !    
  integer  :: name=0       ! /antennas/antenna_ec(i)/name - Antenna name
  integer  :: frequency=0       ! /antennas/antenna_ec(i)/frequency - Frequency [Hz]
  type (type_exp0D_mask) :: power  ! /antennas/antenna_ec(i)/power - Power [W]; Time-dependent
  integer  :: mode=0       ! /antennas/antenna_ec(i)/mode - Incoming wave mode (+ or -1 for O/X mode); Time-dependent
  type (type_rzphi0D_mask) :: position  ! /antennas/antenna_ec(i)/position - Launching position in the global reference system; Time-dependent
  type (type_launchangles_mask) :: launchangles  ! /antennas/antenna_ec(i)/launchangles - Launching angles of the beam
  type (type_rfbeam_mask) :: beam  ! /antennas/antenna_ec(i)/beam - Beam characteristics at the launching position
  type (type_codeparam_mask) :: codeparam  ! /antennas/antenna_ec(i)/codeparam - Code parameters of the code constructing the antenna.
endtype
  
type type_antenna_ic_mask  !    
  integer  :: name=0       ! /antennas/antenna_ic(i)/name - Antenna name; String
  type (type_exp0D_mask) :: frequency  ! /antennas/antenna_ic(i)/frequency - Frequency [Hz]; Time-dependent; Exp0d
  type (type_exp0D_mask) :: power  ! /antennas/antenna_ic(i)/power - Power [W]; Time-dependent; Exp0d
  integer  :: ntor=0       ! /antennas/antenna_ic(i)/ntor - Toroidal mode numbers [-]; Time-dependent; Vector(n_ntor)
  integer  :: power_ntor=0       ! /antennas/antenna_ic(i)/power_ntor - Power coupled in each toroidal mode [W]; Time-dependent; Vector(n_ntor)
  type (type_antennaic_setup_mask) :: setup  ! /antennas/antenna_ic(i)/setup - Detailed description of IC antenna hardware and internal settings
  type (type_codeparam_mask) :: codeparam  ! /antennas/antenna_ic(i)/codeparam - Code parameters of the code constructing the antenna.
endtype
  
type type_antenna_lh_mask  !    
  integer  :: name=0       ! /antennas/antenna_lh(i)/name - Antenna name, String
  integer  :: frequency=0       ! /antennas/antenna_lh(i)/frequency - Frequency [Hz]
  type (type_exp0D_mask) :: power  ! /antennas/antenna_lh(i)/power - Power [W]; Exp0d. Time-dependent
  integer  :: n_par=0       ! /antennas/antenna_lh(i)/n_par - Main parallel refractive index of the launched spectrum, for multi-junction antennas. Time-dependent
  type (type_rzphi0D_mask) :: position  ! /antennas/antenna_lh(i)/position - Reference global antenna position. Time-dependent
  type (type_antennalh_setup_mask) :: setup  ! /antennas/antenna_lh(i)/setup - Detailed description of LH antennas.
  type (type_plasmaedge_mask) :: plasmaedge  ! /antennas/antenna_lh(i)/plasmaedge - Plasma edge characteristics in front of the antenna.
  type (type_rfbeam_mask) :: beam  ! /antennas/antenna_lh(i)/beam - Beam characteristics
  type (type_codeparam_mask) :: codeparam  ! /antennas/antenna_lh(i)/codeparam - Code parameters of the code constructing the antenna.
endtype

  
type type_antennas  !    
  type (type_datainfo) :: datainfo  ! /antennas/datainfo - 
  type (type_antenna_ec),pointer :: antenna_ec(:) => null()  ! /antennas/antenna_ec(i) - Vector of Electron Cyclotron antennas. Time-dependent
  type (type_antenna_ic),pointer :: antenna_ic(:) => null()  ! /antennas/antenna_ic(i) - Vector of Ion Cyclotron antennas. Time-dependent
  type (type_antenna_lh),pointer :: antenna_lh(:) => null()  ! /antennas/antenna_lh(i) - Vector of Lower Hybrid antennas. Time-dependent
  type (type_codeparam) :: codeparam  ! /antennas/codeparam - Code parameters of datajoiners, i.e. codes that merge the antennas.
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /antennas/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_antennas_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /antennas/datainfo - 
  type (type_antenna_ec_mask),pointer :: antenna_ec(:) => null()  ! /antennas/antenna_ec(i) - Vector of Electron Cyclotron antennas. Time-dependent
  type (type_antenna_ic_mask),pointer :: antenna_ic(:) => null()  ! /antennas/antenna_ic(i) - Vector of Ion Cyclotron antennas. Time-dependent
  type (type_antenna_lh_mask),pointer :: antenna_lh(:) => null()  ! /antennas/antenna_lh(i) - Vector of Lower Hybrid antennas. Time-dependent
  type (type_codeparam_mask) :: codeparam  ! /antennas/codeparam - Code parameters of datajoiners, i.e. codes that merge the antennas.
  integer  :: time=0       ! /antennas/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include bb_shield.xsd
  
type type_bb_dimension  !    dimension of the various modules
  real(EUITM_R8),pointer  :: radial(:) => null()     ! /radial - Radial dimension [m]. Vector(nmodules) 
  real(EUITM_R8),pointer  :: toroidal(:) => null()     ! /toroidal - Toroidal dimension [m]. Vector(nmodules) 
  real(EUITM_R8),pointer  :: poloidal(:) => null()     ! /poloidal - Poloidal dimension [m]. Vector(nmodules) 
endtype

  
type type_power_exchange  !    
  real(EUITM_R8),pointer  :: dep_pow(:) => null()     ! /dep_pow - Power deposited in each bb module (the reference outboard module if only value is given) [W]; Vector
  real(EUITM_R8)  :: dep_fw=-9.0E40_EUITM_R8       ! /dep_fw - Power deposited in the first wall (heat flux + neutrons) [W]; Scalar
  real(EUITM_R8)  :: dep_sg=-9.0E40_EUITM_R8       ! /dep_sg - Power deposited in the stiffening grid (neutrons) [W]; Scalar
  real(EUITM_R8)  :: dep_cp=-9.0E40_EUITM_R8       ! /dep_cp - Power deposited in the cooling plates (neutrons) [W]; Scalar
  real(EUITM_R8)  :: dep_lp=-9.0E40_EUITM_R8       ! /dep_lp - Power deposited in the Pb-15.7Li (neutrons) [W]; Scalar
  real(EUITM_R8)  :: dep_man=-9.0E40_EUITM_R8       ! /dep_man - Power deposited in the manifolds (neutrons) [W]; Scalar
  real(EUITM_R8)  :: dep_pl=-9.0E40_EUITM_R8       ! /dep_pl - Power deposited in the protect layer (made of tungsten) (neutrons) [W]; Scalar
  real(EUITM_R8)  :: rec_fw=-9.0E40_EUITM_R8       ! /rec_fw - Power recovered from He in first wall channels [W]; Scalar
  real(EUITM_R8)  :: rec_sg=-9.0E40_EUITM_R8       ! /rec_sg - Power recovered from He in stiffening grid channels [W]; Scalar
  real(EUITM_R8)  :: rec_cp=-9.0E40_EUITM_R8       ! /rec_cp - Power recovered from He in cooling plates channels [W]; Scalar
  real(EUITM_R8)  :: pow_dens_fw=-9.0E40_EUITM_R8       ! /pow_dens_fw - Peak energy depostion in first wall [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_bz=-9.0E40_EUITM_R8       ! /pow_dens_bz - Peak energy depostion in breeding zone [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_bz10=-9.0E40_EUITM_R8       ! /pow_dens_bz10 - Peak energy depostion in breeding zone (first ten centimers) [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_bp=-9.0E40_EUITM_R8       ! /pow_dens_bp - Peak energy depostion in back plate [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_man=-9.0E40_EUITM_R8       ! /pow_dens_man - Peak energy depostion in manifold [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_sh=-9.0E40_EUITM_R8       ! /pow_dens_sh - Peak energy depostion in shield [W.m^-3]; Scalar
endtype

  
type type_bb_geometry  !    Geometrical parameters of "the" reference outboard blanket module
  real(EUITM_R8)  :: dr_fw=-9.0E40_EUITM_R8       ! /dr_fw - Radial thickness of the FW [m]; Scalar
  real(EUITM_R8)  :: dr_bz=-9.0E40_EUITM_R8       ! /dr_bz - Radial thickness of the BZ (between the FW and the 1st back plate wall) [m]; Scalar
  real(EUITM_R8)  :: dr_bp=-9.0E40_EUITM_R8       ! /dr_bp - Radial thickness of the BPs integrated to the module [m]; Scalar
  real(EUITM_R8),pointer  :: dr_bp_plates(:) => null()     ! /dr_bp_plates - Radial thickness of every BP integrated to the module [m]; Vector(nplates)
  real(EUITM_R8),pointer  :: dr_bp_he(:) => null()     ! /dr_bp_he - Radial thickness of Helium layers [m]; Vector(nplates)
  real(EUITM_R8)  :: dr_man=-9.0E40_EUITM_R8       ! /dr_man - Radial thickness of the banana manifold common to all modules [m]; Scalar
  real(EUITM_R8)  :: dt_sw=-9.0E40_EUITM_R8       ! /dt_sw - Toroidal thickness of side walls (or covers) [m]; Scalar
  real(EUITM_R8)  :: dt_bz=-9.0E40_EUITM_R8       ! /dt_bz - Toroidal dimension of the BZ (between the two side walls [m]; Scalar
  real(EUITM_R8)  :: dp_bz=-9.0E40_EUITM_R8       ! /dp_bz - Poloidal dimension of the Breeder zone [m]; Scalar
  type (type_bb_dimension) :: top_cap_dim  ! /top_cap_dim - Top cap dimension of bb modules
  type (type_bb_dimension) :: bot_cap_dim  ! /bot_cap_dim - Bottom cap dimension of bb modules
  real(EUITM_R8)  :: a_fw_ch=-9.0E40_EUITM_R8       ! /a_fw_ch - First wall channel radial dimension [m]; Scalar
  real(EUITM_R8)  :: b_fw_ch=-9.0E40_EUITM_R8       ! /b_fw_ch - First wall channel toroidal dimension [m]; Scalar
  real(EUITM_R8)  :: td_tc_ch=-9.0E40_EUITM_R8       ! /td_tc_ch - Top cap channel toroidal dimension [m]; Scalar
  real(EUITM_R8)  :: rd_tc_ch=-9.0E40_EUITM_R8       ! /rd_tc_ch - Top cap channel radial dimension [m]; Scalar
  real(EUITM_R8)  :: td_bc_ch=-9.0E40_EUITM_R8       ! /td_bc_ch - Bottom cap channel toroidal dimension [m]; Scalar
  real(EUITM_R8)  :: rd_bc_ch=-9.0E40_EUITM_R8       ! /rd_bc_ch - Bottom cap channel radial dimension [m]; Scalar
  real(EUITM_R8)  :: n_fw_ch=-9.0E40_EUITM_R8       ! /n_fw_ch - Number of first wall channels; Scalar
  real(EUITM_R8)  :: n_fw_circ=-9.0E40_EUITM_R8       ! /n_fw_circ - Number of circulation in channel first wall channels; Scalar
  real(EUITM_R8)  :: a_sg_ch=-9.0E40_EUITM_R8       ! /a_sg_ch - Stiffening grid channel dimension 1 [m]; Scalar
  real(EUITM_R8)  :: b_sg_ch=-9.0E40_EUITM_R8       ! /b_sg_ch - Stiffening grid channel dimension 2 [m]; Scalar
  real(EUITM_R8)  :: n_sg_ch=-9.0E40_EUITM_R8       ! /n_sg_ch - Number of channels per stiffening plate [m]; Scalar
  real(EUITM_R8)  :: sg_thick=-9.0E40_EUITM_R8       ! /sg_thick - Stiffening grid thickness [m]; Scalar
  real(EUITM_R8)  :: sg_weld=-9.0E40_EUITM_R8       ! /sg_weld - Stiffening grid required dimension for welding [m]; Scalar
  real(EUITM_R8)  :: sg_in_out=-9.0E40_EUITM_R8       ! /sg_in_out - Stiffening grid input/output geometry length [m]; Scalar
  real(EUITM_R8)  :: r_sg_cp=-9.0E40_EUITM_R8       ! /r_sg_cp - Percentage of the cooling plate length [-]; Scalar
  real(EUITM_R8)  :: cp_tor_gap=-9.0E40_EUITM_R8       ! /cp_tor_gap - Gap between cooling plates and toroidal breeder [m]; Scalar
  real(EUITM_R8)  :: a_cp_ch=-9.0E40_EUITM_R8       ! /a_cp_ch - Cooling plates channel dimension 1 [m]; Scalar
  real(EUITM_R8)  :: b_cp_ch=-9.0E40_EUITM_R8       ! /b_cp_ch - Cooling plates channel dimension 2 [m]; Scalar
  real(EUITM_R8)  :: n_cp_ch=-9.0E40_EUITM_R8       ! /n_cp_ch - Number of channels per cooling plates [m]; Scalar
  real(EUITM_R8)  :: cp_thick=-9.0E40_EUITM_R8       ! /cp_thick - Cooling plates thickness [m]; Scalar
  real(EUITM_R8)  :: n_pol_bu=-9.0E40_EUITM_R8       ! /n_pol_bu - Number of poloidal breeder units; Scalar
  real(EUITM_R8)  :: n_tor_bu=-9.0E40_EUITM_R8       ! /n_tor_bu - Number of toroidal breeder units; Scalar
  real(EUITM_R8)  :: n_cp_bu=-9.0E40_EUITM_R8       ! /n_cp_bu - Number of cooling plates per breeder unit; Scalar
  real(EUITM_R8)  :: cp_in_out=-9.0E40_EUITM_R8       ! /cp_in_out - Cooling plate input/output geometry length [m]; Scalar
  real(EUITM_R8)  :: he_man_tck=-9.0E40_EUITM_R8       ! /he_man_tck - Helium stage manifold thickness [m]; Scalar
  real(EUITM_R8)  :: man_tck=-9.0E40_EUITM_R8       ! /man_tck - Manifold zone thickness [m]; Scalar
  real(EUITM_R8)  :: pbli_bptb_od=-9.0E40_EUITM_R8       ! /pbli_bptb_od - Output diameter of pbli tube [m]; Scalar
  real(EUITM_R8)  :: pbli_bptb_id=-9.0E40_EUITM_R8       ! /pbli_bptb_id - Input diameter of pbli tube [m]; Scalar
  real(EUITM_R8)  :: he_bptb_od=-9.0E40_EUITM_R8       ! /he_bptb_od - Output diameter of He inlet tube [m]; Scalar
  real(EUITM_R8)  :: he_bptb_id=-9.0E40_EUITM_R8       ! /he_bptb_id - Input diameter of He inlet tube [m]; Scalar
  real(EUITM_R8)  :: dr_max_fw=-9.0E40_EUITM_R8       ! /dr_max_fw - First wall frontmost thickness [m]; Scalar
  real(EUITM_R8)  :: dr_fwpl=-9.0E40_EUITM_R8       ! /dr_fwpl - Radial thickness of fisrt protective layer [m]; Scalar
endtype

  
type type_mode_neutr  !    
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius position at wich power density is calculated [m]; Vector(nr)
  real(EUITM_R8),pointer  :: pd_rad(:) => null()     ! /pd_rad - Power density distribution in radial direction [W/m^3]; Vector(nr)
  real(EUITM_R8),pointer  :: lipb_coef_pd(:) => null()     ! /lipb_coef_pd - Pb-15.7Li power density distribution in radial direction: coefficients of bi-exponential law if this
  real(EUITM_R8),pointer  :: steel_coef_pd(:) => null()     ! /steel_coef_pd - Eurofer power density distribution in radial direction: coefficients of bi-exponential law if this o
  type (type_power_exchange) :: pow_exchange  ! /pow_exchange - 
endtype

  
type type_mode_therm  !    
  real(EUITM_R8)  :: he_fr=-9.0E40_EUITM_R8       ! /he_fr - Coolant mass flow rate in "the" reference bb (inboard or outboard) module [Kg/s]; Scalar
  real(EUITM_R8)  :: perc_bp_he=-9.0E40_EUITM_R8       ! /perc_bp_he - % of Helium going through the bypass (set to 0 if not otherwise specified)
  real(EUITM_R8)  :: he_out_t=-9.0E40_EUITM_R8       ! /he_out_t - Outlet temperature (from the bb module) [K]; Scalar
  real(EUITM_R8)  :: fw_he_out_t=-9.0E40_EUITM_R8       ! /fw_he_out_t - First wall outlet temperature [K]; Scalar
  real(EUITM_R8)  :: sg_he_out_t=-9.0E40_EUITM_R8       ! /sg_he_out_t - Stiffening grid outlet temperature [K]; Scalar
  real(EUITM_R8)  :: cp_he_out_t=-9.0E40_EUITM_R8       ! /cp_he_out_t - Cooling plates outlet temperature [K]; Scalar
  real(EUITM_R8)  :: fw_st_max_t=-9.0E40_EUITM_R8       ! /fw_st_max_t - First wall eurofer maximum temperature [K]; Scalar
  real(EUITM_R8)  :: sg_st_max_t=-9.0E40_EUITM_R8       ! /sg_st_max_t - Stiffening grid eurofer maximum temperature [K]; Scalar
  real(EUITM_R8)  :: cp_st_max_t=-9.0E40_EUITM_R8       ! /cp_st_max_t - Cooling plates eurofer maximum temperature [K]; Scalar
endtype

  
type type_mode_th_hyd  !    
  real(EUITM_R8)  :: fw_dp_he=-9.0E40_EUITM_R8       ! /fw_dp_he - Pressure drops in the first wall [Pa]; Scalar
  real(EUITM_R8)  :: sg_dp_he=-9.0E40_EUITM_R8       ! /sg_dp_he - Pressure drops in the stiffening grid [Pa]; Scalar
  real(EUITM_R8)  :: cp_dp_he=-9.0E40_EUITM_R8       ! /cp_dp_he - Pressure drops in the cooling plates [Pa]; Scalar
  real(EUITM_R8)  :: man_dp_he=-9.0E40_EUITM_R8       ! /man_dp_he - Pressure drops in the manifolds [Pa]; Scalar
  real(EUITM_R8)  :: tot_dp_he=-9.0E40_EUITM_R8       ! /tot_dp_he - Total pressure drops in bb module [Pa]; Scalar
  real(EUITM_R8)  :: bp_dp_he=-9.0E40_EUITM_R8       ! /bp_dp_he - Total pressure drops in the by pass (if any) [Pa]; ScalarScalar
  real(EUITM_R8)  :: circ_dp_he=-9.0E40_EUITM_R8       ! /circ_dp_he - Pressure drops in one He circuit [Pa]; Scalar
endtype

  
type type_mode_mech  !    
  real(EUITM_R8)  :: fw_min_ts_mg=-9.0E40_EUITM_R8       ! /fw_min_ts_mg - Min margin to tensile stress limit in the first wall; Scalar
  real(EUITM_R8)  :: fw_min_bd_mg=-9.0E40_EUITM_R8       ! /fw_min_bd_mg - Min margin to banding stress limit in the first wall; Scalar
  real(EUITM_R8)  :: sg_min_ts_mg=-9.0E40_EUITM_R8       ! /sg_min_ts_mg - Min margin to tensile stress limit in the stiffening grid; Scalar
  real(EUITM_R8)  :: sg_min_bd_mg=-9.0E40_EUITM_R8       ! /sg_min_bd_mg - Min margin to bending stress limit in the stiffening grid; Scalar
  real(EUITM_R8)  :: cp_min_ts_mg=-9.0E40_EUITM_R8       ! /cp_min_ts_mg - Min margin to tensile stress limit in the cooling plate; Scalar
  real(EUITM_R8)  :: cp_min_bd_mg=-9.0E40_EUITM_R8       ! /cp_min_bd_mg - Min margin to bending stress limit in the cooling plate; Scalar
  real(EUITM_R8)  :: min_ts_mg_ac=-9.0E40_EUITM_R8       ! /min_ts_mg_ac - Min tensile margin in accidental conditions; Scalar
  real(EUITM_R8)  :: min_bd_mg_ac=-9.0E40_EUITM_R8       ! /min_bd_mg_ac - Min bending margin in accidental conditions; Scalar
endtype

  
type type_mode_lipb  !    
  real(EUITM_R8)  :: lp_rec_day=-9.0E40_EUITM_R8       ! /lp_rec_day - nb of Pb-15.7Li recirculation per day [Pa]; Scalar
  real(EUITM_R8),pointer  :: bb_lp_fr(:) => null()     ! /bb_lp_fr - Pb-15.7Li mass flow rate in "the" bb module (or in each bb module) [Kg/s]; Vector(nmodules)
  real(EUITM_R8)  :: lp_inl_p=-9.0E40_EUITM_R8       ! /lp_inl_p - Pb-15.7Li inlet pressure [Pa]; Scalar
  real(EUITM_R8)  :: bu_dp_lp=-9.0E40_EUITM_R8       ! /bu_dp_lp - Pb-15.7Li pressure drops in the breeder unit [Pa]; Scalar
  real(EUITM_R8)  :: man_dp_lp=-9.0E40_EUITM_R8       ! /man_dp_lp - Pb-15.7Li pressure drops in the bb manifolds [Pa]; Scalar
  real(EUITM_R8)  :: tot_dp_lp=-9.0E40_EUITM_R8       ! /tot_dp_lp - Pb-15.7Li total pressure drops [Pa]; Scalar
  real(EUITM_R8)  :: bu_lp_ave_t=-9.0E40_EUITM_R8       ! /bu_lp_ave_t - Pb-15.7Li average temperature in a breeder unit [K]; Scalar
  real(EUITM_R8)  :: bu_lp_max_t=-9.0E40_EUITM_R8       ! /bu_lp_max_t - Pb-15.7Li max temperature in a breeder unit [K]; Scalar
endtype

  
type type_mode_tritium  !    
  real(EUITM_R8)  :: t_conc_lipb=-9.0E40_EUITM_R8       ! /t_conc_lipb - Tritium concentration in Pb-15.7Li; Scalar
  real(EUITM_R8)  :: t_conc_he=-9.0E40_EUITM_R8       ! /t_conc_he - Tritium concentration in He; Scalar
endtype

  
type type_hcllbb_specs  !    
  real(EUITM_R8),pointer  :: mass(:) => null()     ! /mass - Mass of inboard or outboard breeding blanket modules (located at equatorial midplane if only one con
  real(EUITM_R8),pointer  :: dr(:) => null()     ! /dr - Inboard or outboard breeding blanket radial build giving the thickness of each layer [m]; Vector(nla
  real(EUITM_R8),pointer  :: mat(:) => null()     ! /mat - Inboard or outboard breeding blanket materials; Vector(nlayers)
  real(EUITM_R8),pointer  :: composition(:,:) => null()     ! /composition - Inboard or outboard breeding blanket radial build giving for each layer (1: First Wall protective la
  type (type_bb_geometry) :: mod_geom  ! /mod_geom - Geometrical parameters of "the" reference region blanket module
  type (type_mode_neutr) :: mod_neutr  ! /mod_neutr - Neutrons "effects"
  type (type_mode_therm) :: mod_therm  ! /mod_therm - Thermical parameters
  type (type_mode_th_hyd) :: mod_th_hyd  ! /mod_th_hyd - hydrodynamics parameters
  type (type_mode_mech) :: mod_mech  ! /mod_mech - Mechanical parameters
  type (type_mode_lipb) :: mod_lipb  ! /mod_lipb - Pb-15.7Li "effects"
  type (type_mode_tritium) :: mod_tritium  ! /mod_tritium - Tritium parameters
endtype

  
type type_bb_specs  !    
  real(EUITM_R8)  :: nbb=-9.0E40_EUITM_R8       ! /nbb - Number of inboard or outboard bb modules (in a poloidal cut), Scalar
  real(EUITM_R8)  :: r1=-9.0E40_EUITM_R8       ! /r1 - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the inboard or outb
  real(EUITM_R8)  :: r2=-9.0E40_EUITM_R8       ! /r2 - Outer radius (farest to the plasma), in the global tokamak coordinate system of the inboard or outbo
  type (type_bb_dimension) :: dimension  ! /dimension - dimension of the various modules
endtype

  
type type_shield_specs  !    
  integer  :: nmat=-999999999       ! /nmat - Number of materials; Scalar
  real(EUITM_R8),pointer  :: composition(:) => null()     ! /composition - Inboard or outboard shield  radial build the percentage of each material respectively (Meaning of th
  real(EUITM_R8)  :: r1=-9.0E40_EUITM_R8       ! /r1 - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the inboard or outb
  real(EUITM_R8)  :: r2=-9.0E40_EUITM_R8       ! /r2 - Outer radius (farest to the plasma), in the global tokamak coordinate system of the inboard or outbo
  real(EUITM_R8)  :: mass=-9.0E40_EUITM_R8       ! /mass - Mass of inboard or outboard shield [Kg]; Scalar
endtype
  
type type_bb_dimension_mask  !    dimension of the various modules
  integer  :: radial=0       ! /radial - Radial dimension [m]. Vector(nmodules) 
  integer  :: toroidal=0       ! /toroidal - Toroidal dimension [m]. Vector(nmodules) 
  integer  :: poloidal=0       ! /poloidal - Poloidal dimension [m]. Vector(nmodules) 
endtype
  
type type_power_exchange_mask  !    
  integer  :: dep_pow=0       ! /dep_pow - Power deposited in each bb module (the reference outboard module if only value is given) [W]; Vector
  integer  :: dep_fw=0       ! /dep_fw - Power deposited in the first wall (heat flux + neutrons) [W]; Scalar
  integer  :: dep_sg=0       ! /dep_sg - Power deposited in the stiffening grid (neutrons) [W]; Scalar
  integer  :: dep_cp=0       ! /dep_cp - Power deposited in the cooling plates (neutrons) [W]; Scalar
  integer  :: dep_lp=0       ! /dep_lp - Power deposited in the Pb-15.7Li (neutrons) [W]; Scalar
  integer  :: dep_man=0       ! /dep_man - Power deposited in the manifolds (neutrons) [W]; Scalar
  integer  :: dep_pl=0       ! /dep_pl - Power deposited in the protect layer (made of tungsten) (neutrons) [W]; Scalar
  integer  :: rec_fw=0       ! /rec_fw - Power recovered from He in first wall channels [W]; Scalar
  integer  :: rec_sg=0       ! /rec_sg - Power recovered from He in stiffening grid channels [W]; Scalar
  integer  :: rec_cp=0       ! /rec_cp - Power recovered from He in cooling plates channels [W]; Scalar
  integer  :: pow_dens_fw=0       ! /pow_dens_fw - Peak energy depostion in first wall [W.m^-3]; Scalar
  integer  :: pow_dens_bz=0       ! /pow_dens_bz - Peak energy depostion in breeding zone [W.m^-3]; Scalar
  integer  :: pow_dens_bz10=0       ! /pow_dens_bz10 - Peak energy depostion in breeding zone (first ten centimers) [W.m^-3]; Scalar
  integer  :: pow_dens_bp=0       ! /pow_dens_bp - Peak energy depostion in back plate [W.m^-3]; Scalar
  integer  :: pow_dens_man=0       ! /pow_dens_man - Peak energy depostion in manifold [W.m^-3]; Scalar
  integer  :: pow_dens_sh=0       ! /pow_dens_sh - Peak energy depostion in shield [W.m^-3]; Scalar
endtype
  
type type_bb_geometry_mask  !    Geometrical parameters of "the" reference outboard blanket module
  integer  :: dr_fw=0       ! /dr_fw - Radial thickness of the FW [m]; Scalar
  integer  :: dr_bz=0       ! /dr_bz - Radial thickness of the BZ (between the FW and the 1st back plate wall) [m]; Scalar
  integer  :: dr_bp=0       ! /dr_bp - Radial thickness of the BPs integrated to the module [m]; Scalar
  integer  :: dr_bp_plates=0       ! /dr_bp_plates - Radial thickness of every BP integrated to the module [m]; Vector(nplates)
  integer  :: dr_bp_he=0       ! /dr_bp_he - Radial thickness of Helium layers [m]; Vector(nplates)
  integer  :: dr_man=0       ! /dr_man - Radial thickness of the banana manifold common to all modules [m]; Scalar
  integer  :: dt_sw=0       ! /dt_sw - Toroidal thickness of side walls (or covers) [m]; Scalar
  integer  :: dt_bz=0       ! /dt_bz - Toroidal dimension of the BZ (between the two side walls [m]; Scalar
  integer  :: dp_bz=0       ! /dp_bz - Poloidal dimension of the Breeder zone [m]; Scalar
  type (type_bb_dimension_mask) :: top_cap_dim  ! /top_cap_dim - Top cap dimension of bb modules
  type (type_bb_dimension_mask) :: bot_cap_dim  ! /bot_cap_dim - Bottom cap dimension of bb modules
  integer  :: a_fw_ch=0       ! /a_fw_ch - First wall channel radial dimension [m]; Scalar
  integer  :: b_fw_ch=0       ! /b_fw_ch - First wall channel toroidal dimension [m]; Scalar
  integer  :: td_tc_ch=0       ! /td_tc_ch - Top cap channel toroidal dimension [m]; Scalar
  integer  :: rd_tc_ch=0       ! /rd_tc_ch - Top cap channel radial dimension [m]; Scalar
  integer  :: td_bc_ch=0       ! /td_bc_ch - Bottom cap channel toroidal dimension [m]; Scalar
  integer  :: rd_bc_ch=0       ! /rd_bc_ch - Bottom cap channel radial dimension [m]; Scalar
  integer  :: n_fw_ch=0       ! /n_fw_ch - Number of first wall channels; Scalar
  integer  :: n_fw_circ=0       ! /n_fw_circ - Number of circulation in channel first wall channels; Scalar
  integer  :: a_sg_ch=0       ! /a_sg_ch - Stiffening grid channel dimension 1 [m]; Scalar
  integer  :: b_sg_ch=0       ! /b_sg_ch - Stiffening grid channel dimension 2 [m]; Scalar
  integer  :: n_sg_ch=0       ! /n_sg_ch - Number of channels per stiffening plate [m]; Scalar
  integer  :: sg_thick=0       ! /sg_thick - Stiffening grid thickness [m]; Scalar
  integer  :: sg_weld=0       ! /sg_weld - Stiffening grid required dimension for welding [m]; Scalar
  integer  :: sg_in_out=0       ! /sg_in_out - Stiffening grid input/output geometry length [m]; Scalar
  integer  :: r_sg_cp=0       ! /r_sg_cp - Percentage of the cooling plate length [-]; Scalar
  integer  :: cp_tor_gap=0       ! /cp_tor_gap - Gap between cooling plates and toroidal breeder [m]; Scalar
  integer  :: a_cp_ch=0       ! /a_cp_ch - Cooling plates channel dimension 1 [m]; Scalar
  integer  :: b_cp_ch=0       ! /b_cp_ch - Cooling plates channel dimension 2 [m]; Scalar
  integer  :: n_cp_ch=0       ! /n_cp_ch - Number of channels per cooling plates [m]; Scalar
  integer  :: cp_thick=0       ! /cp_thick - Cooling plates thickness [m]; Scalar
  integer  :: n_pol_bu=0       ! /n_pol_bu - Number of poloidal breeder units; Scalar
  integer  :: n_tor_bu=0       ! /n_tor_bu - Number of toroidal breeder units; Scalar
  integer  :: n_cp_bu=0       ! /n_cp_bu - Number of cooling plates per breeder unit; Scalar
  integer  :: cp_in_out=0       ! /cp_in_out - Cooling plate input/output geometry length [m]; Scalar
  integer  :: he_man_tck=0       ! /he_man_tck - Helium stage manifold thickness [m]; Scalar
  integer  :: man_tck=0       ! /man_tck - Manifold zone thickness [m]; Scalar
  integer  :: pbli_bptb_od=0       ! /pbli_bptb_od - Output diameter of pbli tube [m]; Scalar
  integer  :: pbli_bptb_id=0       ! /pbli_bptb_id - Input diameter of pbli tube [m]; Scalar
  integer  :: he_bptb_od=0       ! /he_bptb_od - Output diameter of He inlet tube [m]; Scalar
  integer  :: he_bptb_id=0       ! /he_bptb_id - Input diameter of He inlet tube [m]; Scalar
  integer  :: dr_max_fw=0       ! /dr_max_fw - First wall frontmost thickness [m]; Scalar
  integer  :: dr_fwpl=0       ! /dr_fwpl - Radial thickness of fisrt protective layer [m]; Scalar
endtype
  
type type_mode_neutr_mask  !    
  integer  :: r=0       ! /r - Major radius position at wich power density is calculated [m]; Vector(nr)
  integer  :: pd_rad=0       ! /pd_rad - Power density distribution in radial direction [W/m^3]; Vector(nr)
  integer  :: lipb_coef_pd=0       ! /lipb_coef_pd - Pb-15.7Li power density distribution in radial direction: coefficients of bi-exponential law if this
  integer  :: steel_coef_pd=0       ! /steel_coef_pd - Eurofer power density distribution in radial direction: coefficients of bi-exponential law if this o
  type (type_power_exchange_mask) :: pow_exchange  ! /pow_exchange - 
endtype
  
type type_mode_therm_mask  !    
  integer  :: he_fr=0       ! /he_fr - Coolant mass flow rate in "the" reference bb (inboard or outboard) module [Kg/s]; Scalar
  integer  :: perc_bp_he=0       ! /perc_bp_he - % of Helium going through the bypass (set to 0 if not otherwise specified)
  integer  :: he_out_t=0       ! /he_out_t - Outlet temperature (from the bb module) [K]; Scalar
  integer  :: fw_he_out_t=0       ! /fw_he_out_t - First wall outlet temperature [K]; Scalar
  integer  :: sg_he_out_t=0       ! /sg_he_out_t - Stiffening grid outlet temperature [K]; Scalar
  integer  :: cp_he_out_t=0       ! /cp_he_out_t - Cooling plates outlet temperature [K]; Scalar
  integer  :: fw_st_max_t=0       ! /fw_st_max_t - First wall eurofer maximum temperature [K]; Scalar
  integer  :: sg_st_max_t=0       ! /sg_st_max_t - Stiffening grid eurofer maximum temperature [K]; Scalar
  integer  :: cp_st_max_t=0       ! /cp_st_max_t - Cooling plates eurofer maximum temperature [K]; Scalar
endtype
  
type type_mode_th_hyd_mask  !    
  integer  :: fw_dp_he=0       ! /fw_dp_he - Pressure drops in the first wall [Pa]; Scalar
  integer  :: sg_dp_he=0       ! /sg_dp_he - Pressure drops in the stiffening grid [Pa]; Scalar
  integer  :: cp_dp_he=0       ! /cp_dp_he - Pressure drops in the cooling plates [Pa]; Scalar
  integer  :: man_dp_he=0       ! /man_dp_he - Pressure drops in the manifolds [Pa]; Scalar
  integer  :: tot_dp_he=0       ! /tot_dp_he - Total pressure drops in bb module [Pa]; Scalar
  integer  :: bp_dp_he=0       ! /bp_dp_he - Total pressure drops in the by pass (if any) [Pa]; ScalarScalar
  integer  :: circ_dp_he=0       ! /circ_dp_he - Pressure drops in one He circuit [Pa]; Scalar
endtype
  
type type_mode_mech_mask  !    
  integer  :: fw_min_ts_mg=0       ! /fw_min_ts_mg - Min margin to tensile stress limit in the first wall; Scalar
  integer  :: fw_min_bd_mg=0       ! /fw_min_bd_mg - Min margin to banding stress limit in the first wall; Scalar
  integer  :: sg_min_ts_mg=0       ! /sg_min_ts_mg - Min margin to tensile stress limit in the stiffening grid; Scalar
  integer  :: sg_min_bd_mg=0       ! /sg_min_bd_mg - Min margin to bending stress limit in the stiffening grid; Scalar
  integer  :: cp_min_ts_mg=0       ! /cp_min_ts_mg - Min margin to tensile stress limit in the cooling plate; Scalar
  integer  :: cp_min_bd_mg=0       ! /cp_min_bd_mg - Min margin to bending stress limit in the cooling plate; Scalar
  integer  :: min_ts_mg_ac=0       ! /min_ts_mg_ac - Min tensile margin in accidental conditions; Scalar
  integer  :: min_bd_mg_ac=0       ! /min_bd_mg_ac - Min bending margin in accidental conditions; Scalar
endtype
  
type type_mode_lipb_mask  !    
  integer  :: lp_rec_day=0       ! /lp_rec_day - nb of Pb-15.7Li recirculation per day [Pa]; Scalar
  integer  :: bb_lp_fr=0       ! /bb_lp_fr - Pb-15.7Li mass flow rate in "the" bb module (or in each bb module) [Kg/s]; Vector(nmodules)
  integer  :: lp_inl_p=0       ! /lp_inl_p - Pb-15.7Li inlet pressure [Pa]; Scalar
  integer  :: bu_dp_lp=0       ! /bu_dp_lp - Pb-15.7Li pressure drops in the breeder unit [Pa]; Scalar
  integer  :: man_dp_lp=0       ! /man_dp_lp - Pb-15.7Li pressure drops in the bb manifolds [Pa]; Scalar
  integer  :: tot_dp_lp=0       ! /tot_dp_lp - Pb-15.7Li total pressure drops [Pa]; Scalar
  integer  :: bu_lp_ave_t=0       ! /bu_lp_ave_t - Pb-15.7Li average temperature in a breeder unit [K]; Scalar
  integer  :: bu_lp_max_t=0       ! /bu_lp_max_t - Pb-15.7Li max temperature in a breeder unit [K]; Scalar
endtype
  
type type_mode_tritium_mask  !    
  integer  :: t_conc_lipb=0       ! /t_conc_lipb - Tritium concentration in Pb-15.7Li; Scalar
  integer  :: t_conc_he=0       ! /t_conc_he - Tritium concentration in He; Scalar
endtype
  
type type_hcllbb_specs_mask  !    
  integer  :: mass=0       ! /mass - Mass of inboard or outboard breeding blanket modules (located at equatorial midplane if only one con
  integer  :: dr=0       ! /dr - Inboard or outboard breeding blanket radial build giving the thickness of each layer [m]; Vector(nla
  integer  :: mat=0       ! /mat - Inboard or outboard breeding blanket materials; Vector(nlayers)
  integer  :: composition=0       ! /composition - Inboard or outboard breeding blanket radial build giving for each layer (1: First Wall protective la
  type (type_bb_geometry_mask) :: mod_geom  ! /mod_geom - Geometrical parameters of "the" reference region blanket module
  type (type_mode_neutr_mask) :: mod_neutr  ! /mod_neutr - Neutrons "effects"
  type (type_mode_therm_mask) :: mod_therm  ! /mod_therm - Thermical parameters
  type (type_mode_th_hyd_mask) :: mod_th_hyd  ! /mod_th_hyd - hydrodynamics parameters
  type (type_mode_mech_mask) :: mod_mech  ! /mod_mech - Mechanical parameters
  type (type_mode_lipb_mask) :: mod_lipb  ! /mod_lipb - Pb-15.7Li "effects"
  type (type_mode_tritium_mask) :: mod_tritium  ! /mod_tritium - Tritium parameters
endtype
  
type type_bb_specs_mask  !    
  integer  :: nbb=0       ! /nbb - Number of inboard or outboard bb modules (in a poloidal cut), Scalar
  integer  :: r1=0       ! /r1 - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the inboard or outb
  integer  :: r2=0       ! /r2 - Outer radius (farest to the plasma), in the global tokamak coordinate system of the inboard or outbo
  type (type_bb_dimension_mask) :: dimension  ! /dimension - dimension of the various modules
endtype
  
type type_shield_specs_mask  !    
  integer  :: nmat=0       ! /nmat - Number of materials; Scalar
  integer  :: composition=0       ! /composition - Inboard or outboard shield  radial build the percentage of each material respectively (Meaning of th
  integer  :: r1=0       ! /r1 - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the inboard or outb
  integer  :: r2=0       ! /r2 - Outer radius (farest to the plasma), in the global tokamak coordinate system of the inboard or outbo
  integer  :: mass=0       ! /mass - Mass of inboard or outboard shield [Kg]; Scalar
endtype

  
type type_react  !    
  real(EUITM_R8)  :: he_fr=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/react/he_fr - Coolant mass flow rate in the whole reactor [Kg/s]; Scalar
  real(EUITM_R8)  :: lp_fr=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/react/lp_fr - Pb-15.7Li mass flow rate in  the whole reactor [Kg/s]; Scalar
  real(EUITM_R8)  :: he_dp=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/react/he_dp - Coolant pressure drops in the reactor (compressing pipelines) [Pa]; Scalar
  real(EUITM_R8)  :: lipb_dp=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/react/lipb_dp - Pb-15.7Li pressure drops in the reactor [Pa]; Scalar
endtype
  
type type_react_mask  !    
  integer  :: he_fr=0       ! /bb_shield/hcll/hcll_bb/react/he_fr - Coolant mass flow rate in the whole reactor [Kg/s]; Scalar
  integer  :: lp_fr=0       ! /bb_shield/hcll/hcll_bb/react/lp_fr - Pb-15.7Li mass flow rate in  the whole reactor [Kg/s]; Scalar
  integer  :: he_dp=0       ! /bb_shield/hcll/hcll_bb/react/he_dp - Coolant pressure drops in the reactor (compressing pipelines) [Pa]; Scalar
  integer  :: lipb_dp=0       ! /bb_shield/hcll/hcll_bb/react/lipb_dp - Pb-15.7Li pressure drops in the reactor [Pa]; Scalar
endtype

  
type type_neutro_resul  !    
  real(EUITM_R8)  :: nwl_max=-9.0E40_EUITM_R8       ! /bb_shield/bb/neutro_resul/nwl_max - Maximum neutron wall load (on equatorial outboard module) [W*m^-2]; Scalar
  real(EUITM_R8),pointer  :: nwl_pol_prof(:) => null()     ! /bb_shield/bb/neutro_resul/nwl_pol_prof - NWL scaling factor coefficient for each bb module; Vector(nmodules)
endtype

  
type type_mat_lim  !    
  real(EUITM_R8)  :: cool_t_lim=-9.0E40_EUITM_R8       ! /bb_shield/hcll/mat_lim/cool_t_lim - Min, max allowable He temperature [K]; 
  real(EUITM_R8)  :: steel_t_lim=-9.0E40_EUITM_R8       ! /bb_shield/hcll/mat_lim/steel_t_lim - Min, max allowable steel temperature [K]; 
  real(EUITM_R8)  :: lipb_t_lim=-9.0E40_EUITM_R8       ! /bb_shield/hcll/mat_lim/lipb_t_lim - Min, max allowable LiPb temperature [K]; 
endtype

  
type type_hcll_bb  !    
  real(EUITM_R8)  :: bb_lifetime=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/bb_lifetime - Breeding blanket lifetime [years]; Scalar
  real(EUITM_R8)  :: he_inl_t=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/he_inl_t - Inlet temperature (to the bb module) [K]; Scalar
  real(EUITM_R8)  :: he_fr=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/he_fr - Coolant mass flow rate in "the" reference bb module (or in each module) [Kg/s];
  real(EUITM_R8)  :: he_inl_p=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/he_inl_p - Helium inlet pressure [Pa]; Scalar
  real(EUITM_R8)  :: loca_des_p=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/loca_des_p - Box design pressure (coincident He circuit design pressure) [Pa]; Scalar
  real(EUITM_R8)  :: he_dp=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/he_dp - Coolant pressure drops in the breeding blankets [Pa]; Scalar
  real(EUITM_R8)  :: lipb_dp=-9.0E40_EUITM_R8       ! /bb_shield/hcll/hcll_bb/lipb_dp - Pb-15.7Li pressure drops in the bb [Pa]; Scalar
  type (type_react) :: react  ! /bb_shield/hcll/hcll_bb/react - In the reactor region
  type (type_hcllbb_specs) :: inboard  ! /bb_shield/hcll/hcll_bb/inboard - Inboard
  type (type_hcllbb_specs) :: outboard  ! /bb_shield/hcll/hcll_bb/outboard - Outboard
endtype
  
type type_neutro_resul_mask  !    
  integer  :: nwl_max=0       ! /bb_shield/bb/neutro_resul/nwl_max - Maximum neutron wall load (on equatorial outboard module) [W*m^-2]; Scalar
  integer  :: nwl_pol_prof=0       ! /bb_shield/bb/neutro_resul/nwl_pol_prof - NWL scaling factor coefficient for each bb module; Vector(nmodules)
endtype
  
type type_mat_lim_mask  !    
  integer  :: cool_t_lim=0       ! /bb_shield/hcll/mat_lim/cool_t_lim - Min, max allowable He temperature [K]; 
  integer  :: steel_t_lim=0       ! /bb_shield/hcll/mat_lim/steel_t_lim - Min, max allowable steel temperature [K]; 
  integer  :: lipb_t_lim=0       ! /bb_shield/hcll/mat_lim/lipb_t_lim - Min, max allowable LiPb temperature [K]; 
endtype
  
type type_hcll_bb_mask  !    
  integer  :: bb_lifetime=0       ! /bb_shield/hcll/hcll_bb/bb_lifetime - Breeding blanket lifetime [years]; Scalar
  integer  :: he_inl_t=0       ! /bb_shield/hcll/hcll_bb/he_inl_t - Inlet temperature (to the bb module) [K]; Scalar
  integer  :: he_fr=0       ! /bb_shield/hcll/hcll_bb/he_fr - Coolant mass flow rate in "the" reference bb module (or in each module) [Kg/s];
  integer  :: he_inl_p=0       ! /bb_shield/hcll/hcll_bb/he_inl_p - Helium inlet pressure [Pa]; Scalar
  integer  :: loca_des_p=0       ! /bb_shield/hcll/hcll_bb/loca_des_p - Box design pressure (coincident He circuit design pressure) [Pa]; Scalar
  integer  :: he_dp=0       ! /bb_shield/hcll/hcll_bb/he_dp - Coolant pressure drops in the breeding blankets [Pa]; Scalar
  integer  :: lipb_dp=0       ! /bb_shield/hcll/hcll_bb/lipb_dp - Pb-15.7Li pressure drops in the bb [Pa]; Scalar
  type (type_react_mask) :: react  ! /bb_shield/hcll/hcll_bb/react - In the reactor region
  type (type_hcllbb_specs_mask) :: inboard  ! /bb_shield/hcll/hcll_bb/inboard - Inboard
  type (type_hcllbb_specs_mask) :: outboard  ! /bb_shield/hcll/hcll_bb/outboard - Outboard
endtype

  
type type_limits  !    
  real(EUITM_R8)  :: fw_dpa=-9.0E40_EUITM_R8       ! /bb_shield/limits/fw_dpa - max allowable displacement per atom on FW [dpa]; Scalar.
  real(EUITM_R8)  :: he_appm=-9.0E40_EUITM_R8       ! /bb_shield/limits/he_appm - He concentration limit in re-welding areas [appm]; Scalar
  real(EUITM_R8)  :: ins_dose=-9.0E40_EUITM_R8       ! /bb_shield/limits/ins_dose - Integral radiation dose in insulator (Epoxy) [Gy] [J*Kg^-1]; Scalar
  real(EUITM_R8)  :: fn_flu=-9.0E40_EUITM_R8       ! /bb_shield/limits/fn_flu - Peak fast neutron fluence (E>0.1 MeV) to the Nb3Sn superconductor  [m^-2]; Scalar
  real(EUITM_R8)  :: dpa_cu=-9.0E40_EUITM_R8       ! /bb_shield/limits/dpa_cu - Peak displacement damage to copper stabilizer [dpa]; Scalar
  real(EUITM_R8)  :: wp_nh=-9.0E40_EUITM_R8       ! /bb_shield/limits/wp_nh - Peak nuclear eating in winding pack [W*m^-3]; Scalar
endtype

  
type type_geom  !    
  real(EUITM_R8)  :: dr_bb_sh_ib=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_bb_sh_ib - Gap between the breeding blanket module and the shield (inboard) in the equatorial section [m]; Scal
  real(EUITM_R8)  :: dr_sh_vv_ib=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_sh_vv_ib - Gap between the shield and the vacuum vessel (inboard) in the equatorial section [m]; Scalar
  real(EUITM_R8)  :: dr_bb_sh_ob=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_bb_sh_ob - Gap between the breeding blanket module and the shield (outboard) in the equatorial section [m]; Sca
  real(EUITM_R8)  :: dr_sh_vv_ob=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_sh_vv_ob - Gap between the shield and the vacuum vessel (outboard) in the equatorial section [m]; Scalar
  real(EUITM_R8)  :: dr_bb__sh_ib=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_bb__sh_ib - Overal radial dimension of the ensemble BB plus shield (inboard) [m]; Scalar
  real(EUITM_R8)  :: dr_bb__sh_ob=-9.0E40_EUITM_R8       ! /bb_shield/geom/dr_bb__sh_ob - Overal radial dimension of the ensemble BB plus shield (outboard) [m]; Scalar
  real(EUITM_R8)  :: delta_int=-9.0E40_EUITM_R8       ! /bb_shield/geom/delta_int - Distance between the inner plasma surface and the plasma facing side of the superconducting winding 
endtype

  
type type_neut_results  !    
  real(EUITM_R8)  :: tbr_bk=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/tbr_bk - Resulting global breeding blanket tritium breeding ratio; Scalar
  real(EUITM_R8)  :: tbr_bk_inb=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/tbr_bk_inb - Resulting inboard breeding blanket Tritium Breeding Ratio [-]; Scalar
  real(EUITM_R8)  :: tbr_bk_outb=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/tbr_bk_outb - Resulting outboard breeding blanket Tritium Breeding Ratio [-]; Scalar
  real(EUITM_R8)  :: me_bk=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/me_bk - Energy multiplication factor in breeding blanket; Scalar
  real(EUITM_R8)  :: me_shield=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/me_shield - Energy multiplication factor in shield; Scalar
  real(EUITM_R8)  :: he_appm_res=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/he_appm_res - He production in areas needing to be rewelded; Scalar
  real(EUITM_R8)  :: ins_dose_max=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/ins_dose_max - Integral radiation dose in insulator (Epoxy) [J*Kg^-1]; Scalar
  real(EUITM_R8)  :: fn_flu_max=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/fn_flu_max - Peak fast neutron fluence (E>0.1 MeV) to the Nb3Sn superconductor [m^-2]; Scalar
  real(EUITM_R8)  :: dpa_cu_max=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/dpa_cu_max - Peak displacement damage to copper stabilizer [dpa]; Scalar
  real(EUITM_R8)  :: fn_flux_bz=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/fn_flux_bz - Fast neutron flux in breeding zone inboard [m^2.s^-1]; Scalar
  real(EUITM_R8)  :: fn_flux_bp=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/fn_flux_bp - Fast neutron flux in backplate inboard [m^2.s^-1]; Scalar
  real(EUITM_R8)  :: fn_flux_man=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/fn_flux_man - Fast neutron flux in manifold inboard [m^2.s^-1]; Scalar
  real(EUITM_R8)  :: fn_flux_sh=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/fn_flux_sh - Fast neutron flux in shield inboard [m^2.s^-1]; Scalar
  real(EUITM_R8)  :: p_nh_bk=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/p_nh_bk - Total nuclear heating in blanket [W]; Scalar
  real(EUITM_R8)  :: p_nh_sh=-9.0E40_EUITM_R8       ! /bb_shield/neut_results/p_nh_sh - Total nuclear heating in shield [W]; Scalar
endtype

  
type type_shield  !    
  type (type_shield_specs) :: inboard  ! /bb_shield/shield/inboard - Inboard
  type (type_shield_specs) :: outboard  ! /bb_shield/shield/outboard - Outboard
endtype

  
type type_bb  !    
  real(EUITM_R8)  :: nb_bb=-9.0E40_EUITM_R8       ! /bb_shield/bb/nb_bb - Total (in the reactor) number of breeding blanket module; Scalar
  real(EUITM_R8)  :: nb_bb_polcut=-9.0E40_EUITM_R8       ! /bb_shield/bb/nb_bb_polcut - Number of bb modules on a poloidal cut; Scalar
  real(EUITM_R8)  :: teta_bb=-9.0E40_EUITM_R8       ! /bb_shield/bb/teta_bb - Angle (0 for equatorial outboard, then in anti-clokwise direction) of bb module; [deg]
  real(EUITM_R8)  :: tbr=-9.0E40_EUITM_R8       ! /bb_shield/bb/tbr - Tritium breeding ratio of the blanket [-]; Scalar
  type (type_neutro_resul) :: neutro_resul  ! /bb_shield/bb/neutro_resul - Neutronic results
  type (type_bb_specs) :: inboard  ! /bb_shield/bb/inboard - Inboard
  type (type_bb_specs) :: outboard  ! /bb_shield/bb/outboard - Outboard
endtype

  
type type_hcll  !    
  type (type_mat_lim) :: mat_lim  ! /bb_shield/hcll/mat_lim - Material limits specific to HCLL breeding blanket
  type (type_hcll_bb) :: hcll_bb  ! /bb_shield/hcll/hcll_bb - HCLL breeding blanket. Radially, the blanket is divided in 4 layers: 1: First Wall, 2 : breeder zone
endtype
  
type type_limits_mask  !    
  integer  :: fw_dpa=0       ! /bb_shield/limits/fw_dpa - max allowable displacement per atom on FW [dpa]; Scalar.
  integer  :: he_appm=0       ! /bb_shield/limits/he_appm - He concentration limit in re-welding areas [appm]; Scalar
  integer  :: ins_dose=0       ! /bb_shield/limits/ins_dose - Integral radiation dose in insulator (Epoxy) [Gy] [J*Kg^-1]; Scalar
  integer  :: fn_flu=0       ! /bb_shield/limits/fn_flu - Peak fast neutron fluence (E>0.1 MeV) to the Nb3Sn superconductor  [m^-2]; Scalar
  integer  :: dpa_cu=0       ! /bb_shield/limits/dpa_cu - Peak displacement damage to copper stabilizer [dpa]; Scalar
  integer  :: wp_nh=0       ! /bb_shield/limits/wp_nh - Peak nuclear eating in winding pack [W*m^-3]; Scalar
endtype
  
type type_geom_mask  !    
  integer  :: dr_bb_sh_ib=0       ! /bb_shield/geom/dr_bb_sh_ib - Gap between the breeding blanket module and the shield (inboard) in the equatorial section [m]; Scal
  integer  :: dr_sh_vv_ib=0       ! /bb_shield/geom/dr_sh_vv_ib - Gap between the shield and the vacuum vessel (inboard) in the equatorial section [m]; Scalar
  integer  :: dr_bb_sh_ob=0       ! /bb_shield/geom/dr_bb_sh_ob - Gap between the breeding blanket module and the shield (outboard) in the equatorial section [m]; Sca
  integer  :: dr_sh_vv_ob=0       ! /bb_shield/geom/dr_sh_vv_ob - Gap between the shield and the vacuum vessel (outboard) in the equatorial section [m]; Scalar
  integer  :: dr_bb__sh_ib=0       ! /bb_shield/geom/dr_bb__sh_ib - Overal radial dimension of the ensemble BB plus shield (inboard) [m]; Scalar
  integer  :: dr_bb__sh_ob=0       ! /bb_shield/geom/dr_bb__sh_ob - Overal radial dimension of the ensemble BB plus shield (outboard) [m]; Scalar
  integer  :: delta_int=0       ! /bb_shield/geom/delta_int - Distance between the inner plasma surface and the plasma facing side of the superconducting winding 
endtype
  
type type_neut_results_mask  !    
  integer  :: tbr_bk=0       ! /bb_shield/neut_results/tbr_bk - Resulting global breeding blanket tritium breeding ratio; Scalar
  integer  :: tbr_bk_inb=0       ! /bb_shield/neut_results/tbr_bk_inb - Resulting inboard breeding blanket Tritium Breeding Ratio [-]; Scalar
  integer  :: tbr_bk_outb=0       ! /bb_shield/neut_results/tbr_bk_outb - Resulting outboard breeding blanket Tritium Breeding Ratio [-]; Scalar
  integer  :: me_bk=0       ! /bb_shield/neut_results/me_bk - Energy multiplication factor in breeding blanket; Scalar
  integer  :: me_shield=0       ! /bb_shield/neut_results/me_shield - Energy multiplication factor in shield; Scalar
  integer  :: he_appm_res=0       ! /bb_shield/neut_results/he_appm_res - He production in areas needing to be rewelded; Scalar
  integer  :: ins_dose_max=0       ! /bb_shield/neut_results/ins_dose_max - Integral radiation dose in insulator (Epoxy) [J*Kg^-1]; Scalar
  integer  :: fn_flu_max=0       ! /bb_shield/neut_results/fn_flu_max - Peak fast neutron fluence (E>0.1 MeV) to the Nb3Sn superconductor [m^-2]; Scalar
  integer  :: dpa_cu_max=0       ! /bb_shield/neut_results/dpa_cu_max - Peak displacement damage to copper stabilizer [dpa]; Scalar
  integer  :: fn_flux_bz=0       ! /bb_shield/neut_results/fn_flux_bz - Fast neutron flux in breeding zone inboard [m^2.s^-1]; Scalar
  integer  :: fn_flux_bp=0       ! /bb_shield/neut_results/fn_flux_bp - Fast neutron flux in backplate inboard [m^2.s^-1]; Scalar
  integer  :: fn_flux_man=0       ! /bb_shield/neut_results/fn_flux_man - Fast neutron flux in manifold inboard [m^2.s^-1]; Scalar
  integer  :: fn_flux_sh=0       ! /bb_shield/neut_results/fn_flux_sh - Fast neutron flux in shield inboard [m^2.s^-1]; Scalar
  integer  :: p_nh_bk=0       ! /bb_shield/neut_results/p_nh_bk - Total nuclear heating in blanket [W]; Scalar
  integer  :: p_nh_sh=0       ! /bb_shield/neut_results/p_nh_sh - Total nuclear heating in shield [W]; Scalar
endtype
  
type type_shield_mask  !    
  type (type_shield_specs_mask) :: inboard  ! /bb_shield/shield/inboard - Inboard
  type (type_shield_specs_mask) :: outboard  ! /bb_shield/shield/outboard - Outboard
endtype
  
type type_bb_mask  !    
  integer  :: nb_bb=0       ! /bb_shield/bb/nb_bb - Total (in the reactor) number of breeding blanket module; Scalar
  integer  :: nb_bb_polcut=0       ! /bb_shield/bb/nb_bb_polcut - Number of bb modules on a poloidal cut; Scalar
  integer  :: teta_bb=0       ! /bb_shield/bb/teta_bb - Angle (0 for equatorial outboard, then in anti-clokwise direction) of bb module; [deg]
  integer  :: tbr=0       ! /bb_shield/bb/tbr - Tritium breeding ratio of the blanket [-]; Scalar
  type (type_neutro_resul_mask) :: neutro_resul  ! /bb_shield/bb/neutro_resul - Neutronic results
  type (type_bb_specs_mask) :: inboard  ! /bb_shield/bb/inboard - Inboard
  type (type_bb_specs_mask) :: outboard  ! /bb_shield/bb/outboard - Outboard
endtype
  
type type_hcll_mask  !    
  type (type_mat_lim_mask) :: mat_lim  ! /bb_shield/hcll/mat_lim - Material limits specific to HCLL breeding blanket
  type (type_hcll_bb_mask) :: hcll_bb  ! /bb_shield/hcll/hcll_bb - HCLL breeding blanket. Radially, the blanket is divided in 4 layers: 1: First Wall, 2 : breeder zone
endtype

  
type type_bb_shield  !    
  type (type_datainfo) :: datainfo  ! /bb_shield/datainfo - 
  character(len=132), dimension(:), pointer ::type => null()       ! /bb_shield/type - Type of breeding blanket (HCLL, DCLL, HCPB, ...). String
  type (type_limits) :: limits  ! /bb_shield/limits - Limits
  real(EUITM_R8)  :: li6_enrich=-9.0E40_EUITM_R8       ! /bb_shield/li6_enrich - Lithium 6 enrichement (at%).
  type (type_geom) :: geom  ! /bb_shield/geom - Geometry between components
  type (type_neut_results) :: neut_results  ! /bb_shield/neut_results - Neutronic results
  type (type_shield) :: shield  ! /bb_shield/shield - Shield
  type (type_bb) :: bb  ! /bb_shield/bb - Breeding blanket
  type (type_hcll) :: hcll  ! /bb_shield/hcll - Data specific to HCLL blanket concept
  type (type_codeparam) :: codeparam  ! /bb_shield/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /bb_shield/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_bb_shield_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /bb_shield/datainfo - 
  integer  :: type=0       ! /bb_shield/type - Type of breeding blanket (HCLL, DCLL, HCPB, ...). String
  type (type_limits_mask) :: limits  ! /bb_shield/limits - Limits
  integer  :: li6_enrich=0       ! /bb_shield/li6_enrich - Lithium 6 enrichement (at%).
  type (type_geom_mask) :: geom  ! /bb_shield/geom - Geometry between components
  type (type_neut_results_mask) :: neut_results  ! /bb_shield/neut_results - Neutronic results
  type (type_shield_mask) :: shield  ! /bb_shield/shield - Shield
  type (type_bb_mask) :: bb  ! /bb_shield/bb - Breeding blanket
  type (type_hcll_mask) :: hcll  ! /bb_shield/hcll - Data specific to HCLL blanket concept
  type (type_codeparam_mask) :: codeparam  ! /bb_shield/codeparam - 
  integer  :: time=0       ! /bb_shield/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include composition.xsd
  
type type_compositionc  !    Species description (ions, impurities, neutrals).
  type (type_datainfo) :: datainfo  ! /compositionc/datainfo - 
  type (type_compositions_type) :: compositions  ! /compositionc/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_codeparam) :: codeparam  ! /compositionc/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /compositionc/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_compositionc_mask  !    Species description (ions, impurities, neutrals).
  type (type_datainfo_mask) :: datainfo  ! /compositionc/datainfo - 
  type (type_compositions_type_mask) :: compositions  ! /compositionc/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_codeparam_mask) :: codeparam  ! /compositionc/codeparam - 
  integer  :: time=0       ! /compositionc/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include coredelta.xsd
  
type type_coredelta_values_impurity  !    Description of the delta term for an impurity
  real(EUITM_R8),pointer  :: delta_tz(:,:) => null()     ! /delta_tz - Instant change of the impurity (multiple charge states) temperature [eV]. Time-dependent. Matrix (nr
  real(EUITM_R8),pointer  :: delta_nz(:,:) => null()     ! /delta_nz - Instant change of the impurity (multiple charge states) density [m^-3]. Time-dependent. Matrix (nrho
endtype

  
type type_coredelta_values  !    Description of the delta term for a given origin
  type (type_identifier) :: deltaid  ! /deltaid - Identifier for the origin of the delta terms (see conventions in the ITM website)
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: delta_psi(:) => null()     ! /delta_psi - Instant change of the poloidal flux [Wb]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: delta_te(:) => null()     ! /delta_te - Instant change of the electron temperature [eV]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: delta_ti(:,:) => null()     ! /delta_ti - Instant change of the ion temperature [eV]. Time-dependent. Matrix (nrho,nion).
  real(EUITM_R8),pointer  :: delta_ne(:) => null()     ! /delta_ne - Instant change of the electron density [m^-3]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: delta_ni(:,:) => null()     ! /delta_ni - Instant change of the ion density [m^-3]. Time-dependent. Matrix (nrho,nion).
  type (type_coredelta_values_impurity),pointer :: impurity(:) => null()  ! /impurity(i) - Array(nimp). Time-dependent
  real(EUITM_R8),pointer  :: delta_vtor(:,:) => null()     ! /delta_vtor - Instant change of the toroidal toroidal velocity [m.s^-1]. Time-dependent. Matrix (nrho,nion).
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype
  
type type_coredelta_values_impurity_mask  !    Description of the delta term for an impurity
  integer  :: delta_tz=0       ! /delta_tz - Instant change of the impurity (multiple charge states) temperature [eV]. Time-dependent. Matrix (nr
  integer  :: delta_nz=0       ! /delta_nz - Instant change of the impurity (multiple charge states) density [m^-3]. Time-dependent. Matrix (nrho
endtype
  
type type_coredelta_values_mask  !    Description of the delta term for a given origin
  type (type_identifier_mask) :: deltaid  ! /deltaid - Identifier for the origin of the delta terms (see conventions in the ITM website)
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  integer  :: volume=0       ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  integer  :: delta_psi=0       ! /delta_psi - Instant change of the poloidal flux [Wb]. Time-dependent. Vector(nrho).
  integer  :: delta_te=0       ! /delta_te - Instant change of the electron temperature [eV]. Time-dependent. Vector(nrho).
  integer  :: delta_ti=0       ! /delta_ti - Instant change of the ion temperature [eV]. Time-dependent. Matrix (nrho,nion).
  integer  :: delta_ne=0       ! /delta_ne - Instant change of the electron density [m^-3]. Time-dependent. Vector(nrho).
  integer  :: delta_ni=0       ! /delta_ni - Instant change of the ion density [m^-3]. Time-dependent. Matrix (nrho,nion).
  type (type_coredelta_values_impurity_mask),pointer :: impurity(:) => null()  ! /impurity(i) - Array(nimp). Time-dependent
  integer  :: delta_vtor=0       ! /delta_vtor - Instant change of the toroidal toroidal velocity [m.s^-1]. Time-dependent. Matrix (nrho,nion).
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype

  
type type_coredelta  !    
  type (type_datainfo) :: datainfo  ! /coredelta/datainfo - 
  type (type_composition) :: composition  ! /coredelta/composition - 
  type (type_desc_impur) :: desc_impur  ! /coredelta/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coredelta/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_coredelta_values),pointer :: values(:) => null()  ! /coredelta/values(i) - Description of the delta term for the various origins. Array of structure (ndelta). Time-dependent
  type (type_codeparam) :: codeparam  ! /coredelta/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coredelta/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_coredelta_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coredelta/datainfo - 
  type (type_composition_mask) :: composition  ! /coredelta/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /coredelta/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coredelta/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_coredelta_values_mask),pointer :: values(:) => null()  ! /coredelta/values(i) - Description of the delta term for the various origins. Array of structure (ndelta). Time-dependent
  type (type_codeparam_mask) :: codeparam  ! /coredelta/codeparam - 
  integer  :: time=0       ! /coredelta/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include corefast.xsd
  
type type_corefast_values  !    Description of the source terms for a given origin
  type (type_identifier) :: fastid  ! /fastid - Identifier for the origin of the non-thermal contributions (see fast_particle_origin_identifier in t
  type (type_fast_thermal_separation_filter) :: filter  ! /filter - Description of how the fast and the thermal particle populations were separated. Time-dependent.
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed in the flux surface [m^3]. Vector (nrho). Time-dependent.
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]. Vector (nrho). Time-dependent.
  real(EUITM_R8),pointer  :: j(:) => null()     ! /j - Non thermal current, = average(j.B) / B0, where B0 = corefast/toroid_field/b0 [A.m^-2]. Vector(nrho)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /sigma - Non-thermal induced parallel conductivity [ohm^-1.m^-1]. EXACT DEFINITION PENDING. Vector(nrho). Tim
  real(EUITM_R8),pointer  :: ni(:,:) => null()     ! /ni - Non-thermal ion density [m^-3]. Matrix(nrho,nions). Time-dependent.
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Non-thermal electron density [m^-3]. Vector(nrho). Time-dependent.
  real(EUITM_R8),pointer  :: nz(:,:) => null()     ! /nz - Non-thermal impurity density [m^-3]. Matrix(nrho,nimpur). Time-dependent.
  real(EUITM_R8),pointer  :: pi(:,:) => null()     ! /pi - Non-thermal ion pressure; the flux surface average of the m*v^2/3 moment of the fast particle distri
  real(EUITM_R8),pointer  :: pe(:) => null()     ! /pe - Non-thermal electron pressure; the flux surface average of the m*v^2/3 moment of the fast particle d
  real(EUITM_R8),pointer  :: pz(:,:) => null()     ! /pz - Non-thermal impurity total pressure; the flux surface average of the m*v^2/3 moment of the fast part
  real(EUITM_R8),pointer  :: pi_para(:,:) => null()     ! /pi_para - Non-thermal ion parallel pressure; the flux surface average of the m*v_parallel^2 moment of the fast
  real(EUITM_R8),pointer  :: pe_para(:) => null()     ! /pe_para - Non-thermal electron parallel pressure; the flux surface average of the m*v_parallel^2 moment of the
  real(EUITM_R8),pointer  :: pz_para(:,:) => null()     ! /pz_para - Non-thermal impurity parallel pressure; the flux surface average of the m*v_parallel^2 moment of the
  real(EUITM_R8),pointer  :: ui(:,:) => null()     ! /ui - Non-thermal ion toroidal velocity [m.s^-1]. Matrix(nrho,nions). Time-dependent.
  real(EUITM_R8),pointer  :: uz(:,:) => null()     ! /uz - Non-thermal impurity toroidal velocity [m.s^-1]. Matrix(nrho,nimpur). Time-dependent.
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype
  
type type_corefast_values_mask  !    Description of the source terms for a given origin
  type (type_identifier_mask) :: fastid  ! /fastid - Identifier for the origin of the non-thermal contributions (see fast_particle_origin_identifier in t
  type (type_fast_thermal_separation_filter_mask) :: filter  ! /filter - Description of how the fast and the thermal particle populations were separated. Time-dependent.
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: psi=0       ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  integer  :: volume=0       ! /volume - Volume enclosed in the flux surface [m^3]. Vector (nrho). Time-dependent.
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]. Vector (nrho). Time-dependent.
  integer  :: j=0       ! /j - Non thermal current, = average(j.B) / B0, where B0 = corefast/toroid_field/b0 [A.m^-2]. Vector(nrho)
  integer  :: sigma=0       ! /sigma - Non-thermal induced parallel conductivity [ohm^-1.m^-1]. EXACT DEFINITION PENDING. Vector(nrho). Tim
  integer  :: ni=0       ! /ni - Non-thermal ion density [m^-3]. Matrix(nrho,nions). Time-dependent.
  integer  :: ne=0       ! /ne - Non-thermal electron density [m^-3]. Vector(nrho). Time-dependent.
  integer  :: nz=0       ! /nz - Non-thermal impurity density [m^-3]. Matrix(nrho,nimpur). Time-dependent.
  integer  :: pi=0       ! /pi - Non-thermal ion pressure; the flux surface average of the m*v^2/3 moment of the fast particle distri
  integer  :: pe=0       ! /pe - Non-thermal electron pressure; the flux surface average of the m*v^2/3 moment of the fast particle d
  integer  :: pz=0       ! /pz - Non-thermal impurity total pressure; the flux surface average of the m*v^2/3 moment of the fast part
  integer  :: pi_para=0       ! /pi_para - Non-thermal ion parallel pressure; the flux surface average of the m*v_parallel^2 moment of the fast
  integer  :: pe_para=0       ! /pe_para - Non-thermal electron parallel pressure; the flux surface average of the m*v_parallel^2 moment of the
  integer  :: pz_para=0       ! /pz_para - Non-thermal impurity parallel pressure; the flux surface average of the m*v_parallel^2 moment of the
  integer  :: ui=0       ! /ui - Non-thermal ion toroidal velocity [m.s^-1]. Matrix(nrho,nions). Time-dependent.
  integer  :: uz=0       ! /uz - Non-thermal impurity toroidal velocity [m.s^-1]. Matrix(nrho,nimpur). Time-dependent.
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype

  
type type_corefast  !    
  type (type_datainfo) :: datainfo  ! /corefast/datainfo - 
  type (type_composition) :: composition  ! /corefast/composition - 
  type (type_desc_impur) :: desc_impur  ! /corefast/desc_impur - 
  type (type_compositions_type) :: compositions  ! /corefast/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_b0r0) :: toroid_field  ! /corefast/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_corefast_values),pointer :: values(:) => null()  ! /corefast/values(i) - Description of the fast particle terms of various origins. Array of structure (nfast). Time-dependen
  type (type_codeparam) :: codeparam  ! /corefast/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /corefast/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_corefast_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /corefast/datainfo - 
  type (type_composition_mask) :: composition  ! /corefast/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /corefast/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /corefast/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_b0r0_mask) :: toroid_field  ! /corefast/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_corefast_values_mask),pointer :: values(:) => null()  ! /corefast/values(i) - Description of the fast particle terms of various origins. Array of structure (nfast). Time-dependen
  type (type_codeparam_mask) :: codeparam  ! /corefast/codeparam - 
  integer  :: time=0       ! /corefast/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include coreimpur.xsd
  
type type_sourceimp  !    Structure for the total source term for the transport equation (impurities). Time-dependent;
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value of the source term [m^-3.s^-1]; Time-dependent; Array2D (nrho,nzimp)
  real(EUITM_R8),pointer  :: integral(:,:) => null()     ! /integral - Integral from 0 to rho of the source term. Time-dependent; Array2D(nrho,nzimp)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
endtype

  
type type_coretransimp  !    Structure for the transport coefficients for the transport equation (impurities). Time-dependent;
  real(EUITM_R8),pointer  :: diff(:,:) => null()     ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Array2D(nrho,nzimp)
  real(EUITM_R8),pointer  :: vconv(:,:) => null()     ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Array2D (nrho,nzimp)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
endtype

  
type type_boundaryimp  !    Structure for the boundary condition of core transport equations (impurities) Time-dependent
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer,pointer  :: type(:) => null()      ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  real(EUITM_R8),pointer  :: rho(:) => null()     ! /rho - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype

  
type type_fluximp  !    Structure for the fluxes of a field of the core transport equations (impurities); Time-dependent;
  real(EUITM_R8),pointer  :: flux_dv(:,:) => null()     ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Array2D (nrho,nzimp)
  real(EUITM_R8),pointer  :: flux_interp(:,:) => null()     ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype

  
type type_coreimpurediagprof_type  !    
  real(EUITM_R8),pointer  :: profile(:,:) => null()     ! /profile - Profile of the radiation or energy sources. Time-dependent. Array2D (nrho,nzimp or nimp)
  real(EUITM_R8),pointer  :: integral(:,:) => null()     ! /integral - Running integral over nrho of the radiation or energy sources. Time-dependent. Array2D (nrho,nzimp o
endtype

  
type type_coreimpurediagsum_type  !    
  real(EUITM_R8),pointer  :: profile(:) => null()     ! /profile - Profile of the radiation or energy sources. Time-dependent. Array1D (nrho)
  real(EUITM_R8),pointer  :: integral(:) => null()     ! /integral - Running integral over nrho of the radiation or energy sources. Time-dependent. Array1D (nrho)
endtype

  
type type_coreimpurediag_radiation  !    
  type (type_coreimpurediagprof_type) :: line_rad  ! /line_rad - 
  type (type_coreimpurediagprof_type) :: brem_radrec  ! /brem_radrec - 
  type (type_coreimpurediagprof_type) :: sum  ! /sum - 
endtype

  
type type_coreimpurediag_energy  !    
  type (type_coreimpurediagprof_type) :: ionization  ! /ionization - 
  type (type_coreimpurediagprof_type) :: recombin  ! /recombin - 
  type (type_coreimpurediagprof_type) :: sum  ! /sum - 
endtype

  
type type_coreimpurediag_type  !    
  type (type_coreimpurediag_radiation) :: radiation  ! /radiation - 
  type (type_coreimpurediag_energy) :: energy  ! /energy - 
endtype

  
type type_impurity_type  !    
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - Impurity ionisation state (averaged for bundle); Time-dependent; Array2D (nrho,nzimp)
  real(EUITM_R8),pointer  :: zsq(:,:) => null()     ! /zsq - Z^2, Square of impurity ionisation state (averaged for bundle); Time-dependent; Array2D (nrho,nzimp)
  real(EUITM_R8),pointer  :: nz(:,:) => null()     ! /nz - Density of impurity in a given charge state [m^-3]. Time-dependent; Array2D (nrho,nzimp)
  real(EUITM_R8),pointer  :: tz(:,:) => null()     ! /tz - Temperature of impurity in a given charge state [m^-3]. Time-dependent; Array2D (nrho,nzimp)
  type (type_sourceimp) :: source_term  ! /source_term - Source term for each charge state. Time-dependent.
  type (type_boundaryimp) :: boundary  ! /boundary - Boundary condition for each charge state. Time-dependent
  type (type_coretransimp) :: transp_coef  ! /transp_coef - Transport coefficients for each charge state
  type (type_fluximp) :: flux  ! /flux - Fluxes of impurity particles, two definitions [m^-2.s^-1]. Time-dependent.
  real(EUITM_R8),pointer  :: time_deriv(:,:) => null()     ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Array2D (nrho,nzimp)
  type (type_coreimpurediag_type) :: diagnostic  ! /diagnostic - 
endtype

  
type type_coreimpurdiag_sum_radiation  !    
  type (type_coreimpurediagsum_type) :: line_rad  ! /line_rad - 
  type (type_coreimpurediagsum_type) :: brem_radrec  ! /brem_radrec - 
  type (type_coreimpurediagsum_type) :: sum  ! /sum - 
endtype

  
type type_coreimpurediag_sum_energy  !    
  type (type_coreimpurediagsum_type) :: ionization  ! /ionization - 
  type (type_coreimpurediagsum_type) :: recombin  ! /recombin - 
  type (type_coreimpurediagsum_type) :: sum  ! /sum - 
endtype

  
type type_coreimpurediag_sum  !    
  type (type_coreimpurdiag_sum_radiation) :: radiation  ! /radiation - 
  type (type_coreimpurediag_sum_energy) :: energy  ! /energy - 
endtype
  
type type_sourceimp_mask  !    Structure for the total source term for the transport equation (impurities). Time-dependent;
  integer  :: value=0       ! /value - Value of the source term [m^-3.s^-1]; Time-dependent; Array2D (nrho,nzimp)
  integer  :: integral=0       ! /integral - Integral from 0 to rho of the source term. Time-dependent; Array2D(nrho,nzimp)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
endtype
  
type type_coretransimp_mask  !    Structure for the transport coefficients for the transport equation (impurities). Time-dependent;
  integer  :: diff=0       ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Array2D(nrho,nzimp)
  integer  :: vconv=0       ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Array2D (nrho,nzimp)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
endtype
  
type type_boundaryimp_mask  !    Structure for the boundary condition of core transport equations (impurities) Time-dependent
  integer  :: value=0       ! /value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-field, 2-f
  integer  :: source=0       ! /source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=0       ! /type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  integer  :: rho=0       ! /rho - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype
  
type type_fluximp_mask  !    Structure for the fluxes of a field of the core transport equations (impurities); Time-dependent;
  integer  :: flux_dv=0       ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Array2D (nrho,nzimp)
  integer  :: flux_interp=0       ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype
  
type type_coreimpurediagprof_type_mask  !    
  integer  :: profile=0       ! /profile - Profile of the radiation or energy sources. Time-dependent. Array2D (nrho,nzimp or nimp)
  integer  :: integral=0       ! /integral - Running integral over nrho of the radiation or energy sources. Time-dependent. Array2D (nrho,nzimp o
endtype
  
type type_coreimpurediagsum_type_mask  !    
  integer  :: profile=0       ! /profile - Profile of the radiation or energy sources. Time-dependent. Array1D (nrho)
  integer  :: integral=0       ! /integral - Running integral over nrho of the radiation or energy sources. Time-dependent. Array1D (nrho)
endtype
  
type type_coreimpurediag_radiation_mask  !    
  type (type_coreimpurediagprof_type_mask) :: line_rad  ! /line_rad - 
  type (type_coreimpurediagprof_type_mask) :: brem_radrec  ! /brem_radrec - 
  type (type_coreimpurediagprof_type_mask) :: sum  ! /sum - 
endtype
  
type type_coreimpurediag_energy_mask  !    
  type (type_coreimpurediagprof_type_mask) :: ionization  ! /ionization - 
  type (type_coreimpurediagprof_type_mask) :: recombin  ! /recombin - 
  type (type_coreimpurediagprof_type_mask) :: sum  ! /sum - 
endtype
  
type type_coreimpurediag_type_mask  !    
  type (type_coreimpurediag_radiation_mask) :: radiation  ! /radiation - 
  type (type_coreimpurediag_energy_mask) :: energy  ! /energy - 
endtype
  
type type_impurity_type_mask  !    
  integer  :: z=0       ! /z - Impurity ionisation state (averaged for bundle); Time-dependent; Array2D (nrho,nzimp)
  integer  :: zsq=0       ! /zsq - Z^2, Square of impurity ionisation state (averaged for bundle); Time-dependent; Array2D (nrho,nzimp)
  integer  :: nz=0       ! /nz - Density of impurity in a given charge state [m^-3]. Time-dependent; Array2D (nrho,nzimp)
  integer  :: tz=0       ! /tz - Temperature of impurity in a given charge state [m^-3]. Time-dependent; Array2D (nrho,nzimp)
  type (type_sourceimp_mask) :: source_term  ! /source_term - Source term for each charge state. Time-dependent.
  type (type_boundaryimp_mask) :: boundary  ! /boundary - Boundary condition for each charge state. Time-dependent
  type (type_coretransimp_mask) :: transp_coef  ! /transp_coef - Transport coefficients for each charge state
  type (type_fluximp_mask) :: flux  ! /flux - Fluxes of impurity particles, two definitions [m^-2.s^-1]. Time-dependent.
  integer  :: time_deriv=0       ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Array2D (nrho,nzimp)
  type (type_coreimpurediag_type_mask) :: diagnostic  ! /diagnostic - 
endtype
  
type type_coreimpurdiag_sum_radiation_mask  !    
  type (type_coreimpurediagsum_type_mask) :: line_rad  ! /line_rad - 
  type (type_coreimpurediagsum_type_mask) :: brem_radrec  ! /brem_radrec - 
  type (type_coreimpurediagsum_type_mask) :: sum  ! /sum - 
endtype
  
type type_coreimpurediag_sum_energy_mask  !    
  type (type_coreimpurediagsum_type_mask) :: ionization  ! /ionization - 
  type (type_coreimpurediagsum_type_mask) :: recombin  ! /recombin - 
  type (type_coreimpurediagsum_type_mask) :: sum  ! /sum - 
endtype
  
type type_coreimpurediag_sum_mask  !    
  type (type_coreimpurdiag_sum_radiation_mask) :: radiation  ! /radiation - 
  type (type_coreimpurediag_sum_energy_mask) :: energy  ! /energy - 
endtype

  
type type_coreimpur  !    
  type (type_datainfo) :: datainfo  ! /coreimpur/datainfo - 
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /coreimpur/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /coreimpur/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /coreimpur/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /coreimpur/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /coreimpur/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /coreimpur/source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
  integer,pointer  :: flag(:) => null()      ! /coreimpur/flag - Flag describing how the profile has been processed : 0-not calculated; 1-interpretative; 2-calculate
  type (type_desc_impur) :: desc_impur  ! /coreimpur/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coreimpur/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  character(len=132), dimension(:), pointer ::atomic_data => null()       ! /coreimpur/atomic_data - Reference for the atomic data used for each impurity. Array of strings (nimp)
  type (type_impurity_type),pointer :: impurity(:) => null()  ! /coreimpur/impurity(i) - Array(nimp). Time-dependent
  type (type_coreimpurediag_type) :: diagnostic  ! /coreimpur/diagnostic - 
  type (type_coreimpurediag_sum) :: diagnosticsum  ! /coreimpur/diagnosticsum - 
  type (type_codeparam) :: codeparam  ! /coreimpur/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coreimpur/time - Time [s]; Time-dependent; Scalar.
endtype
  
type type_coreimpur_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coreimpur/datainfo - 
  integer  :: rho_tor_norm=0       ! /coreimpur/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: rho_tor=0       ! /coreimpur/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: psi=0       ! /coreimpur/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  integer  :: volume=0       ! /coreimpur/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  integer  :: area=0       ! /coreimpur/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  integer  :: source=0       ! /coreimpur/source - Source of the profile (any comment describing the origin of the impurity profiles : code, path to di
  integer  :: flag=0       ! /coreimpur/flag - Flag describing how the profile has been processed : 0-not calculated; 1-interpretative; 2-calculate
  type (type_desc_impur_mask) :: desc_impur  ! /coreimpur/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coreimpur/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  integer  :: atomic_data=0       ! /coreimpur/atomic_data - Reference for the atomic data used for each impurity. Array of strings (nimp)
  type (type_impurity_type_mask),pointer :: impurity(:) => null()  ! /coreimpur/impurity(i) - Array(nimp). Time-dependent
  type (type_coreimpurediag_type_mask) :: diagnostic  ! /coreimpur/diagnostic - 
  type (type_coreimpurediag_sum_mask) :: diagnosticsum  ! /coreimpur/diagnosticsum - 
  type (type_codeparam_mask) :: codeparam  ! /coreimpur/codeparam - 
  integer  :: time=0       ! /coreimpur/time - Time [s]; Time-dependent; Scalar.
endtype

! ***********  Include coreneutrals.xsd
  
type type_boundary_neutrals  !    Structure for the boundary condition of core transport equations (neutrals). Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value of the boundary condition. Unit depends on type, respectively [1-field, 2-field.m^-1, 3-m, 4-f
  integer  :: type=-999999999       ! /type - Type of the boundary condition for the transport solver. 0- equation not solved; 1- value of the fie
  real(EUITM_R8)  :: rho_tor=-9.0E40_EUITM_R8       ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype

  
type type_corefieldneutral  !    Structure for a main field of core neutral transport equations; Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Array1D(nrho). Time-dependent
  real(EUITM_R8),pointer  :: flux(:) => null()     ! /flux - Net neutral flux through the magnetic surface, positive values correspond to the direction from the 
  type (type_boundary_neutrals) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype

  
type type_corefieldneutrale  !    Structure for a main field of core neutral transport equations, (Temperature, with flux as energy); Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Array1D(nrho). Time-dependent
  real(EUITM_R8),pointer  :: flux(:) => null()     ! /flux - Net flux of the kinetic energy through the magnetic surface (3/2*E*n*V), positive values correspond 
  type (type_boundary_neutrals) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype

  
type type_corefieldneutralv  !    Structure for a main field of core neutral transport equations (without flux variable); Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Vector(nrho). Time-dependent; 
  type (type_boundary_neutrals) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype

  
type type_corefieldneutralv0  !    Neutral velocity
  type (type_corefieldneutralv) :: toroidal  ! /toroidal - Neutral velocity in the toroidal direction [m.s^-1]. Positive is anti-clockwise when viewed from abo
  type (type_corefieldneutralv) :: poloidal  ! /poloidal - Velocity of neutrals in the poloidal direction. 0 is directed towards low field side, pi is towards 
  type (type_corefieldneutralv) :: radial  ! /radial - Neutral velocity in the radial direction (perpendicular to the magnetic surface), positive is from t
endtype

  
type type_recycling_neutrals  !    Recycling coefficients
  real(EUITM_R8),pointer  :: particles(:) => null()     ! /particles - Particle recycling coefficient corresponding to the conversion to the neutral type INEUT. Vector(nne
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /energy - Energy recycling coefficient corresponding to the conversion to the neutral type INEUT. Vector(nneut
endtype

  
type type_sputtering_neutrals  !    Sputtering coefficients
  real(EUITM_R8),pointer  :: physical(:) => null()     ! /physical - Effective coefficient of physical sputtering of the neutral type INEUT. Vector(nneut). Time-dependen
  real(EUITM_R8),pointer  :: chemical(:) => null()     ! /chemical - Effective coefficient of chemical sputtering of the neutral type INEUT. Vector(nneut). Time-dependen
endtype

  
type type_coreneutrals_atomlist  !    List of the atoms that enter the composition of the neutral species. Vector(natm)
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /amn - Atomic mass number; Float
  real(EUITM_R8)  :: zn=-9.0E40_EUITM_R8       ! /zn - Nuclear charge; Float
  type (type_identifier) :: ionimptype  ! /ionimptype - Identifier whether ion in coreprof or impurity in coreimpur.
  integer  :: ionimpindex=-999999999       ! /ionimpindex - Index in composition or desc_impur of the corresponding ion or impurity.
endtype

  
type type_composition_neutrals  !    Description of neutrals species
  type (type_coreneutrals_atomlist),pointer :: atomlist(:) => null()  ! /atomlist(i) - List of the atoms that enter the composition of the neutral species. Vector(natm)
  type (type_composition_neutralscomp),pointer :: neutral(:) => null()  ! /neutral(i) - List of neutrals.  Vector(nneut)
endtype

  
type type_coefficients_neutrals  !    Recycling and sputtering coefficients used by the neutral solver. The particular causing ion or impurity charge state is determine
  type (type_recycling_neutrals) :: recycling  ! /recycling - Recycling coefficients. Time-dependent
  type (type_sputtering_neutrals) :: sputtering  ! /sputtering - Sputtering coefficients. Time-dependent
endtype

  
type type_coreneutrals_neutraltype  !    Array (ntype) over neutral types.
  type (type_corefieldneutral) :: n0  ! /n0 - Neutral density [m^-3].  Time-dependent;
  type (type_corefieldneutrale) :: t0  ! /t0 - Neutral temperature [eV]. Time-dependent;
  type (type_corefieldneutralv0) :: v0  ! /v0 - Neutral velocity [m.s^-1]. Time-dependent;
endtype

  
type type_neutral_complex_type  !    
  type (type_coreneutrals_neutraltype),pointer :: neutraltype(:) => null()  ! /neutraltype(i) - Array (ntype) over neutral types. Time-dependent.
  real(EUITM_R8),pointer  :: prad0(:) => null()     ! /prad0 - Power radiated by neutrals [W.m^-3]. Vector (nrho). Time-dependent.
endtype
  
type type_boundary_neutrals_mask  !    Structure for the boundary condition of core transport equations (neutrals). Time-dependent;
  integer  :: value=0       ! /value - Value of the boundary condition. Unit depends on type, respectively [1-field, 2-field.m^-1, 3-m, 4-f
  integer  :: type=0       ! /type - Type of the boundary condition for the transport solver. 0- equation not solved; 1- value of the fie
  integer  :: rho_tor=0       ! /rho_tor - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
endtype
  
type type_corefieldneutral_mask  !    Structure for a main field of core neutral transport equations; Time-dependent;
  integer  :: value=0       ! /value - Signal value; Array1D(nrho). Time-dependent
  integer  :: flux=0       ! /flux - Net neutral flux through the magnetic surface, positive values correspond to the direction from the 
  type (type_boundary_neutrals_mask) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype
  
type type_corefieldneutrale_mask  !    Structure for a main field of core neutral transport equations, (Temperature, with flux as energy); Time-dependent;
  integer  :: value=0       ! /value - Signal value; Array1D(nrho). Time-dependent
  integer  :: flux=0       ! /flux - Net flux of the kinetic energy through the magnetic surface (3/2*E*n*V), positive values correspond 
  type (type_boundary_neutrals_mask) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype
  
type type_corefieldneutralv_mask  !    Structure for a main field of core neutral transport equations (without flux variable); Time-dependent;
  integer  :: value=0       ! /value - Signal value; Vector(nrho). Time-dependent; 
  type (type_boundary_neutrals_mask) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
endtype
  
type type_corefieldneutralv0_mask  !    Neutral velocity
  type (type_corefieldneutralv_mask) :: toroidal  ! /toroidal - Neutral velocity in the toroidal direction [m.s^-1]. Positive is anti-clockwise when viewed from abo
  type (type_corefieldneutralv_mask) :: poloidal  ! /poloidal - Velocity of neutrals in the poloidal direction. 0 is directed towards low field side, pi is towards 
  type (type_corefieldneutralv_mask) :: radial  ! /radial - Neutral velocity in the radial direction (perpendicular to the magnetic surface), positive is from t
endtype
  
type type_recycling_neutrals_mask  !    Recycling coefficients
  integer  :: particles=0       ! /particles - Particle recycling coefficient corresponding to the conversion to the neutral type INEUT. Vector(nne
  integer  :: energy=0       ! /energy - Energy recycling coefficient corresponding to the conversion to the neutral type INEUT. Vector(nneut
endtype
  
type type_sputtering_neutrals_mask  !    Sputtering coefficients
  integer  :: physical=0       ! /physical - Effective coefficient of physical sputtering of the neutral type INEUT. Vector(nneut). Time-dependen
  integer  :: chemical=0       ! /chemical - Effective coefficient of chemical sputtering of the neutral type INEUT. Vector(nneut). Time-dependen
endtype
  
type type_coreneutrals_atomlist_mask  !    List of the atoms that enter the composition of the neutral species. Vector(natm)
  integer  :: amn=0       ! /amn - Atomic mass number; Float
  integer  :: zn=0       ! /zn - Nuclear charge; Float
  type (type_identifier_mask) :: ionimptype  ! /ionimptype - Identifier whether ion in coreprof or impurity in coreimpur.
  integer  :: ionimpindex=0       ! /ionimpindex - Index in composition or desc_impur of the corresponding ion or impurity.
endtype
  
type type_composition_neutrals_mask  !    Description of neutrals species
  type (type_coreneutrals_atomlist_mask),pointer :: atomlist(:) => null()  ! /atomlist(i) - List of the atoms that enter the composition of the neutral species. Vector(natm)
  type (type_composition_neutralscomp_mask),pointer :: neutral(:) => null()  ! /neutral(i) - List of neutrals.  Vector(nneut)
endtype
  
type type_coefficients_neutrals_mask  !    Recycling and sputtering coefficients used by the neutral solver. The particular causing ion or impurity charge state is determine
  type (type_recycling_neutrals_mask) :: recycling  ! /recycling - Recycling coefficients. Time-dependent
  type (type_sputtering_neutrals_mask) :: sputtering  ! /sputtering - Sputtering coefficients. Time-dependent
endtype
  
type type_coreneutrals_neutraltype_mask  !    Array (ntype) over neutral types.
  type (type_corefieldneutral_mask) :: n0  ! /n0 - Neutral density [m^-3].  Time-dependent;
  type (type_corefieldneutrale_mask) :: t0  ! /t0 - Neutral temperature [eV]. Time-dependent;
  type (type_corefieldneutralv0_mask) :: v0  ! /v0 - Neutral velocity [m.s^-1]. Time-dependent;
endtype
  
type type_neutral_complex_type_mask  !    
  type (type_coreneutrals_neutraltype_mask),pointer :: neutraltype(:) => null()  ! /neutraltype(i) - Array (ntype) over neutral types. Time-dependent.
  integer  :: prad0=0       ! /prad0 - Power radiated by neutrals [W.m^-3]. Vector (nrho). Time-dependent.
endtype

  
type type_impcoeff  !    Array over charge states for this particular impurity.
  type (type_coefficients_neutrals),pointer :: chargestate(:) => null()  ! /coreneutrals/impcoeff(i)/chargestate(i) - Time-dependent
endtype
  
type type_impcoeff_mask  !    Array over charge states for this particular impurity.
  type (type_coefficients_neutrals_mask),pointer :: chargestate(:) => null()  ! /coreneutrals/impcoeff(i)/chargestate(i) - Time-dependent
endtype

  
type type_coreneutrals  !    
  type (type_datainfo) :: datainfo  ! /coreneutrals/datainfo - 
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /coreneutrals/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /coreneutrals/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /coreneutrals/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /coreneutrals/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /coreneutrals/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  type (type_composition_neutrals) :: neutcompo  ! /coreneutrals/neutcompo - Description of neutrals species. OBSOLESCENT
  type (type_composition) :: composition  ! /coreneutrals/composition - 
  type (type_desc_impur) :: desc_impur  ! /coreneutrals/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coreneutrals/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_neutral_complex_type),pointer :: profiles(:) => null()  ! /coreneutrals/profiles(i) - Profiles derived from the fields solved in the transport equations, or from experiment. Array(nneut)
  type (type_coefficients_neutrals),pointer :: ioncoeff(:) => null()  ! /coreneutrals/ioncoeff(i) - Recycling and sputtering coefficients for each ion in composition. Array(nion). Time-dependent
  type (type_impcoeff),pointer :: impcoeff(:) => null()  ! /coreneutrals/impcoeff(i) - Recycling and sputtering coefficients for each impurity ion in desc_impur. Array(nimp). Time-depende
  type (type_codeparam) :: codeparam  ! /coreneutrals/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coreneutrals/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_coreneutrals_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coreneutrals/datainfo - 
  integer  :: rho_tor=0       ! /coreneutrals/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: rho_tor_norm=0       ! /coreneutrals/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: psi=0       ! /coreneutrals/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  integer  :: volume=0       ! /coreneutrals/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  integer  :: area=0       ! /coreneutrals/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  type (type_composition_neutrals_mask) :: neutcompo  ! /coreneutrals/neutcompo - Description of neutrals species. OBSOLESCENT
  type (type_composition_mask) :: composition  ! /coreneutrals/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /coreneutrals/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coreneutrals/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_neutral_complex_type_mask),pointer :: profiles(:) => null()  ! /coreneutrals/profiles(i) - Profiles derived from the fields solved in the transport equations, or from experiment. Array(nneut)
  type (type_coefficients_neutrals_mask),pointer :: ioncoeff(:) => null()  ! /coreneutrals/ioncoeff(i) - Recycling and sputtering coefficients for each ion in composition. Array(nion). Time-dependent
  type (type_impcoeff_mask),pointer :: impcoeff(:) => null()  ! /coreneutrals/impcoeff(i) - Recycling and sputtering coefficients for each impurity ion in desc_impur. Array(nimp). Time-depende
  type (type_codeparam_mask) :: codeparam  ! /coreneutrals/codeparam - 
  integer  :: time=0       ! /coreneutrals/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include coreprof.xsd
  
type type_sourceel  !    Structure for the total source term for the transport equation (electrons). Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value of the source term; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: integral(:) => null()     ! /integral - Integral from 0 to rho of the source term. Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_sourceion  !    Structure for the total source term for the transport equation (ions). Time-dependent;
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value of the source term; Time-dependent; Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: integral(:,:) => null()     ! /integral - Integral from 0 to rho of the source term. Time-dependent; Matrix (nrho,nion)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_coretransel  !    Structure for the transport coefficients for the transport equation (electrons). Time-dependent;
  real(EUITM_R8),pointer  :: diff(:) => null()     ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: vconv(:) => null()     ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_coretransion  !    Structure for the transport coefficients for the transport equation (ions). Time-dependent;
  real(EUITM_R8),pointer  :: diff(:,:) => null()     ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: vconv(:,:) => null()     ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Matrix (nrho,nion)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_fluxel  !    Structure for the fluxes of a field of the core transport equations (electrons); Time-dependent;
  real(EUITM_R8),pointer  :: flux_dv(:) => null()     ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: flux_interp(:) => null()     ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype

  
type type_fluxion  !    Structure for the fluxes of a field of the core transport equations (ions); Time-dependent;
  real(EUITM_R8),pointer  :: flux_dv(:,:) => null()     ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: flux_interp(:,:) => null()     ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype

  
type type_corefield  !    Structure for a main field of core transport equations; Time-dependent;
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: ddrho(:) => null()     ! /ddrho - Radial derivative (dvalue/drho_tor) [signal_value_unit.m^-1]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: d2drho2(:) => null()     ! /d2drho2 - Second order radial derivative (d2value/drho_tor^2) [signal_value_unit.m^-2]; Time-dependent; Vector
  real(EUITM_R8),pointer  :: ddt(:) => null()     ! /ddt - Time derivative (dvalue/dtime) [signal_value_unit.s^-1]; Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer  :: flag=-999999999       ! /flag - Flag describing how the profile has been processed : 0-not calculated 1-interpretative; 2-calculated
  type (type_boundaryel) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
  type (type_sourceel) :: source_term  ! /source_term - Total source term for the transport equation. Time-dependent.
  type (type_coretransel) :: transp_coef  ! /transp_coef - Total transport coefficients. Time-dependent.
  type (type_fluxel) :: flux  ! /flux - Fluxes of the quantity, two definitions. Time-dependent.
  real(EUITM_R8),pointer  :: flux_dv_surf(:) => null()     ! /flux_dv_surf - Net flux through the magnetic surface, i.e. integral over the magnetic surface area of flux_dv. Time
  real(EUITM_R8),pointer  :: time_deriv(:) => null()     ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Vector (nrho)
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype

  
type type_corefieldion  !    Structure for an ion field of core transport equations; Time-dependent;
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Signal value; Time-dependent; Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: ddrho(:,:) => null()     ! /ddrho - Radial derivative (dvalue/drho_tor) [signal_value_unit.m^-1]; Time-dependent; Matrix (nrho,nion)
  real(EUITM_R8),pointer  :: d2drho2(:,:) => null()     ! /d2drho2 - Second order radial derivative (d2value/drho_tor^2) [signal_value_unit.m^-2]; Time-dependent; Matrix
  real(EUITM_R8),pointer  :: ddt(:,:) => null()     ! /ddt - Time derivative (dvalue/dtime) [signal_value_unit.s^-1]; Time-dependent; Matrix (nrho,nion)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer,pointer  :: flag(:) => null()      ! /flag - Flag describing how the profile has been processed : 0-not calculated 1-interpretative; 2-calculated
  type (type_boundaryion) :: boundary  ! /boundary - Boundary condition for the transport equation
  type (type_sourceion) :: source_term  ! /source_term - Total source term for the transport equation. Time-dependent.
  type (type_coretransion) :: transp_coef  ! /transp_coef - Total transport coefficients. Time-dependent.
  type (type_fluxion) :: flux  ! /flux - Fluxes of the quantity, two definitions. Time-dependent.
  real(EUITM_R8),pointer  :: flux_dv_surf(:,:) => null()     ! /flux_dv_surf - Net flux through the magnetic surface, i.e. integral over the magnetic surface area of flux_dv. Time
  real(EUITM_R8),pointer  :: time_deriv(:,:) => null()     ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Matrix (nrho,nion)
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype

  
type type_coreprofile  !    Structure for core plasma profile; Time-dependent
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Signal value; Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_coreprofion  !    Structure for core plasma ion profile; Time-dependent
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Signal value; Time-dependent; Matrix (nrho,nion)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_sourceel_mask  !    Structure for the total source term for the transport equation (electrons). Time-dependent;
  integer  :: value=0       ! /value - Value of the source term; Time-dependent; Vector (nrho)
  integer  :: integral=0       ! /integral - Integral from 0 to rho of the source term. Time-dependent; Vector (nrho)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_sourceion_mask  !    Structure for the total source term for the transport equation (ions). Time-dependent;
  integer  :: value=0       ! /value - Value of the source term; Time-dependent; Matrix (nrho,nion)
  integer  :: integral=0       ! /integral - Integral from 0 to rho of the source term. Time-dependent; Matrix (nrho,nion)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_coretransel_mask  !    Structure for the transport coefficients for the transport equation (electrons). Time-dependent;
  integer  :: diff=0       ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Vector (nrho)
  integer  :: vconv=0       ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Vector (nrho)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_coretransion_mask  !    Structure for the transport coefficients for the transport equation (ions). Time-dependent;
  integer  :: diff=0       ! /diff - Diffusion coefficient [m^2.s^-1]. Time-dependent; Matrix (nrho,nion)
  integer  :: vconv=0       ! /vconv - Convection coefficient [m.s^-1]. Time-dependent; Matrix (nrho,nion)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_fluxel_mask  !    Structure for the fluxes of a field of the core transport equations (electrons); Time-dependent;
  integer  :: flux_dv=0       ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Vector (nrho)
  integer  :: flux_interp=0       ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype
  
type type_fluxion_mask  !    Structure for the fluxes of a field of the core transport equations (ions); Time-dependent;
  integer  :: flux_dv=0       ! /flux_dv - Flux of the field calculated from the transport coefficients. Time-dependent; Matrix (nrho,nion)
  integer  :: flux_interp=0       ! /flux_interp - Interpretative flux deduced from measured data, the integral of the source term, and the time deriva
endtype
  
type type_corefield_mask  !    Structure for a main field of core transport equations; Time-dependent;
  integer  :: value=0       ! /value - Signal value; Time-dependent; Vector (nrho)
  integer  :: ddrho=0       ! /ddrho - Radial derivative (dvalue/drho_tor) [signal_value_unit.m^-1]; Time-dependent; Vector (nrho)
  integer  :: d2drho2=0       ! /d2drho2 - Second order radial derivative (d2value/drho_tor^2) [signal_value_unit.m^-2]; Time-dependent; Vector
  integer  :: ddt=0       ! /ddt - Time derivative (dvalue/dtime) [signal_value_unit.s^-1]; Time-dependent; Vector (nrho)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer  :: flag=0       ! /flag - Flag describing how the profile has been processed : 0-not calculated 1-interpretative; 2-calculated
  type (type_boundaryel_mask) :: boundary  ! /boundary - Boundary condition for the transport equation. Time-dependent.
  type (type_sourceel_mask) :: source_term  ! /source_term - Total source term for the transport equation. Time-dependent.
  type (type_coretransel_mask) :: transp_coef  ! /transp_coef - Total transport coefficients. Time-dependent.
  type (type_fluxel_mask) :: flux  ! /flux - Fluxes of the quantity, two definitions. Time-dependent.
  integer  :: flux_dv_surf=0       ! /flux_dv_surf - Net flux through the magnetic surface, i.e. integral over the magnetic surface area of flux_dv. Time
  integer  :: time_deriv=0       ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Vector (nrho)
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype
  
type type_corefieldion_mask  !    Structure for an ion field of core transport equations; Time-dependent;
  integer  :: value=0       ! /value - Signal value; Time-dependent; Matrix (nrho,nion)
  integer  :: ddrho=0       ! /ddrho - Radial derivative (dvalue/drho_tor) [signal_value_unit.m^-1]; Time-dependent; Matrix (nrho,nion)
  integer  :: d2drho2=0       ! /d2drho2 - Second order radial derivative (d2value/drho_tor^2) [signal_value_unit.m^-2]; Time-dependent; Matrix
  integer  :: ddt=0       ! /ddt - Time derivative (dvalue/dtime) [signal_value_unit.s^-1]; Time-dependent; Matrix (nrho,nion)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer  :: flag=0       ! /flag - Flag describing how the profile has been processed : 0-not calculated 1-interpretative; 2-calculated
  type (type_boundaryion_mask) :: boundary  ! /boundary - Boundary condition for the transport equation
  type (type_sourceion_mask) :: source_term  ! /source_term - Total source term for the transport equation. Time-dependent.
  type (type_coretransion_mask) :: transp_coef  ! /transp_coef - Total transport coefficients. Time-dependent.
  type (type_fluxion_mask) :: flux  ! /flux - Fluxes of the quantity, two definitions. Time-dependent.
  integer  :: flux_dv_surf=0       ! /flux_dv_surf - Net flux through the magnetic surface, i.e. integral over the magnetic surface area of flux_dv. Time
  integer  :: time_deriv=0       ! /time_deriv - Integral of the time derivative term of the transport equation. Time-dependent. Matrix (nrho,nion)
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype
  
type type_coreprofile_mask  !    Structure for core plasma profile; Time-dependent
  integer  :: value=0       ! /value - Signal value; Time-dependent; Vector (nrho)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_coreprofion_mask  !    Structure for core plasma ion profile; Time-dependent
  integer  :: value=0       ! /value - Signal value; Time-dependent; Matrix (nrho,nion)
  integer  :: source=0       ! /source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_boundary  !    
  real(EUITM_R8),pointer  :: value(:) => null()     ! /coreprof/psi/boundary/value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-Wb, 2-A, 3
  character(len=132), dimension(:), pointer ::source => null()       ! /coreprof/psi/boundary/source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=-999999999       ! /coreprof/psi/boundary/type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  real(EUITM_R8)  :: rho=-9.0E40_EUITM_R8       ! /coreprof/psi/boundary/rho - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
  type (type_codeparam) :: codeparam  ! /coreprof/psi/boundary/codeparam - 
endtype

  
type type_jni  !    
  real(EUITM_R8),pointer  :: value(:) => null()     ! /coreprof/psi/jni/value - Value of jni; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: integral(:) => null()     ! /coreprof/psi/jni/integral - Integral from 0 to rho of jni. Time-dependent; Vector (nrho)
  character(len=132), dimension(:), pointer ::source => null()       ! /coreprof/psi/jni/source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype
  
type type_boundary_mask  !    
  integer  :: value=0       ! /coreprof/psi/boundary/value - Value of the boundary condition (in case flag = 2). Unit depends on type, respectively [1-Wb, 2-A, 3
  integer  :: source=0       ! /coreprof/psi/boundary/source - Source of the boundary condition (any comment describing its origin : code, path to diagnostic signa
  integer  :: type=0       ! /coreprof/psi/boundary/type - Type of the boundary condition for the transport solver (in case flag = 2). 0- equation not solved; 
  integer  :: rho=0       ! /coreprof/psi/boundary/rho - Position of the boundary condition (in terms of toroidal flux coordinate) for the transport solver [
  type (type_codeparam_mask) :: codeparam  ! /coreprof/psi/boundary/codeparam - 
endtype
  
type type_jni_mask  !    
  integer  :: value=0       ! /coreprof/psi/jni/value - Value of jni; Time-dependent; Vector (nrho)
  integer  :: integral=0       ! /coreprof/psi/jni/integral - Integral from 0 to rho of jni. Time-dependent; Vector (nrho)
  integer  :: source=0       ! /coreprof/psi/jni/source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
endtype

  
type type_toroid_field  !    
  real(EUITM_R8)  :: b0=-9.0E40_EUITM_R8       ! /coreprof/toroid_field/b0 - Vacuum field at r0 [T]; Time-dependent. Scalar.
  real(EUITM_R8)  :: b0prime=-9.0E40_EUITM_R8       ! /coreprof/toroid_field/b0prime - Time derivative of the vacuum field at r0 [T/s]; Time-dependent. Scalar.
  real(EUITM_R8)  :: r0=-9.0E40_EUITM_R8       ! /coreprof/toroid_field/r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coreprof/toroid_field/time - Time [s] (exact time slice used from the time array of the source signal, here the toroidfield CPO. 
endtype

  
type type_psi  !    
  real(EUITM_R8),pointer  :: value(:) => null()     ! /coreprof/psi/value - Signal value [Wb]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: ddrho(:) => null()     ! /coreprof/psi/ddrho - Radial derivative (dvalue/drho_tor) [Wb.m^-1]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: d2drho2(:) => null()     ! /coreprof/psi/d2drho2 - Second order radial derivative (d2value/drho_tor2) [Wb.m^-2]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: ddt_rhotorn(:) => null()     ! /coreprof/psi/ddt_rhotorn - Time derivative of the poloidal flux at constant rho_tor_norm [V]. Time-dependent.
  real(EUITM_R8),pointer  :: ddt_phi(:) => null()     ! /coreprof/psi/ddt_phi - Time derivative of the poloidal flux at constant toroidal flux [V]. Time-dependent.
  character(len=132), dimension(:), pointer ::source => null()       ! /coreprof/psi/source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer  :: flag=-999999999       ! /coreprof/psi/flag - Flag describing how the profile has been processed : 0-not calculated; 1-interpretative; 2-calculate
  type (type_boundary) :: boundary  ! /coreprof/psi/boundary - Boundary condition for the transport equation. Time-dependent.
  type (type_jni) :: jni  ! /coreprof/psi/jni - Non-inductive parallel current density [A/m^2]; Time-dependent;
  type (type_coreprofile) :: sigma_par  ! /coreprof/psi/sigma_par - Parallel conductivity [ohm^-1.m^-1]. Time-dependent
  type (type_codeparam) :: codeparam  ! /coreprof/psi/codeparam - 
endtype

  
type type_profiles1d  !    
  type (type_coreprofile) :: pe  ! /coreprof/profiles1d/pe - Electron pressure [Pa]; Time-dependent;
  type (type_coreprofile) :: dpedt  ! /coreprof/profiles1d/dpedt - Time derivative of the electron pressure [Pa/s]; Time-dependent;
  type (type_coreprofion) :: pi  ! /coreprof/profiles1d/pi - Ion pressure [Pa]; Time-dependent;
  type (type_coreprofile) :: pi_tot  ! /coreprof/profiles1d/pi_tot - Total ion pressure (sum of the species) [Pa]; Time-dependent;
  type (type_coreprofile) :: dpi_totdt  ! /coreprof/profiles1d/dpi_totdt - Time derivative of the total ion pressure [Pa/s]; Time-dependent;
  type (type_coreprofile) :: pr_th  ! /coreprof/profiles1d/pr_th - Thermal pressure (electrons+ions) [Pa]; Time-dependent;
  type (type_coreprofile) :: pr_perp  ! /coreprof/profiles1d/pr_perp - Total perpendicular pressure (electrons+ions, thermal+non-thermal) [Pa]; Time-dependent;
  type (type_coreprofile) :: pr_parallel  ! /coreprof/profiles1d/pr_parallel - Total parallel pressure (electrons+ions, thermal+non-thermal) [Pa]; Time-dependent;
  type (type_coreprofile) :: jtot  ! /coreprof/profiles1d/jtot - total parallel current density = average(jtot.B) / B0, where B0 = coreprof/toroid_field/b0 [A/m^2]; 
  type (type_coreprofile) :: jni  ! /coreprof/profiles1d/jni - non-inductive parallel current density = average(jni.B) / B0, where B0 = coreprof/toroid_field/b0 [A
  type (type_coreprofile) :: jphi  ! /coreprof/profiles1d/jphi - total toroidal current density = average(jphi/R) / average(1/R) [A/m^2]; Time-dependent;
  type (type_coreprofile) :: joh  ! /coreprof/profiles1d/joh - ohmic parallel current density = average(joh.B) / B0, where B0 = coreprof/toroid_field/b0 [A/m^2]; T
  type (type_coreprofile) :: vloop  ! /coreprof/profiles1d/vloop - Toroidal loop voltage [V]. Time-dependent.
  type (type_coreprofile) :: sigmapar  ! /coreprof/profiles1d/sigmapar - Parallel conductivity [ohm^-1.m^-1]. Time-dependent.
  type (type_sourceel) :: qoh  ! /coreprof/profiles1d/qoh - ohmic heating [W/m^3]; Time-dependent;
  type (type_coreprofile) :: qei  ! /coreprof/profiles1d/qei - Collisional heat transfer from electrons to ions (equipartition term) [W/m^3]; Time-dependent;
  type (type_coreprofile) :: eparallel  ! /coreprof/profiles1d/eparallel - Parallel electric field = average(E.B) / B0, where B0 = coreprof/toroid_field/b0 [V.m^-1]. Time-depe
  type (type_coreprofile) :: e_b  ! /coreprof/profiles1d/e_b - Average(E.B) [V.T.m^-1]. Time-dependent.
  type (type_coreprofile) :: q  ! /coreprof/profiles1d/q - Safety factor profile; Time-dependent;
  type (type_coreprofile) :: shear  ! /coreprof/profiles1d/shear - Magnetic shear profile; Time-dependent;
  type (type_coreprofion) :: ns  ! /coreprof/profiles1d/ns - Density of fast ions, for the various ion species [m^-3]; Time-dependent;
  type (type_coreprofion) :: mtor  ! /coreprof/profiles1d/mtor - Toroidal momentum of the various ion species [UNITS?]; Time-dependent;
  type (type_coreprofion) :: wtor  ! /coreprof/profiles1d/wtor - Angular toroidal rotation frequency of the various ion species [s^-1]; Time-dependent;
  type (type_coreprofion) :: vpol  ! /coreprof/profiles1d/vpol - Neoclassical poloidal rotation of each ion species [m/s]. Time-dependent.
  type (type_coreprofile) :: zeff  ! /coreprof/profiles1d/zeff - Effective charge profile; Time-dependent;
  type (type_coreprofile) :: bpol  ! /coreprof/profiles1d/bpol - Average poloidal magnetic field, defined as sqrt(ave(grad rho^2/R^2)).dpsi/drho [T]. Time-dependent.
  type (type_coreprofile) :: dvprimedt  ! /coreprof/profiles1d/dvprimedt - Time derivative of the radial derivative of the volume enclosed in the flux surface, i.e. d/dt(dV/dr
endtype

  
type type_globalparam  !    
  real(EUITM_R8)  :: current_tot=-9.0E40_EUITM_R8       ! /coreprof/globalparam/current_tot - Total plasma current [A]; Time-dependent; Scalar
  real(EUITM_R8)  :: current_bnd=-9.0E40_EUITM_R8       ! /coreprof/globalparam/current_bnd - Plasma current inside transport solver boundary rho_tor_bnd [A]; Time-dependent; Scalar
  real(EUITM_R8)  :: current_ni=-9.0E40_EUITM_R8       ! /coreprof/globalparam/current_ni - Total non-inductive parallel current [A]; Time-dependent; Scalar
  real(EUITM_R8)  :: vloop=-9.0E40_EUITM_R8       ! /coreprof/globalparam/vloop - Toroidal loop voltage [V]; Time-dependent; Scalar
  real(EUITM_R8)  :: li=-9.0E40_EUITM_R8       ! /coreprof/globalparam/li - Internal inductance; Time-dependent; Scalar
  real(EUITM_R8)  :: beta_tor=-9.0E40_EUITM_R8       ! /coreprof/globalparam/beta_tor - toroidal beta; Time-dependent; Scalar
  real(EUITM_R8)  :: beta_normal=-9.0E40_EUITM_R8       ! /coreprof/globalparam/beta_normal - normalised beta; Time-dependent; Scalar
  real(EUITM_R8)  :: beta_pol=-9.0E40_EUITM_R8       ! /coreprof/globalparam/beta_pol - poloidal beta; Time-dependent; Scalar
  real(EUITM_R8)  :: w_dia=-9.0E40_EUITM_R8       ! /coreprof/globalparam/w_dia - Plasma energy content = 3/2 * int(p,dV) with p being the total pressure (pr_th + pr_perp). Time-depe
  type (type_rz0D) :: geom_axis  ! /coreprof/globalparam/geom_axis - RZ position of the geometric axis (defined as (Rmin+Rmax) / 2 and (Zmin+Zmax) / 2 of the boundary) [
endtype
  
type type_toroid_field_mask  !    
  integer  :: b0=0       ! /coreprof/toroid_field/b0 - Vacuum field at r0 [T]; Time-dependent. Scalar.
  integer  :: b0prime=0       ! /coreprof/toroid_field/b0prime - Time derivative of the vacuum field at r0 [T/s]; Time-dependent. Scalar.
  integer  :: r0=0       ! /coreprof/toroid_field/r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  integer  :: time=0       ! /coreprof/toroid_field/time - Time [s] (exact time slice used from the time array of the source signal, here the toroidfield CPO. 
endtype
  
type type_psi_mask  !    
  integer  :: value=0       ! /coreprof/psi/value - Signal value [Wb]; Time-dependent; Vector (nrho)
  integer  :: ddrho=0       ! /coreprof/psi/ddrho - Radial derivative (dvalue/drho_tor) [Wb.m^-1]; Time-dependent; Vector (nrho)
  integer  :: d2drho2=0       ! /coreprof/psi/d2drho2 - Second order radial derivative (d2value/drho_tor2) [Wb.m^-2]; Time-dependent; Vector (nrho)
  integer  :: ddt_rhotorn=0       ! /coreprof/psi/ddt_rhotorn - Time derivative of the poloidal flux at constant rho_tor_norm [V]. Time-dependent.
  integer  :: ddt_phi=0       ! /coreprof/psi/ddt_phi - Time derivative of the poloidal flux at constant toroidal flux [V]. Time-dependent.
  integer  :: source=0       ! /coreprof/psi/source - Source of the profile (any comment describing the origin of the profile : code, path to diagnostic s
  integer  :: flag=0       ! /coreprof/psi/flag - Flag describing how the profile has been processed : 0-not calculated; 1-interpretative; 2-calculate
  type (type_boundary_mask) :: boundary  ! /coreprof/psi/boundary - Boundary condition for the transport equation. Time-dependent.
  type (type_jni_mask) :: jni  ! /coreprof/psi/jni - Non-inductive parallel current density [A/m^2]; Time-dependent;
  type (type_coreprofile_mask) :: sigma_par  ! /coreprof/psi/sigma_par - Parallel conductivity [ohm^-1.m^-1]. Time-dependent
  type (type_codeparam_mask) :: codeparam  ! /coreprof/psi/codeparam - 
endtype
  
type type_profiles1d_mask  !    
  type (type_coreprofile_mask) :: pe  ! /coreprof/profiles1d/pe - Electron pressure [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: dpedt  ! /coreprof/profiles1d/dpedt - Time derivative of the electron pressure [Pa/s]; Time-dependent;
  type (type_coreprofion_mask) :: pi  ! /coreprof/profiles1d/pi - Ion pressure [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: pi_tot  ! /coreprof/profiles1d/pi_tot - Total ion pressure (sum of the species) [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: dpi_totdt  ! /coreprof/profiles1d/dpi_totdt - Time derivative of the total ion pressure [Pa/s]; Time-dependent;
  type (type_coreprofile_mask) :: pr_th  ! /coreprof/profiles1d/pr_th - Thermal pressure (electrons+ions) [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: pr_perp  ! /coreprof/profiles1d/pr_perp - Total perpendicular pressure (electrons+ions, thermal+non-thermal) [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: pr_parallel  ! /coreprof/profiles1d/pr_parallel - Total parallel pressure (electrons+ions, thermal+non-thermal) [Pa]; Time-dependent;
  type (type_coreprofile_mask) :: jtot  ! /coreprof/profiles1d/jtot - total parallel current density = average(jtot.B) / B0, where B0 = coreprof/toroid_field/b0 [A/m^2]; 
  type (type_coreprofile_mask) :: jni  ! /coreprof/profiles1d/jni - non-inductive parallel current density = average(jni.B) / B0, where B0 = coreprof/toroid_field/b0 [A
  type (type_coreprofile_mask) :: jphi  ! /coreprof/profiles1d/jphi - total toroidal current density = average(jphi/R) / average(1/R) [A/m^2]; Time-dependent;
  type (type_coreprofile_mask) :: joh  ! /coreprof/profiles1d/joh - ohmic parallel current density = average(joh.B) / B0, where B0 = coreprof/toroid_field/b0 [A/m^2]; T
  type (type_coreprofile_mask) :: vloop  ! /coreprof/profiles1d/vloop - Toroidal loop voltage [V]. Time-dependent.
  type (type_coreprofile_mask) :: sigmapar  ! /coreprof/profiles1d/sigmapar - Parallel conductivity [ohm^-1.m^-1]. Time-dependent.
  type (type_sourceel_mask) :: qoh  ! /coreprof/profiles1d/qoh - ohmic heating [W/m^3]; Time-dependent;
  type (type_coreprofile_mask) :: qei  ! /coreprof/profiles1d/qei - Collisional heat transfer from electrons to ions (equipartition term) [W/m^3]; Time-dependent;
  type (type_coreprofile_mask) :: eparallel  ! /coreprof/profiles1d/eparallel - Parallel electric field = average(E.B) / B0, where B0 = coreprof/toroid_field/b0 [V.m^-1]. Time-depe
  type (type_coreprofile_mask) :: e_b  ! /coreprof/profiles1d/e_b - Average(E.B) [V.T.m^-1]. Time-dependent.
  type (type_coreprofile_mask) :: q  ! /coreprof/profiles1d/q - Safety factor profile; Time-dependent;
  type (type_coreprofile_mask) :: shear  ! /coreprof/profiles1d/shear - Magnetic shear profile; Time-dependent;
  type (type_coreprofion_mask) :: ns  ! /coreprof/profiles1d/ns - Density of fast ions, for the various ion species [m^-3]; Time-dependent;
  type (type_coreprofion_mask) :: mtor  ! /coreprof/profiles1d/mtor - Toroidal momentum of the various ion species [UNITS?]; Time-dependent;
  type (type_coreprofion_mask) :: wtor  ! /coreprof/profiles1d/wtor - Angular toroidal rotation frequency of the various ion species [s^-1]; Time-dependent;
  type (type_coreprofion_mask) :: vpol  ! /coreprof/profiles1d/vpol - Neoclassical poloidal rotation of each ion species [m/s]. Time-dependent.
  type (type_coreprofile_mask) :: zeff  ! /coreprof/profiles1d/zeff - Effective charge profile; Time-dependent;
  type (type_coreprofile_mask) :: bpol  ! /coreprof/profiles1d/bpol - Average poloidal magnetic field, defined as sqrt(ave(grad rho^2/R^2)).dpsi/drho [T]. Time-dependent.
  type (type_coreprofile_mask) :: dvprimedt  ! /coreprof/profiles1d/dvprimedt - Time derivative of the radial derivative of the volume enclosed in the flux surface, i.e. d/dt(dV/dr
endtype
  
type type_globalparam_mask  !    
  integer  :: current_tot=0       ! /coreprof/globalparam/current_tot - Total plasma current [A]; Time-dependent; Scalar
  integer  :: current_bnd=0       ! /coreprof/globalparam/current_bnd - Plasma current inside transport solver boundary rho_tor_bnd [A]; Time-dependent; Scalar
  integer  :: current_ni=0       ! /coreprof/globalparam/current_ni - Total non-inductive parallel current [A]; Time-dependent; Scalar
  integer  :: vloop=0       ! /coreprof/globalparam/vloop - Toroidal loop voltage [V]; Time-dependent; Scalar
  integer  :: li=0       ! /coreprof/globalparam/li - Internal inductance; Time-dependent; Scalar
  integer  :: beta_tor=0       ! /coreprof/globalparam/beta_tor - toroidal beta; Time-dependent; Scalar
  integer  :: beta_normal=0       ! /coreprof/globalparam/beta_normal - normalised beta; Time-dependent; Scalar
  integer  :: beta_pol=0       ! /coreprof/globalparam/beta_pol - poloidal beta; Time-dependent; Scalar
  integer  :: w_dia=0       ! /coreprof/globalparam/w_dia - Plasma energy content = 3/2 * int(p,dV) with p being the total pressure (pr_th + pr_perp). Time-depe
  type (type_rz0D_mask) :: geom_axis  ! /coreprof/globalparam/geom_axis - RZ position of the geometric axis (defined as (Rmin+Rmax) / 2 and (Zmin+Zmax) / 2 of the boundary) [
endtype

  
type type_coreprof  !    
  type (type_datainfo) :: datainfo  ! /coreprof/datainfo - 
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /coreprof/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last radial gri
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /coreprof/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: drho_dt(:) => null()     ! /coreprof/drho_dt - Time derivative of rho_tor [m/s]; Vector (nrho). Time-dependent.
  type (type_toroid_field) :: toroid_field  ! /coreprof/toroid_field - Toroidal field information entering the definition of rho_tor, for reference only. The physical valu
  type (type_composition) :: composition  ! /coreprof/composition - 
  type (type_desc_impur) :: desc_impur  ! /coreprof/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coreprof/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_psi) :: psi  ! /coreprof/psi - Poloidal magnetic flux [Wb]; Time-dependent;
  type (type_corefield) :: te  ! /coreprof/te - Electron temperature [eV]; (source term in [W.m^-3]). Time-dependent;
  type (type_corefieldion) :: ti  ! /coreprof/ti - Ion temperature [eV]; (source term in [W.m^-3]). Time-dependent;
  type (type_corefield) :: ne  ! /coreprof/ne - Electron density [m^-3]; (source term in [m^-3]).Time-dependent;
  type (type_corefieldion) :: ni  ! /coreprof/ni - Ion density [m^-3]; (source term in [m^-3]). Time-dependent;
  type (type_corefieldion) :: vtor  ! /coreprof/vtor - Toroidal velocity of the various ion species [m.s^-1]; Time-dependent;
  type (type_profiles1d) :: profiles1d  ! /coreprof/profiles1d - Profiles derived from the fields solved in the transport equations, or from experiment.
  type (type_globalparam) :: globalparam  ! /coreprof/globalparam - Various global quantities calculated from the 1D profiles. Time-dependent
  type (type_codeparam) :: codeparam  ! /coreprof/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coreprof/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_coreprof_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coreprof/datainfo - 
  integer  :: rho_tor_norm=0       ! /coreprof/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last radial gri
  integer  :: rho_tor=0       ! /coreprof/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: drho_dt=0       ! /coreprof/drho_dt - Time derivative of rho_tor [m/s]; Vector (nrho). Time-dependent.
  type (type_toroid_field_mask) :: toroid_field  ! /coreprof/toroid_field - Toroidal field information entering the definition of rho_tor, for reference only. The physical valu
  type (type_composition_mask) :: composition  ! /coreprof/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /coreprof/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coreprof/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_psi_mask) :: psi  ! /coreprof/psi - Poloidal magnetic flux [Wb]; Time-dependent;
  type (type_corefield_mask) :: te  ! /coreprof/te - Electron temperature [eV]; (source term in [W.m^-3]). Time-dependent;
  type (type_corefieldion_mask) :: ti  ! /coreprof/ti - Ion temperature [eV]; (source term in [W.m^-3]). Time-dependent;
  type (type_corefield_mask) :: ne  ! /coreprof/ne - Electron density [m^-3]; (source term in [m^-3]).Time-dependent;
  type (type_corefieldion_mask) :: ni  ! /coreprof/ni - Ion density [m^-3]; (source term in [m^-3]). Time-dependent;
  type (type_corefieldion_mask) :: vtor  ! /coreprof/vtor - Toroidal velocity of the various ion species [m.s^-1]; Time-dependent;
  type (type_profiles1d_mask) :: profiles1d  ! /coreprof/profiles1d - Profiles derived from the fields solved in the transport equations, or from experiment.
  type (type_globalparam_mask) :: globalparam  ! /coreprof/globalparam - Various global quantities calculated from the 1D profiles. Time-dependent
  type (type_codeparam_mask) :: codeparam  ! /coreprof/codeparam - 
  integer  :: time=0       ! /coreprof/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include coresource.xsd
  
type type_coresource_values  !    Description of the source terms for a given origin
  type (type_identifier) :: sourceid  ! /sourceid - Identifier for the origin of the source terms (see conventions in the ITM website)
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: j(:) => null()     ! /j - Parallel current source for psi transport equation, = average(j.B) / B0, where B0 = coresource/toroi
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /sigma - Induced parallel conductivity [ohm^-1.m^-1]. EXACT DEFINITION PENDING. Vector(nrho). Time-dependent.
  type (type_source_ion) :: si  ! /si - Particle source for ion density transport equation [m^-3.s^-1]. Time-dependent.
  type (type_source_vec) :: se  ! /se - Particle source for electron density transport equation [m^-3.s^-1]. Time-dependent.
  type (type_source_imp),pointer :: sz(:) => null()  ! /sz(i) - Particle source for impurity density transport equation [m^-3.s^-1]. Vector(nimpur). Time-dependent.
  type (type_source_ion) :: qi  ! /qi - Heat source for ion heat transport equations [W.m^-3]. Time-dependent.
  type (type_source_vec) :: qe  ! /qe - Heat source for electron heat transport equation [W.m^-3]. Time-dependent.
  type (type_source_imp),pointer :: qz(:) => null()  ! /qz(i) - Heat source for impurity heat transport equations [W.m^-3]. Vector(nimpur). Time-dependent.
  type (type_source_ion) :: ui  ! /ui - Toroidal torque on individual ion species; for toroidal momentum transport equation [kg.m^-1.s^-2]. 
  type (type_source_vec) :: ujxb  ! /ujxb - Toroidal JxB torque on bulk plasma; for toroidal momentum transport equation [kg.m^-1.s^-2]. Here J 
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype
  
type type_coresource_values_mask  !    Description of the source terms for a given origin
  type (type_identifier_mask) :: sourceid  ! /sourceid - Identifier for the origin of the source terms (see conventions in the ITM website)
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  integer  :: volume=0       ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  integer  :: j=0       ! /j - Parallel current source for psi transport equation, = average(j.B) / B0, where B0 = coresource/toroi
  integer  :: sigma=0       ! /sigma - Induced parallel conductivity [ohm^-1.m^-1]. EXACT DEFINITION PENDING. Vector(nrho). Time-dependent.
  type (type_source_ion_mask) :: si  ! /si - Particle source for ion density transport equation [m^-3.s^-1]. Time-dependent.
  type (type_source_vec_mask) :: se  ! /se - Particle source for electron density transport equation [m^-3.s^-1]. Time-dependent.
  type (type_source_imp_mask),pointer :: sz(:) => null()  ! /sz(i) - Particle source for impurity density transport equation [m^-3.s^-1]. Vector(nimpur). Time-dependent.
  type (type_source_ion_mask) :: qi  ! /qi - Heat source for ion heat transport equations [W.m^-3]. Time-dependent.
  type (type_source_vec_mask) :: qe  ! /qe - Heat source for electron heat transport equation [W.m^-3]. Time-dependent.
  type (type_source_imp_mask),pointer :: qz(:) => null()  ! /qz(i) - Heat source for impurity heat transport equations [W.m^-3]. Vector(nimpur). Time-dependent.
  type (type_source_ion_mask) :: ui  ! /ui - Toroidal torque on individual ion species; for toroidal momentum transport equation [kg.m^-1.s^-2]. 
  type (type_source_vec_mask) :: ujxb  ! /ujxb - Toroidal JxB torque on bulk plasma; for toroidal momentum transport equation [kg.m^-1.s^-2]. Here J 
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype

  
type type_coresource  !    
  type (type_datainfo) :: datainfo  ! /coresource/datainfo - 
  type (type_composition) :: composition  ! /coresource/composition - 
  type (type_desc_impur) :: desc_impur  ! /coresource/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coresource/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_b0r0) :: toroid_field  ! /coresource/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_coresource_values),pointer :: values(:) => null()  ! /coresource/values(i) - Description of the source terms of various origins. Array of structure (nsource). Time-dependent.
  type (type_codeparam) :: codeparam  ! /coresource/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coresource/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_coresource_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coresource/datainfo - 
  type (type_composition_mask) :: composition  ! /coresource/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /coresource/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coresource/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_b0r0_mask) :: toroid_field  ! /coresource/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_coresource_values_mask),pointer :: values(:) => null()  ! /coresource/values(i) - Description of the source terms of various origins. Array of structure (nsource). Time-dependent.
  type (type_codeparam_mask) :: codeparam  ! /coresource/codeparam - 
  integer  :: time=0       ! /coresource/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include coretransp.xsd
  
type type_ni_transp  !    
  real(EUITM_R8),pointer  :: diff_eff(:,:,:) => null()     ! /ni_transp/diff_eff - Effective diffusivity [m^2.s^-1]. The last index of the array describes which multiplier should be a
  real(EUITM_R8),pointer  :: vconv_eff(:,:,:) => null()     ! /ni_transp/vconv_eff - Effective convection [m.s^-1]. The last index of the array describes which multiplier should be appl
  real(EUITM_R8),pointer  :: flux(:,:) => null()     ! /ni_transp/flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion) :: off_diagonal  ! /ni_transp/off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=-999999999       ! /ni_transp/flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_ne_transp  !    
  real(EUITM_R8),pointer  :: diff_eff(:,:) => null()     ! /ne_transp/diff_eff - Effective diffusivity [m^2.s^-1]. The last index of the array describes which multiplier should be a
  real(EUITM_R8),pointer  :: vconv_eff(:,:) => null()     ! /ne_transp/vconv_eff - Effective convection [m.s^-1]. The last index of the array describes which multiplier should be appl
  real(EUITM_R8),pointer  :: flux(:) => null()     ! /ne_transp/flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagel) :: off_diagonal  ! /ne_transp/off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=-999999999       ! /ne_transp/flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_ni_transp_mask  !    
  integer  :: diff_eff=0       ! /ni_transp/diff_eff - Effective diffusivity [m^2.s^-1]. The last index of the array describes which multiplier should be a
  integer  :: vconv_eff=0       ! /ni_transp/vconv_eff - Effective convection [m.s^-1]. The last index of the array describes which multiplier should be appl
  integer  :: flux=0       ! /ni_transp/flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagion_mask) :: off_diagonal  ! /ni_transp/off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=0       ! /ni_transp/flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype
  
type type_ne_transp_mask  !    
  integer  :: diff_eff=0       ! /ne_transp/diff_eff - Effective diffusivity [m^2.s^-1]. The last index of the array describes which multiplier should be a
  integer  :: vconv_eff=0       ! /ne_transp/vconv_eff - Effective convection [m.s^-1]. The last index of the array describes which multiplier should be appl
  integer  :: flux=0       ! /ne_transp/flux - Flux. Not used in transport equations [field.m.s^-1,.m^-3 if field is not a density itself]. Time-de
  type (type_offdiagel_mask) :: off_diagonal  ! /ne_transp/off_diagonal - Details of the transport matrix, just for diagnostic (not used in transport equations). Time-depende
  integer  :: flag=0       ! /ne_transp/flag - Flag describing the form of transport produced by the original model : 0- not calculated, 1- D and V
endtype

  
type type_coretransp_values  !    Description of transport term coming from various origins. Array of structure (ntransp)
  type (type_identifier) :: transportid  ! /transportid - Identifier for the origin of the transport terms (see conventions in the ITM website)
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /sigma - Parallel conductivity [ohm^-1.m^-1]. Time-dependent. Vector(nrho).
  type (type_ni_transp) :: ni_transp  ! /ni_transp - Transport coefficients for ion density equation. Time-dependent.
  type (type_ne_transp) :: ne_transp  ! /ne_transp - Transport coefficients for electron density equation. Time-dependent.
  type (type_transcoefimp),pointer :: nz_transp(:) => null()  ! /nz_transp(i) - Transport coefficients for impurity (multiple charge state) density equation. Time-dependent.
  type (type_transcoefion) :: ti_transp  ! /ti_transp - Transport coefficients for ion temperature equation. Time-dependent.
  type (type_transcoefel) :: te_transp  ! /te_transp - Transport coefficients for electron temperature equation. Time-dependent.
  type (type_transcoefimp),pointer :: tz_transp(:) => null()  ! /tz_transp(i) - Transport coefficients for impurity (multiple charge state) temperature equation. Time-dependent.
  type (type_transcoefvtor) :: vtor_transp  ! /vtor_transp - Transport coefficients for toroidal velocity equation. Time-dependent.
  type (type_codeparam) :: codeparam  ! /codeparam - 
endtype
  
type type_coretransp_values_mask  !    Description of transport term coming from various origins. Array of structure (ntransp)
  type (type_identifier_mask) :: transportid  ! /transportid - Identifier for the origin of the transport terms (see conventions in the ITM website)
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (nrho)
  integer  :: volume=0       ! /volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (nrho)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (nrho)
  integer  :: sigma=0       ! /sigma - Parallel conductivity [ohm^-1.m^-1]. Time-dependent. Vector(nrho).
  type (type_ni_transp_mask) :: ni_transp  ! /ni_transp - Transport coefficients for ion density equation. Time-dependent.
  type (type_ne_transp_mask) :: ne_transp  ! /ne_transp - Transport coefficients for electron density equation. Time-dependent.
  type (type_transcoefimp_mask),pointer :: nz_transp(:) => null()  ! /nz_transp(i) - Transport coefficients for impurity (multiple charge state) density equation. Time-dependent.
  type (type_transcoefion_mask) :: ti_transp  ! /ti_transp - Transport coefficients for ion temperature equation. Time-dependent.
  type (type_transcoefel_mask) :: te_transp  ! /te_transp - Transport coefficients for electron temperature equation. Time-dependent.
  type (type_transcoefimp_mask),pointer :: tz_transp(:) => null()  ! /tz_transp(i) - Transport coefficients for impurity (multiple charge state) temperature equation. Time-dependent.
  type (type_transcoefvtor_mask) :: vtor_transp  ! /vtor_transp - Transport coefficients for toroidal velocity equation. Time-dependent.
  type (type_codeparam_mask) :: codeparam  ! /codeparam - 
endtype

  
type type_coretransp  !    
  type (type_datainfo) :: datainfo  ! /coretransp/datainfo - 
  type (type_composition) :: composition  ! /coretransp/composition - 
  type (type_desc_impur) :: desc_impur  ! /coretransp/desc_impur - 
  type (type_compositions_type) :: compositions  ! /coretransp/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_coretransp_values),pointer :: values(:) => null()  ! /coretransp/values(i) - Description of transport term coming from various origins. Array of structure (ntransp). Time-depend
  type (type_codeparam) :: codeparam  ! /coretransp/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /coretransp/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_coretransp_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /coretransp/datainfo - 
  type (type_composition_mask) :: composition  ! /coretransp/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /coretransp/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /coretransp/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_coretransp_values_mask),pointer :: values(:) => null()  ! /coretransp/values(i) - Description of transport term coming from various origins. Array of structure (ntransp). Time-depend
  type (type_codeparam_mask) :: codeparam  ! /coretransp/codeparam - 
  integer  :: time=0       ! /coretransp/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include cxdiag.xsd
  
type type_cxsetup  !    diagnostic setup information
  real(EUITM_R8),pointer  :: amn(:) => null()     ! /amn - Mass of the emmitting impurity. Varies according to channels since they are spanning different lines
  real(EUITM_R8),pointer  :: zn(:) => null()     ! /zn - Nuclear charge of the emmitting impurity. Varies according to channels since they are spanning diffe
  type (type_rzphi1Dexp) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
endtype

  
type type_cxmeasure  !    Measured values
  type (type_exp1D) :: ti  ! /ti - Ion temperature [eV]. Vector (nchannels)
  type (type_exp1D) :: vtor  ! /vtor - Toroidal velocity [m/s]. Vector (nchannels)
  type (type_exp1D) :: vpol  ! /vpol - Poloidal velocity [m/s]. Vector (nchannels)
endtype
  
type type_cxsetup_mask  !    diagnostic setup information
  integer  :: amn=0       ! /amn - Mass of the emmitting impurity. Varies according to channels since they are spanning different lines
  integer  :: zn=0       ! /zn - Nuclear charge of the emmitting impurity. Varies according to channels since they are spanning diffe
  type (type_rzphi1Dexp_mask) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
endtype
  
type type_cxmeasure_mask  !    Measured values
  type (type_exp1D_mask) :: ti  ! /ti - Ion temperature [eV]. Vector (nchannels)
  type (type_exp1D_mask) :: vtor  ! /vtor - Toroidal velocity [m/s]. Vector (nchannels)
  type (type_exp1D_mask) :: vpol  ! /vpol - Poloidal velocity [m/s]. Vector (nchannels)
endtype

  
type type_cxdiag  !    
  type (type_datainfo) :: datainfo  ! /cxdiag/datainfo - 
  type (type_cxsetup) :: setup  ! /cxdiag/setup - diagnostic setup information
  type (type_cxmeasure) :: measure  ! /cxdiag/measure - Measured values
  type (type_codeparam) :: codeparam  ! /cxdiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /cxdiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_cxdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /cxdiag/datainfo - 
  type (type_cxsetup_mask) :: setup  ! /cxdiag/setup - diagnostic setup information
  type (type_cxmeasure_mask) :: measure  ! /cxdiag/measure - Measured values
  type (type_codeparam_mask) :: codeparam  ! /cxdiag/codeparam - 
  integer  :: time=0       ! /cxdiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include distribution.xsd
  
type type_omnigen_surf  !    
  type (type_rz1D) :: rz  ! /omnigen_surf(i)/rz - (R,z) coordinates of the omnigeuous magnetic surfaces (generalised equitorial plane). NOTE: only use
  real(EUITM_R8),pointer  :: s(:) => null()     ! /omnigen_surf(i)/s - Coordinates which uniquely maps the omnigeuous magnetic surfaces (generalised equitorial plane). NOT
endtype

  
type type_topo_regions  !    
  integer  :: ind_omnigen=-999999999       ! /topo_regions(i)/ind_omnigen - Index of the omnigeuous magnetic surfaces (generalised equitorial plane) to which the s-coordinates 
  real(EUITM_R8),pointer  :: dim1(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim1 - First dimension in phase space; Time-dependent; Array6d(ndim11, ndim21, ndim31, ndim41, ndim51, ndim
  real(EUITM_R8),pointer  :: dim2(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim2 - Second dimension in phase space; Time-dependent; Array6d(ndim12, ndim22, ndim32, ndim42, ndim52, ndi
  real(EUITM_R8),pointer  :: dim3(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim3 - Third dimension in phase space; Time-dependent; Array6d(ndim13, ndim23, ndim33, ndim43, ndim53, ndim
  real(EUITM_R8),pointer  :: dim4(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim4 - Fourth dimension in phase space; Time-dependent; Array6d(ndim14, ndim24, ndim34, ndim44, ndim54, ndi
  real(EUITM_R8),pointer  :: dim5(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim5 - Fifth dimension in phase space; Time-dependent; Array6d(ndim15, ndim25, ndim35, ndim45, ndim55, ndim
  real(EUITM_R8),pointer  :: dim6(:,:,:,:,:,:) => null()     ! /topo_regions(i)/dim6 - Sixth dimension in phase space; Time-dependent; Array6d(ndim16, ndim26, ndim36, ndim46, ndim56, ndim
  real(EUITM_R8),pointer  :: jacobian(:,:,:,:,:,:) => null()     ! /topo_regions(i)/jacobian - Jacobian of the transformation of the phase space grid variables; Time-dependent; Array6d(ndim11, nd
  real(EUITM_R8),pointer  :: distfunc(:,:,:,:,:,:) => null()     ! /topo_regions(i)/distfunc - Orbit (or bounce) averaged distribution function given on a grid [1/m^3 (m/s)^-3]; Time-dependent; A
endtype
  
type type_omnigen_surf_mask  !    
  type (type_rz1D_mask) :: rz  ! /omnigen_surf(i)/rz - (R,z) coordinates of the omnigeuous magnetic surfaces (generalised equitorial plane). NOTE: only use
  integer  :: s=0       ! /omnigen_surf(i)/s - Coordinates which uniquely maps the omnigeuous magnetic surfaces (generalised equitorial plane). NOT
endtype
  
type type_topo_regions_mask  !    
  integer  :: ind_omnigen=0       ! /topo_regions(i)/ind_omnigen - Index of the omnigeuous magnetic surfaces (generalised equitorial plane) to which the s-coordinates 
  integer  :: dim1=0       ! /topo_regions(i)/dim1 - First dimension in phase space; Time-dependent; Array6d(ndim11, ndim21, ndim31, ndim41, ndim51, ndim
  integer  :: dim2=0       ! /topo_regions(i)/dim2 - Second dimension in phase space; Time-dependent; Array6d(ndim12, ndim22, ndim32, ndim42, ndim52, ndi
  integer  :: dim3=0       ! /topo_regions(i)/dim3 - Third dimension in phase space; Time-dependent; Array6d(ndim13, ndim23, ndim33, ndim43, ndim53, ndim
  integer  :: dim4=0       ! /topo_regions(i)/dim4 - Fourth dimension in phase space; Time-dependent; Array6d(ndim14, ndim24, ndim34, ndim44, ndim54, ndi
  integer  :: dim5=0       ! /topo_regions(i)/dim5 - Fifth dimension in phase space; Time-dependent; Array6d(ndim15, ndim25, ndim35, ndim45, ndim55, ndim
  integer  :: dim6=0       ! /topo_regions(i)/dim6 - Sixth dimension in phase space; Time-dependent; Array6d(ndim16, ndim26, ndim36, ndim46, ndim56, ndim
  integer  :: jacobian=0       ! /topo_regions(i)/jacobian - Jacobian of the transformation of the phase space grid variables; Time-dependent; Array6d(ndim11, nd
  integer  :: distfunc=0       ! /topo_regions(i)/distfunc - Orbit (or bounce) averaged distribution function given on a grid [1/m^3 (m/s)^-3]; Time-dependent; A
endtype

  
type type_dist_distrivec_distfunc_fexp_param  !    Parameters used to defined the grid coordinates. Time-dependent
  type (type_equatorial_plane) :: equatorial  ! /equatorial - Description of the equatorial plane or any other omnigeuous surfaces. Time-dependent
  real(EUITM_R8),pointer  :: temperature(:) => null()     ! /temperature - Reference temperature profile (eV); on the grid in /distsource/source/profiles_1d/rho_tor. Used to d
endtype

  
type type_dist_geometry_0d  !    Geometrical constants
  type (type_rz0D) :: mag_axis  ! /mag_axis - Position of the magnetic axis [m]. Time-dependent; Scalar
  type (type_b0r0) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field. Used to define the radial coordiante rho_tor and to me
endtype

  
type type_dist_geometry_1d  !    Grids and metric information; including rho_tor, psi, area and volume. Time-dependent
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed by the flux surface [m^3]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (npsi)
endtype

  
type type_dist_geometry_2d  !    Grids and metric information; including R, Z, rho_tor, psi, theta_geom and theta_strt. The grid has to be rectangular in a pair of
  integer  :: coord_type=-999999999       ! /coord_type - 0: Rectangular grid in the (R,Z) coordinates; 1: Rectangular grid in the (rho_tor,theta_geom) coordi
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /r - Major radius coordinate [m]; Time-dependent; Matrix (n_coord1,n_coord2)
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - Vertical coordinate [m]; Time-dependent; Matrix (n_coord1,n_coord2)
  real(EUITM_R8),pointer  :: rho_tor(:,:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  real(EUITM_R8),pointer  :: psi(:,:) => null()     ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  real(EUITM_R8),pointer  :: theta_geom(:,:) => null()     ! /theta_geom - Geometrical poloidal angle [rad]; Time-dependent; Matrix (n_coord1,n_coord2)
  real(EUITM_R8),pointer  :: theta_strt(:,:) => null()     ! /theta_strt - Straight field line poloidal angle [rad]; Time-dependent; Matrix (n_coord1,n_coord2)
endtype

  
type type_dist_state_0d  !    Algebraic moments of the distribution function integrated over the plasma volume, e.g. total number of particles, energy etc. Time
  real(EUITM_R8)  :: n_particles=-9.0E40_EUITM_R8       ! /n_particles - Number of particles in the distribution; the volume integral of the density (note: this is the numbe
  real(EUITM_R8)  :: n_part_fast=-9.0E40_EUITM_R8       ! /n_part_fast - Number of fast particles in the distribution; the volume integral of the fast particle density (note
  real(EUITM_R8)  :: enrg=-9.0E40_EUITM_R8       ! /enrg - Total energy distribution [J]; Time-dependent
  real(EUITM_R8)  :: enrg_fast=-9.0E40_EUITM_R8       ! /enrg_fast - Total energy of the fast particle distribution [J]; Time-dependent
  real(EUITM_R8)  :: enrg_fast_pa=-9.0E40_EUITM_R8       ! /enrg_fast_pa - Parallel energy of the fast particle distribution [J]; Time-dependent
  real(EUITM_R8)  :: momentm_fast=-9.0E40_EUITM_R8       ! /momentm_fast - Kinetic toroidal angular momentum of the fast ions [Nms]; Time-dependent; Vector (npsi)
  real(EUITM_R8)  :: current_dr=-9.0E40_EUITM_R8       ! /current_dr - Toroidal non-inductive current drive [A]; Time-dependent.
  real(EUITM_R8)  :: torque_jrxb=-9.0E40_EUITM_R8       ! /torque_jrxb - Toroidal torque due to radial currents [N.m]; Time-dependent.
endtype

  
type type_dist_state_1d  !    Fluid moments describing the state of the distribution; calculated from the distribution. Time-dependent
  real(EUITM_R8),pointer  :: dens(:) => null()     ! /dens - Flux surface averaged particle density (including both thermal and fast particles) [1/m^3]; Time-dep
  real(EUITM_R8),pointer  :: dens_fast(:) => null()     ! /dens_fast - Flux surface averaged fast particle density [1/m^3]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: pres(:) => null()     ! /pres - Scalar pressure (including both thermal and fast particles) [J/m^3]. Related to the energy content, 
  real(EUITM_R8),pointer  :: pres_fast(:) => null()     ! /pres_fast - Scalar pressure of the fast particles [J/m^3]. Related to the fast particle energy content, Wf, acco
  real(EUITM_R8),pointer  :: pres_fast_pa(:) => null()     ! /pres_fast_pa - Parallel pressure of the fast particles [J/m^3]. Related to the fast particle parallel energy conten
  real(EUITM_R8),pointer  :: momentm_fast(:) => null()     ! /momentm_fast - Kinetic toroidal angular momentum density of the fast ions [Ns/m^2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: current(:) => null()     ! /current - Total toroidal driven current density (including electron and thermal ion back-current, or drag-curr
  real(EUITM_R8),pointer  :: current_fast(:) => null()     ! /current_fast - Flux surface averaged toroidal current density of fast (non-thermal) particles (excluding electron a
  real(EUITM_R8),pointer  :: torque_jrxb(:) => null()     ! /torque_jrxb - Toroidal torque density due to radial currents, excluding radial current due to neoclassical effect 
endtype

  
type type_dist_state_2d  !    Fluid moments describing the state of the distribution; calculated from the distribution. Time-dependent
  real(EUITM_R8),pointer  :: dens(:,:) => null()     ! /dens - Particle density (including both thermal and fast particles) [1/m^3]; Time-dependent; Matrix (n_coor
  real(EUITM_R8),pointer  :: dens_fast(:,:) => null()     ! /dens_fast - Fast particle density [1/m^3]; Time-dependent; Matrix (n_coord1, n_coord2)
  real(EUITM_R8),pointer  :: pres(:,:) => null()     ! /pres - Scalar pressure (including both thermal and fast particles) [J/m^3]. Related to the energy content, 
  real(EUITM_R8),pointer  :: pres_fast(:,:) => null()     ! /pres_fast - Scalar pressure of the fast particles [J/m^3]. Related to the fast particle energy content, Wf, acco
  real(EUITM_R8),pointer  :: pres_fast_pa(:,:) => null()     ! /pres_fast_pa - Parallel pressure of the fast particles [J/m^3]. Related to the fast particle parallel energy conten
  real(EUITM_R8),pointer  :: momentm_fast(:,:) => null()     ! /momentm_fast - Kinetic toroidal angular momentum density of the fast ions [Ns/m^2]; Time-dependent; Matrix (n_coord
  real(EUITM_R8),pointer  :: current(:,:) => null()     ! /current - Total toroidal driven current density (including electron and thermal ion back-current, or drag-curr
  real(EUITM_R8),pointer  :: current_fast(:,:) => null()     ! /current_fast - Toroidal current density of fast (non-thermal) particles of the distribution species (excluding elec
  real(EUITM_R8),pointer  :: torque_jrxb(:,:) => null()     ! /torque_jrxb - Toroidal torque density due to radial currents, excluding radial current due to neoclassical effect 
endtype

  
type type_dist_collisional_transfer_0d  !    
  real(EUITM_R8)  :: power_th=-9.0E40_EUITM_R8       ! /power_th - Collisional power to the thermal particle population [W]; Time-dependent; Scalar
  real(EUITM_R8)  :: power_fast=-9.0E40_EUITM_R8       ! /power_fast - Collisional power to the fast particle population [W]; Time-dependent; Scalar
  real(EUITM_R8)  :: torque_th=-9.0E40_EUITM_R8       ! /torque_th - Collisional toroidal torque to the thermal particle population [N.m]; Time-dependent; Scalar
  real(EUITM_R8)  :: torque_fast=-9.0E40_EUITM_R8       ! /torque_fast - Collisional toroidal torque to the fast particle population [N.m]; Time-dependent; Scalar
endtype

  
type type_dist_collisional_transfer_1d  !    
  real(EUITM_R8),pointer  :: power_th(:) => null()     ! /power_th - Flux surface averaged collisional power density to the thermal particle population [W.m^-3]; Time-de
  real(EUITM_R8),pointer  :: power_fast(:) => null()     ! /power_fast - Flux surface averaged collisional power density to the fast particle population [W.m^-3]; Time-depen
  real(EUITM_R8),pointer  :: torque_th(:) => null()     ! /torque_th - Flux surface averaged collisional toroidal torque density to the thermal particle population [N.m^-2
  real(EUITM_R8),pointer  :: torque_fast(:) => null()     ! /torque_fast - Flux surface averaged collisional toroidal torque density to the fast particle population [N.m^-2]; 
endtype

  
type type_dist_collisional_transfer_2d  !    
  real(EUITM_R8),pointer  :: power_th(:,:) => null()     ! /power_th - Collisional power density to the thermal particle population [W.m^-3]; Time-dependent; Matrix(n_coor
  real(EUITM_R8),pointer  :: power_fast(:,:) => null()     ! /power_fast - Collisional power density to the fast particle population [W.m^-3]; Time-dependent; Matrix(n_coord1,
  real(EUITM_R8),pointer  :: torque_th(:,:) => null()     ! /torque_th - Collisional toroidal torque density to the thermal particle population [N.m^-2]; Time-dependent; Mat
  real(EUITM_R8),pointer  :: torque_fast(:,:) => null()     ! /torque_fast - Collisional toroidal torque density to the fast particle population [N.m^-2]; Time-dependent; Matrix
endtype

  
type type_dist_thermalised_1d  !    Representation of the flux surface averaged source of thermal particles, momentum and energy due to thermalisation. Here thermalis
  real(EUITM_R8),pointer  :: particle(:) => null()     ! /particle - Source rate for the thermal particle density due to the thermalisation of fast (non-thermal) particl
  real(EUITM_R8),pointer  :: momentum(:) => null()     ! /momentum - Source rate for the toroidal angular momentum density within the thermal particle population due to 
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /energy - Source rate for the energy density within the thermal particle population due to the thermalisation 
endtype

  
type type_dist_sources_reference  !    Volume integrated source included in the Fokker-Planck model.
  type (type_identifier) :: type  ! /type - Identifier for sources and sinks in Fokker-Planck solver; type.flag=1 for wave source, type.flag=2 f
  integer,pointer  :: index_waveid(:) => null()      ! /index_waveid - Index pointing to /distribution/distri_vec/wave_id[index_waveid] from which the source is taken. Tim
  integer,pointer  :: index_srcid(:) => null()      ! /index_srcid - Index pointing to /distribution/distri_vec/source_id[index_waveid] from which the source is taken. T
endtype

  
type type_dist_sources_0d  !    Volume integrated source included in the Fokker-Planck model.
  type (type_dist_sources_reference) :: source_ref  ! /source_ref - Reference identifying the origin and type of source; Time-dependedent
  real(EUITM_R8)  :: particle=-9.0E40_EUITM_R8       ! /particle - Source (or sink) rate of particles [1/s]; Time-dependedent; Scalar
  real(EUITM_R8)  :: momentum=-9.0E40_EUITM_R8       ! /momentum - Source (or sink) rate of toroidal angular momentum [Nm/s]; Time-dependedent; Scalar
  real(EUITM_R8)  :: energy=-9.0E40_EUITM_R8       ! /energy - Source (or sink) rate of energy [J/s]; Time-dependedent; Scalar
endtype

  
type type_dist_sources_1d  !    Flux surface averaged source included in the Fokker-Planck model.
  type (type_dist_sources_reference) :: source_ref  ! /source_ref - Reference identifying the origin and type of source; Time-dependedent
  real(EUITM_R8),pointer  :: particle(:) => null()     ! /particle - Source (or sink) rate of particles density [1/s/m**3]; Time-dependedent; Vector (npsi)
  real(EUITM_R8),pointer  :: momentum(:) => null()     ! /momentum - Source (or sink) rate of toroidal angular momentum density [Nm/s/m**3]; Time-dependedent; Vector (np
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /energy - Source (or sink) rate of energy density [J/s/m**3]; Time-dependedent; Vector (npsi)
endtype

  
type type_dist_profiles_1d_collisions_z  !    Collisional exchange from each background impurities species to the distribution function. Time-dependent; 
  type (type_dist_collisional_transfer_1d),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange from each charge state (or bundled charge state) to the distribution function. 
endtype

  
type type_dist_profile_values_1d  !    1D profiles; includes flux surface averaged quantities. Here the dimensions used refer to: npsi - size of the internal radial grid
  type (type_dist_state_1d) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_1d) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_1d),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles_1d_collisions_z),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_sources_1d),pointer :: sources(:) => null()  ! /sources(i) - Vector of flux surface averaged sources and sinks of particles, momentum and power included in the F
endtype

  
type type_dist_profiles2d_collisions_z  !    Collisional exchange from each background impurities species to the distribution function. Time-dependent; 
  type (type_dist_collisional_transfer_2d),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange from each charge state (or bundled charge state) to the distribution function. 
endtype

  
type type_dist_profile_values_2d  !    2D profiles in the poloidal plane; includes velocity space integrated quantities. Time-dependent
  type (type_dist_state_2d) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_2d) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_2d),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles2d_collisions_z),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
endtype

  
type type_dist_global_param_collisions_z  !    Collisional exchange with each impurity species. The ion indexing should match the one in /distribution/compositions/impurities. T
  type (type_dist_collisional_transfer_0d),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange with the impurities. The ion indexing should match the one in distribution/comp
endtype

  
type type_dist_global_param  !    Global parameters; spatial constants, volume integrated quantities and quantities averaged over the cross-sectional area. Here the
  type (type_dist_geometry_0d) :: geometry  ! /geometry - Geometrical constants
  type (type_dist_state_0d) :: state  ! /state - Algebraic moments of the distribution function integrated over the plasma volume, e.g. total number 
  type (type_dist_collisional_transfer_0d) :: collisions_e  ! /collisions_e - Collisional exchange with the electrons. Time-dependent
  type (type_dist_collisional_transfer_0d),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange with each ion species. The ion indexing should match the one in /distribution/c
  type (type_dist_global_param_collisions_z),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange with each impurity species. The ion indexing should match the one in /distribut
  type (type_dist_sources_0d),pointer :: sources(:) => null()  ! /sources(i) - Vector of volume integrated sources and sinks of particles, momentum and power included in the Fokke
endtype

  
type type_dist_profiles_1d  !    1D profiles; includes flux surface averaged quantities. Here the dimensions used refer to: npsi - size of the internal radial grid
  type (type_dist_geometry_1d) :: geometry  ! /geometry - Grids and metric information; including rho_tor, psi, area and volume. Time-dependent
  type (type_dist_state_1d) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_1d) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_1d),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles_1d_collisions_z),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_thermalised_1d) :: thermalised  ! /thermalised - Representation of the flux surface averaged source of thermal particles, momentum and energy due to 
  type (type_dist_sources_1d),pointer :: sources(:) => null()  ! /sources(i) - Vector of flux surface averaged sources and sinks of particles, momentum and power included in the F
  type (type_dist_profile_values_1d) :: trapped  ! /trapped - Flux surface averaged profile evaluated using the trapped particle part of the distribution.
  type (type_dist_profile_values_1d) :: co_passing  ! /co_passing - Flux surface averaged profile evaluated using the co-current passing particle part of the distributi
  type (type_dist_profile_values_1d) :: cntr_passing  ! /cntr_passing - Flux surface averaged profile evaluated using the counter-current passing particle part of the distr
endtype

  
type type_dist_profiles_2d  !    2D profiles in the poloidal plane; includes velocity space integrated quantities. Time-dependent
  type (type_dist_geometry_2d) :: geometry  ! /geometry - Grids and metric information; including R, Z, rho_tor, psi, theta_geom and theta_strt. The grid has 
  type (type_dist_state_2d) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_2d) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_2d),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles2d_collisions_z),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_profile_values_2d) :: trapped  ! /trapped - 2D profiles evaluated using the trapped particle part of the distribution.
  type (type_dist_profile_values_2d) :: co_passing  ! /co_passing - 2D profiles evaluated using the co-current passing particle part of the distribution.
  type (type_dist_profile_values_2d) :: cntr_passing  ! /cntr_passing - 2D profiles evaluated using the counter-current passing particle part of the distribution.
endtype

  
type type_dist_grid_info  !    Specification of grids used in topo_regions. Grid coordinates could either be invariants of motion, or information at single point
  integer  :: grid_type=-999999999       ! /grid_type - Type of grid: 1=unstructured grid; 2=structured non-rectangular grid, here ndim11=ndim12=ndim13, ndi
  integer  :: ngriddim=-999999999       ! /ngriddim - Number of grid dimension. For ngriddim=2 the grid is specified by dim1 and dim2 only, while dim3, di
  integer,pointer  :: grid_coord(:) => null()      ! /grid_coord - Identifies the coordinates specifies in dim1, dim2, dim3, dim4, dim5, and dim6. grid_coord(K) descri
  integer  :: thin_orbits=-999999999       ! /thin_orbits - Specifies if guiding centre orbits are thin. Note: only used for orbit averaged distribution functio
  character(len=132), dimension(:), pointer ::topology => null()       ! /topology - Description of the topology of the grid. NOTE: only used for nregion_topo>2.
  type (type_omnigen_surf),pointer :: omnigen_surf(:) => null()  ! /omnigen_surf(i) - List of omnigeuous magnetic surfaces to which the s-coordinates in grid_coord refer. NOTE: only used
endtype

  
type type_dist_ff  !    Distribution function of e.g. ions, or electrons; the density of particles in the velocity space, the real space and spin state. T
  type (type_dist_grid_info) :: grid_info  ! /grid_info - Specification of grids used in topo_regions. Grid coordinates could either be invariants of motion, 
  type (type_topo_regions),pointer :: topo_regions(:) => null()  ! /topo_regions(i) - List with distribution function in each topological region; Time-dependent. Structure array(nregion_
endtype
  
type type_dist_distrivec_distfunc_fexp_param_mask  !    Parameters used to defined the grid coordinates. Time-dependent
  type (type_equatorial_plane_mask) :: equatorial  ! /equatorial - Description of the equatorial plane or any other omnigeuous surfaces. Time-dependent
  integer  :: temperature=0       ! /temperature - Reference temperature profile (eV); on the grid in /distsource/source/profiles_1d/rho_tor. Used to d
endtype
  
type type_dist_geometry_0d_mask  !    Geometrical constants
  type (type_rz0D_mask) :: mag_axis  ! /mag_axis - Position of the magnetic axis [m]. Time-dependent; Scalar
  type (type_b0r0_mask) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field. Used to define the radial coordiante rho_tor and to me
endtype
  
type type_dist_geometry_1d_mask  !    Grids and metric information; including rho_tor, psi, area and volume. Time-dependent
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  integer  :: psi=0       ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  integer  :: volume=0       ! /volume - Volume enclosed by the flux surface [m^3]; Time-dependent; Vector (npsi)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (npsi)
endtype
  
type type_dist_geometry_2d_mask  !    Grids and metric information; including R, Z, rho_tor, psi, theta_geom and theta_strt. The grid has to be rectangular in a pair of
  integer  :: coord_type=0       ! /coord_type - 0: Rectangular grid in the (R,Z) coordinates; 1: Rectangular grid in the (rho_tor,theta_geom) coordi
  integer  :: r=0       ! /r - Major radius coordinate [m]; Time-dependent; Matrix (n_coord1,n_coord2)
  integer  :: z=0       ! /z - Vertical coordinate [m]; Time-dependent; Matrix (n_coord1,n_coord2)
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  integer  :: psi=0       ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp=|grad psi| /R/
  integer  :: theta_geom=0       ! /theta_geom - Geometrical poloidal angle [rad]; Time-dependent; Matrix (n_coord1,n_coord2)
  integer  :: theta_strt=0       ! /theta_strt - Straight field line poloidal angle [rad]; Time-dependent; Matrix (n_coord1,n_coord2)
endtype
  
type type_dist_state_0d_mask  !    Algebraic moments of the distribution function integrated over the plasma volume, e.g. total number of particles, energy etc. Time
  integer  :: n_particles=0       ! /n_particles - Number of particles in the distribution; the volume integral of the density (note: this is the numbe
  integer  :: n_part_fast=0       ! /n_part_fast - Number of fast particles in the distribution; the volume integral of the fast particle density (note
  integer  :: enrg=0       ! /enrg - Total energy distribution [J]; Time-dependent
  integer  :: enrg_fast=0       ! /enrg_fast - Total energy of the fast particle distribution [J]; Time-dependent
  integer  :: enrg_fast_pa=0       ! /enrg_fast_pa - Parallel energy of the fast particle distribution [J]; Time-dependent
  integer  :: momentm_fast=0       ! /momentm_fast - Kinetic toroidal angular momentum of the fast ions [Nms]; Time-dependent; Vector (npsi)
  integer  :: current_dr=0       ! /current_dr - Toroidal non-inductive current drive [A]; Time-dependent.
  integer  :: torque_jrxb=0       ! /torque_jrxb - Toroidal torque due to radial currents [N.m]; Time-dependent.
endtype
  
type type_dist_state_1d_mask  !    Fluid moments describing the state of the distribution; calculated from the distribution. Time-dependent
  integer  :: dens=0       ! /dens - Flux surface averaged particle density (including both thermal and fast particles) [1/m^3]; Time-dep
  integer  :: dens_fast=0       ! /dens_fast - Flux surface averaged fast particle density [1/m^3]; Time-dependent; Vector (npsi)
  integer  :: pres=0       ! /pres - Scalar pressure (including both thermal and fast particles) [J/m^3]. Related to the energy content, 
  integer  :: pres_fast=0       ! /pres_fast - Scalar pressure of the fast particles [J/m^3]. Related to the fast particle energy content, Wf, acco
  integer  :: pres_fast_pa=0       ! /pres_fast_pa - Parallel pressure of the fast particles [J/m^3]. Related to the fast particle parallel energy conten
  integer  :: momentm_fast=0       ! /momentm_fast - Kinetic toroidal angular momentum density of the fast ions [Ns/m^2]; Time-dependent; Vector (npsi)
  integer  :: current=0       ! /current - Total toroidal driven current density (including electron and thermal ion back-current, or drag-curr
  integer  :: current_fast=0       ! /current_fast - Flux surface averaged toroidal current density of fast (non-thermal) particles (excluding electron a
  integer  :: torque_jrxb=0       ! /torque_jrxb - Toroidal torque density due to radial currents, excluding radial current due to neoclassical effect 
endtype
  
type type_dist_state_2d_mask  !    Fluid moments describing the state of the distribution; calculated from the distribution. Time-dependent
  integer  :: dens=0       ! /dens - Particle density (including both thermal and fast particles) [1/m^3]; Time-dependent; Matrix (n_coor
  integer  :: dens_fast=0       ! /dens_fast - Fast particle density [1/m^3]; Time-dependent; Matrix (n_coord1, n_coord2)
  integer  :: pres=0       ! /pres - Scalar pressure (including both thermal and fast particles) [J/m^3]. Related to the energy content, 
  integer  :: pres_fast=0       ! /pres_fast - Scalar pressure of the fast particles [J/m^3]. Related to the fast particle energy content, Wf, acco
  integer  :: pres_fast_pa=0       ! /pres_fast_pa - Parallel pressure of the fast particles [J/m^3]. Related to the fast particle parallel energy conten
  integer  :: momentm_fast=0       ! /momentm_fast - Kinetic toroidal angular momentum density of the fast ions [Ns/m^2]; Time-dependent; Matrix (n_coord
  integer  :: current=0       ! /current - Total toroidal driven current density (including electron and thermal ion back-current, or drag-curr
  integer  :: current_fast=0       ! /current_fast - Toroidal current density of fast (non-thermal) particles of the distribution species (excluding elec
  integer  :: torque_jrxb=0       ! /torque_jrxb - Toroidal torque density due to radial currents, excluding radial current due to neoclassical effect 
endtype
  
type type_dist_collisional_transfer_0d_mask  !    
  integer  :: power_th=0       ! /power_th - Collisional power to the thermal particle population [W]; Time-dependent; Scalar
  integer  :: power_fast=0       ! /power_fast - Collisional power to the fast particle population [W]; Time-dependent; Scalar
  integer  :: torque_th=0       ! /torque_th - Collisional toroidal torque to the thermal particle population [N.m]; Time-dependent; Scalar
  integer  :: torque_fast=0       ! /torque_fast - Collisional toroidal torque to the fast particle population [N.m]; Time-dependent; Scalar
endtype
  
type type_dist_collisional_transfer_1d_mask  !    
  integer  :: power_th=0       ! /power_th - Flux surface averaged collisional power density to the thermal particle population [W.m^-3]; Time-de
  integer  :: power_fast=0       ! /power_fast - Flux surface averaged collisional power density to the fast particle population [W.m^-3]; Time-depen
  integer  :: torque_th=0       ! /torque_th - Flux surface averaged collisional toroidal torque density to the thermal particle population [N.m^-2
  integer  :: torque_fast=0       ! /torque_fast - Flux surface averaged collisional toroidal torque density to the fast particle population [N.m^-2]; 
endtype
  
type type_dist_collisional_transfer_2d_mask  !    
  integer  :: power_th=0       ! /power_th - Collisional power density to the thermal particle population [W.m^-3]; Time-dependent; Matrix(n_coor
  integer  :: power_fast=0       ! /power_fast - Collisional power density to the fast particle population [W.m^-3]; Time-dependent; Matrix(n_coord1,
  integer  :: torque_th=0       ! /torque_th - Collisional toroidal torque density to the thermal particle population [N.m^-2]; Time-dependent; Mat
  integer  :: torque_fast=0       ! /torque_fast - Collisional toroidal torque density to the fast particle population [N.m^-2]; Time-dependent; Matrix
endtype
  
type type_dist_thermalised_1d_mask  !    Representation of the flux surface averaged source of thermal particles, momentum and energy due to thermalisation. Here thermalis
  integer  :: particle=0       ! /particle - Source rate for the thermal particle density due to the thermalisation of fast (non-thermal) particl
  integer  :: momentum=0       ! /momentum - Source rate for the toroidal angular momentum density within the thermal particle population due to 
  integer  :: energy=0       ! /energy - Source rate for the energy density within the thermal particle population due to the thermalisation 
endtype
  
type type_dist_sources_reference_mask  !    Volume integrated source included in the Fokker-Planck model.
  type (type_identifier_mask) :: type  ! /type - Identifier for sources and sinks in Fokker-Planck solver; type.flag=1 for wave source, type.flag=2 f
  integer  :: index_waveid=0       ! /index_waveid - Index pointing to /distribution/distri_vec/wave_id[index_waveid] from which the source is taken. Tim
  integer  :: index_srcid=0       ! /index_srcid - Index pointing to /distribution/distri_vec/source_id[index_waveid] from which the source is taken. T
endtype
  
type type_dist_sources_0d_mask  !    Volume integrated source included in the Fokker-Planck model.
  type (type_dist_sources_reference_mask) :: source_ref  ! /source_ref - Reference identifying the origin and type of source; Time-dependedent
  integer  :: particle=0       ! /particle - Source (or sink) rate of particles [1/s]; Time-dependedent; Scalar
  integer  :: momentum=0       ! /momentum - Source (or sink) rate of toroidal angular momentum [Nm/s]; Time-dependedent; Scalar
  integer  :: energy=0       ! /energy - Source (or sink) rate of energy [J/s]; Time-dependedent; Scalar
endtype
  
type type_dist_sources_1d_mask  !    Flux surface averaged source included in the Fokker-Planck model.
  type (type_dist_sources_reference_mask) :: source_ref  ! /source_ref - Reference identifying the origin and type of source; Time-dependedent
  integer  :: particle=0       ! /particle - Source (or sink) rate of particles density [1/s/m**3]; Time-dependedent; Vector (npsi)
  integer  :: momentum=0       ! /momentum - Source (or sink) rate of toroidal angular momentum density [Nm/s/m**3]; Time-dependedent; Vector (np
  integer  :: energy=0       ! /energy - Source (or sink) rate of energy density [J/s/m**3]; Time-dependedent; Vector (npsi)
endtype
  
type type_dist_profiles_1d_collisions_z_mask  !    Collisional exchange from each background impurities species to the distribution function. Time-dependent; 
  type (type_dist_collisional_transfer_1d_mask),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange from each charge state (or bundled charge state) to the distribution function. 
endtype
  
type type_dist_profile_values_1d_mask  !    1D profiles; includes flux surface averaged quantities. Here the dimensions used refer to: npsi - size of the internal radial grid
  type (type_dist_state_1d_mask) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_1d_mask) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_1d_mask),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles_1d_collisions_z_mask),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_sources_1d_mask),pointer :: sources(:) => null()  ! /sources(i) - Vector of flux surface averaged sources and sinks of particles, momentum and power included in the F
endtype
  
type type_dist_profiles2d_collisions_z_mask  !    Collisional exchange from each background impurities species to the distribution function. Time-dependent; 
  type (type_dist_collisional_transfer_2d_mask),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange from each charge state (or bundled charge state) to the distribution function. 
endtype
  
type type_dist_profile_values_2d_mask  !    2D profiles in the poloidal plane; includes velocity space integrated quantities. Time-dependent
  type (type_dist_state_2d_mask) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_2d_mask) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_2d_mask),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles2d_collisions_z_mask),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
endtype
  
type type_dist_global_param_collisions_z_mask  !    Collisional exchange with each impurity species. The ion indexing should match the one in /distribution/compositions/impurities. T
  type (type_dist_collisional_transfer_0d_mask),pointer :: charge_state(:) => null()  ! /charge_state(i) - Collisional exchange with the impurities. The ion indexing should match the one in distribution/comp
endtype
  
type type_dist_global_param_mask  !    Global parameters; spatial constants, volume integrated quantities and quantities averaged over the cross-sectional area. Here the
  type (type_dist_geometry_0d_mask) :: geometry  ! /geometry - Geometrical constants
  type (type_dist_state_0d_mask) :: state  ! /state - Algebraic moments of the distribution function integrated over the plasma volume, e.g. total number 
  type (type_dist_collisional_transfer_0d_mask) :: collisions_e  ! /collisions_e - Collisional exchange with the electrons. Time-dependent
  type (type_dist_collisional_transfer_0d_mask),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange with each ion species. The ion indexing should match the one in /distribution/c
  type (type_dist_global_param_collisions_z_mask),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange with each impurity species. The ion indexing should match the one in /distribut
  type (type_dist_sources_0d_mask),pointer :: sources(:) => null()  ! /sources(i) - Vector of volume integrated sources and sinks of particles, momentum and power included in the Fokke
endtype
  
type type_dist_profiles_1d_mask  !    1D profiles; includes flux surface averaged quantities. Here the dimensions used refer to: npsi - size of the internal radial grid
  type (type_dist_geometry_1d_mask) :: geometry  ! /geometry - Grids and metric information; including rho_tor, psi, area and volume. Time-dependent
  type (type_dist_state_1d_mask) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_1d_mask) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_1d_mask),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles_1d_collisions_z_mask),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_thermalised_1d_mask) :: thermalised  ! /thermalised - Representation of the flux surface averaged source of thermal particles, momentum and energy due to 
  type (type_dist_sources_1d_mask),pointer :: sources(:) => null()  ! /sources(i) - Vector of flux surface averaged sources and sinks of particles, momentum and power included in the F
  type (type_dist_profile_values_1d_mask) :: trapped  ! /trapped - Flux surface averaged profile evaluated using the trapped particle part of the distribution.
  type (type_dist_profile_values_1d_mask) :: co_passing  ! /co_passing - Flux surface averaged profile evaluated using the co-current passing particle part of the distributi
  type (type_dist_profile_values_1d_mask) :: cntr_passing  ! /cntr_passing - Flux surface averaged profile evaluated using the counter-current passing particle part of the distr
endtype
  
type type_dist_profiles_2d_mask  !    2D profiles in the poloidal plane; includes velocity space integrated quantities. Time-dependent
  type (type_dist_geometry_2d_mask) :: geometry  ! /geometry - Grids and metric information; including R, Z, rho_tor, psi, theta_geom and theta_strt. The grid has 
  type (type_dist_state_2d_mask) :: state  ! /state - Fluid moments describing the state of the distribution; calculated from the distribution. Time-depen
  type (type_dist_collisional_transfer_2d_mask) :: collisions_e  ! /collisions_e - Collisional exchange from the background electrons to the distribution function. Time-dependent
  type (type_dist_collisional_transfer_2d_mask),pointer :: collisions_i(:) => null()  ! /collisions_i(i) - Collisional exchange from each background ion speices to the distribution function. Time-dependent; 
  type (type_dist_profiles2d_collisions_z_mask),pointer :: collisions_z(:) => null()  ! /collisions_z(i) - Collisional exchange from each background impurities species to the distribution function. Time-depe
  type (type_dist_profile_values_2d_mask) :: trapped  ! /trapped - 2D profiles evaluated using the trapped particle part of the distribution.
  type (type_dist_profile_values_2d_mask) :: co_passing  ! /co_passing - 2D profiles evaluated using the co-current passing particle part of the distribution.
  type (type_dist_profile_values_2d_mask) :: cntr_passing  ! /cntr_passing - 2D profiles evaluated using the counter-current passing particle part of the distribution.
endtype
  
type type_dist_grid_info_mask  !    Specification of grids used in topo_regions. Grid coordinates could either be invariants of motion, or information at single point
  integer  :: grid_type=0       ! /grid_type - Type of grid: 1=unstructured grid; 2=structured non-rectangular grid, here ndim11=ndim12=ndim13, ndi
  integer  :: ngriddim=0       ! /ngriddim - Number of grid dimension. For ngriddim=2 the grid is specified by dim1 and dim2 only, while dim3, di
  integer  :: grid_coord=0       ! /grid_coord - Identifies the coordinates specifies in dim1, dim2, dim3, dim4, dim5, and dim6. grid_coord(K) descri
  integer  :: thin_orbits=0       ! /thin_orbits - Specifies if guiding centre orbits are thin. Note: only used for orbit averaged distribution functio
  integer  :: topology=0       ! /topology - Description of the topology of the grid. NOTE: only used for nregion_topo>2.
  type (type_omnigen_surf_mask),pointer :: omnigen_surf(:) => null()  ! /omnigen_surf(i) - List of omnigeuous magnetic surfaces to which the s-coordinates in grid_coord refer. NOTE: only used
endtype
  
type type_dist_ff_mask  !    Distribution function of e.g. ions, or electrons; the density of particles in the velocity space, the real space and spin state. T
  type (type_dist_grid_info_mask) :: grid_info  ! /grid_info - Specification of grids used in topo_regions. Grid coordinates could either be invariants of motion, 
  type (type_topo_regions_mask),pointer :: topo_regions(:) => null()  ! /topo_regions(i) - List with distribution function in each topological region; Time-dependent. Structure array(nregion_
endtype

  
type type_f_expansion  !    
  type (type_complexgrid) :: grid  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/grid - Grid for storing the distribution function. Time-dependent; Complexgrid
  type (type_complexgrid_scalar) :: values  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/values - Values of the distribution function [m^-3 (m/s)^-3]. Time-dependent; Complexgrid_scalar.
  type (type_dist_distrivec_distfunc_fexp_param) :: parameters  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/parameters - Parameters used to defined the grid coordinates. Time-dependent
endtype
  
type type_f_expansion_mask  !    
  type (type_complexgrid_mask) :: grid  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/grid - Grid for storing the distribution function. Time-dependent; Complexgrid
  type (type_complexgrid_scalar_mask) :: values  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/values - Values of the distribution function [m^-3 (m/s)^-3]. Time-dependent; Complexgrid_scalar.
  type (type_dist_distrivec_distfunc_fexp_param_mask) :: parameters  ! /distribution/distri_vec(i)/dist_func/f_expansion(i)/parameters - Parameters used to defined the grid coordinates. Time-dependent
endtype

  
type type_dist_func  !    
  integer  :: is_delta_f=-999999999       ! /distribution/distri_vec(i)/dist_func/is_delta_f - If is_delta_f=1, then the distribution represents the deviation from a Maxwellian; is_delta_f=0, the
  type (type_weighted_markers) :: markers  ! /distribution/distri_vec(i)/dist_func/markers - Distribution represented by a set of markers (test particles). Time-dependent
  type (type_dist_ff),pointer :: f_expan_topo(:) => null()  ! /distribution/distri_vec(i)/dist_func/f_expan_topo(i) - TO BE REMOVED. KEPT TEMPORARILY AS AN ALTERNATIVE TO f_expansion. [Distribution function, f, expande
  type (type_f_expansion),pointer :: f_expansion(:) => null()  ! /distribution/distri_vec(i)/dist_func/f_expansion(i) - Distribution function, f, expanded into a vector of successive approximations. The first element in 
endtype
  
type type_dist_func_mask  !    
  integer  :: is_delta_f=0       ! /distribution/distri_vec(i)/dist_func/is_delta_f - If is_delta_f=1, then the distribution represents the deviation from a Maxwellian; is_delta_f=0, the
  type (type_weighted_markers_mask) :: markers  ! /distribution/distri_vec(i)/dist_func/markers - Distribution represented by a set of markers (test particles). Time-dependent
  type (type_dist_ff_mask),pointer :: f_expan_topo(:) => null()  ! /distribution/distri_vec(i)/dist_func/f_expan_topo(i) - TO BE REMOVED. KEPT TEMPORARILY AS AN ALTERNATIVE TO f_expansion. [Distribution function, f, expande
  type (type_f_expansion_mask),pointer :: f_expansion(:) => null()  ! /distribution/distri_vec(i)/dist_func/f_expansion(i) - Distribution function, f, expanded into a vector of successive approximations. The first element in 
endtype

  
type type_distri_vec  !    
  type (type_enum_instance),pointer :: wave_id(:) => null()  ! /distribution/distri_vec(i)/wave_id(i) - List all waves affecting the distribution, as specified in waves/coherentwave/wave_id (see waves_typ
  type (type_enum_instance),pointer :: source_id(:) => null()  ! /distribution/distri_vec(i)/source_id(i) - List all neutral beam injectors and reactions contributing to the source, as specified in distsource
  type (type_species_reference) :: species  ! /distribution/distri_vec(i)/species - Defines the distribution function species represented in this element of distri_vec. Time-dependent
  integer  :: gyro_type=-999999999       ! /distribution/distri_vec(i)/gyro_type - Defines how to interpret the spatial coordinates: 1 = given at the actual particle position;  2 = gi
  type (type_fast_thermal_separation_filter) :: fast_filter  ! /distribution/distri_vec(i)/fast_filter - Description of how the fast and the thermal particle populations, used in global_param and profiles_
  type (type_dist_global_param) :: global_param  ! /distribution/distri_vec(i)/global_param - Global parameters (in most cases volume integrated and surface averaged quanatities). Time-dependent
  type (type_dist_profiles_1d) :: profiles_1d  ! /distribution/distri_vec(i)/profiles_1d - Flux surface averaged profiles.
  type (type_dist_profiles_2d) :: profiles_2d  ! /distribution/distri_vec(i)/profiles_2d - 2D profiles in the poloidal plane
  type (type_dist_func) :: dist_func  ! /distribution/distri_vec(i)/dist_func - Distribution functions. The total distribution total distribution can either be given by the a set o
  type (type_codeparam) :: codeparam  ! /distribution/distri_vec(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype
  
type type_distri_vec_mask  !    
  type (type_enum_instance_mask),pointer :: wave_id(:) => null()  ! /distribution/distri_vec(i)/wave_id(i) - List all waves affecting the distribution, as specified in waves/coherentwave/wave_id (see waves_typ
  type (type_enum_instance_mask),pointer :: source_id(:) => null()  ! /distribution/distri_vec(i)/source_id(i) - List all neutral beam injectors and reactions contributing to the source, as specified in distsource
  type (type_species_reference_mask) :: species  ! /distribution/distri_vec(i)/species - Defines the distribution function species represented in this element of distri_vec. Time-dependent
  integer  :: gyro_type=0       ! /distribution/distri_vec(i)/gyro_type - Defines how to interpret the spatial coordinates: 1 = given at the actual particle position;  2 = gi
  type (type_fast_thermal_separation_filter_mask) :: fast_filter  ! /distribution/distri_vec(i)/fast_filter - Description of how the fast and the thermal particle populations, used in global_param and profiles_
  type (type_dist_global_param_mask) :: global_param  ! /distribution/distri_vec(i)/global_param - Global parameters (in most cases volume integrated and surface averaged quanatities). Time-dependent
  type (type_dist_profiles_1d_mask) :: profiles_1d  ! /distribution/distri_vec(i)/profiles_1d - Flux surface averaged profiles.
  type (type_dist_profiles_2d_mask) :: profiles_2d  ! /distribution/distri_vec(i)/profiles_2d - 2D profiles in the poloidal plane
  type (type_dist_func_mask) :: dist_func  ! /distribution/distri_vec(i)/dist_func - Distribution functions. The total distribution total distribution can either be given by the a set o
  type (type_codeparam_mask) :: codeparam  ! /distribution/distri_vec(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype

  
type type_distribution  !    
  type (type_datainfo) :: datainfo  ! /distribution/datainfo - 
  type (type_composition) :: composition  ! /distribution/composition - 
  type (type_compositions_type) :: compositions  ! /distribution/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_distri_vec),pointer :: distri_vec(:) => null()  ! /distribution/distri_vec(i) - Vector over all distribution functions. Every distribution function has to be associated with only o
  type (type_codeparam) :: codeparam  ! /distribution/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /distribution/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_distribution_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /distribution/datainfo - 
  type (type_composition_mask) :: composition  ! /distribution/composition - 
  type (type_compositions_type_mask) :: compositions  ! /distribution/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_distri_vec_mask),pointer :: distri_vec(:) => null()  ! /distribution/distri_vec(i) - Vector over all distribution functions. Every distribution function has to be associated with only o
  type (type_codeparam_mask) :: codeparam  ! /distribution/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  integer  :: time=0       ! /distribution/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include distsource.xsd
  
type type_parameters  !    
  type (type_equatorial_plane) :: equatorial  ! /source_rate/parameters/equatorial - Description of the equatorial plane or any other omnigeuous surfaces. Time-dependent
endtype
  
type type_parameters_mask  !    
  type (type_equatorial_plane_mask) :: equatorial  ! /source_rate/parameters/equatorial - Description of the equatorial plane or any other omnigeuous surfaces. Time-dependent
endtype

  
type type_source_rate  !    
  type (type_complexgrid) :: grid  ! /source_rate/grid - Grid for storing the source-rate. Time-dependent; Complexgrid
  type (type_complexgrid_scalar) :: value  ! /source_rate/value - The source-rate of particles in phase space; given on grid [(m/s)^-3 m^-3 s^-1]. Time-dependent; Com
  integer,pointer  :: discrete(:) => null()      ! /source_rate/discrete - List of indexes for the dimensions (coordinates) of grid for which the source is discretely distribu
  type (type_parameters) :: parameters  ! /source_rate/parameters - Parameters used to defined the grid coordiantes. Time-dependent
endtype
  
type type_source_rate_mask  !    
  type (type_complexgrid_mask) :: grid  ! /source_rate/grid - Grid for storing the source-rate. Time-dependent; Complexgrid
  type (type_complexgrid_scalar_mask) :: value  ! /source_rate/value - The source-rate of particles in phase space; given on grid [(m/s)^-3 m^-3 s^-1]. Time-dependent; Com
  integer  :: discrete=0       ! /source_rate/discrete - List of indexes for the dimensions (coordinates) of grid for which the source is discretely distribu
  type (type_parameters_mask) :: parameters  ! /source_rate/parameters - Parameters used to defined the grid coordiantes. Time-dependent
endtype

  
type type_distsource_global_param  !    Global parameters (volume integrated).
  type (type_exp0D) :: src_pow  ! /src_pow - Total power source [W]; Time-dependent.
  type (type_exp0D) :: src_rate  ! /src_rate - Particle source rate [1/s]; Time-dependent.
  type (type_rz0D) :: mag_axis  ! /mag_axis - Position of the magnetic axis. Time-dependent; Scalar
  type (type_b0r0) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field. Used to define the radial coordiante rho_tor. Time-dep
endtype

  
type type_distsource_profiles_1d  !    
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], evaluated without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vec
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed by the flux surface [m^3]. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]. Time-dependent; Vector (npsi)
  type (type_exp1D) :: pow_den  ! /pow_den - Flux surface averaged power density [W/m^3]; Time-dependent; Vector (npsi)
  type (type_exp1D) :: trq_den  ! /trq_den - Flux surface averaged toroidal torque density [N/m^2]; Time-dependent; Vector (npsi)
  type (type_exp1D) :: src_rate  ! /src_rate - Flux surface averaged total source density of particles [m^-3 s^-1]; Time-dependent; Vector (npsi)
endtype

  
type type_distsource_profiles_2d  !    2D source profiles in terms of two phase space coordinates
  integer,pointer  :: grid_coord(:) => null()      ! /grid_coord - Identifies the coordinates specifies in dim1 and dim2. grid_coord(1) and grid_coord(2) describe the 
  real(EUITM_R8),pointer  :: dim1(:,:) => null()     ! /dim1 - First coordinate of 2D grid. Time-dependent; Vector (ndim1,ndim2)
  real(EUITM_R8),pointer  :: dim2(:,:) => null()     ! /dim2 - Second coordinate of 2D grid. Time-dependent; Vector (ndim1,ndim2)
  real(EUITM_R8),pointer  :: g11(:,:) => null()     ! /g11 - 11 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  real(EUITM_R8),pointer  :: g12(:,:) => null()     ! /g12 - 12 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  real(EUITM_R8),pointer  :: g21(:,:) => null()     ! /g21 - 21 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  real(EUITM_R8),pointer  :: g22(:,:) => null()     ! /g22 - 22 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  type (type_exp2D) :: pow_den  ! /pow_den - Source power density. Here sum(M,N=1,2; pow_den*gNM*dimN*dimM) have unit [W]. Time-dependent; Vector
  type (type_exp2D) :: src_rate  ! /src_rate - Source density of particles.Here sum(M,N=1,2; src_rate*gNM*dimN*dimM) have unit [1/s]. Time-dependen
endtype

  
type type_distsource_line_src_prof  !    
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate at the grid points for 1D profiles [m]. Defined as sqrt(phi/pi/B0), where B
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate at the grid points for 1D profiles; Time-dependent; Vector (npsi
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp = |grad psi| /
  real(EUITM_R8),pointer  :: R(:) => null()     ! /R - Major radius at the line source. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: Z(:) => null()     ! /Z - Vertical position of the line source. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: theta(:) => null()     ! /theta - Polidal angle [rad]. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: theta_id(:) => null()     ! /theta_id - Type of poloidal angle: 1 : same as the poloidal angle in the equlibrium cpo; 2 : geometrical polar 
  real(EUITM_R8),pointer  :: th2th_pol(:,:) => null()     ! /th2th_pol - Geometrical poloidal angle at grid points in theta, i.e. the transformation from theta to the polar 
  real(EUITM_R8),pointer  :: pitch(:) => null()     ! /pitch - Pitch (i.e. v_parallel/v) of source particles. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /energy - Kinetic energy of source particles [eV]. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: ang_momentum(:) => null()     ! /ang_momentum - Kinetic angular momentum of a single source particles, R m v_phi [Nms]. Time-dependent; Vector (npsi
  real(EUITM_R8),pointer  :: src_rate(:) => null()     ! /src_rate - Source density of particles [1/m^3/s]. Time-dependent; Vector (npsi)
endtype

  
type type_distsource_source  !    Source
  type (type_enum_instance),pointer :: source_id(:) => null()  ! /source_id(i) - List of identifiers for the source, in term the type and name of the injectors and reactions that pr
  type (type_species_reference) :: species  ! /species - Defines the source species represented in this element of the vector /distsource/source. Time-depend
  integer  :: gyro_type=-999999999       ! /gyro_type - Defines how to interpret the spatial coordinates: 1 = given at the actual particle birth point;  2 =
  type (type_distsource_global_param) :: global_param  ! /global_param - Global parameters.
  type (type_distsource_profiles_1d) :: profiles_1d  ! /profiles_1d - 1D radial profiles
  type (type_distsource_profiles_2d) :: profiles_2d  ! /profiles_2d - 2D source profiles in terms of two phase space coordinates
  type (type_distsource_line_src_prof),pointer :: line_srcprof(:) => null()  ! /line_srcprof(i) - 1D profiles representation of a line source. Time-dependent
  type (type_source_rate) :: source_rate  ! /source_rate - Source density of particles in phase space (real space, velocity space, spin state).
  type (type_weighted_markers) :: markers  ! /markers - Source given as a set of markers (test particles) born per second.
  type (type_codeparam) :: codeparam  ! /codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype
  
type type_distsource_global_param_mask  !    Global parameters (volume integrated).
  type (type_exp0D_mask) :: src_pow  ! /src_pow - Total power source [W]; Time-dependent.
  type (type_exp0D_mask) :: src_rate  ! /src_rate - Particle source rate [1/s]; Time-dependent.
  type (type_rz0D_mask) :: mag_axis  ! /mag_axis - Position of the magnetic axis. Time-dependent; Scalar
  type (type_b0r0_mask) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field. Used to define the radial coordiante rho_tor. Time-dep
endtype
  
type type_distsource_profiles_1d_mask  !    
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], evaluated without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vec
  integer  :: volume=0       ! /volume - Volume enclosed by the flux surface [m^3]. Time-dependent; Vector (npsi)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]. Time-dependent; Vector (npsi)
  type (type_exp1D_mask) :: pow_den  ! /pow_den - Flux surface averaged power density [W/m^3]; Time-dependent; Vector (npsi)
  type (type_exp1D_mask) :: trq_den  ! /trq_den - Flux surface averaged toroidal torque density [N/m^2]; Time-dependent; Vector (npsi)
  type (type_exp1D_mask) :: src_rate  ! /src_rate - Flux surface averaged total source density of particles [m^-3 s^-1]; Time-dependent; Vector (npsi)
endtype
  
type type_distsource_profiles_2d_mask  !    2D source profiles in terms of two phase space coordinates
  integer  :: grid_coord=0       ! /grid_coord - Identifies the coordinates specifies in dim1 and dim2. grid_coord(1) and grid_coord(2) describe the 
  integer  :: dim1=0       ! /dim1 - First coordinate of 2D grid. Time-dependent; Vector (ndim1,ndim2)
  integer  :: dim2=0       ! /dim2 - Second coordinate of 2D grid. Time-dependent; Vector (ndim1,ndim2)
  integer  :: g11=0       ! /g11 - 11 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  integer  :: g12=0       ! /g12 - 12 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  integer  :: g21=0       ! /g21 - 21 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  integer  :: g22=0       ! /g22 - 22 component of the covariant metric tensor in the (dim1, dim2) coordiante system. Time-dependent; V
  type (type_exp2D_mask) :: pow_den  ! /pow_den - Source power density. Here sum(M,N=1,2; pow_den*gNM*dimN*dimM) have unit [W]. Time-dependent; Vector
  type (type_exp2D_mask) :: src_rate  ! /src_rate - Source density of particles.Here sum(M,N=1,2; src_rate*gNM*dimN*dimM) have unit [1/s]. Time-dependen
endtype
  
type type_distsource_line_src_prof_mask  !    
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate at the grid points for 1D profiles [m]. Defined as sqrt(phi/pi/B0), where B
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate at the grid points for 1D profiles; Time-dependent; Vector (npsi
  integer  :: psi=0       ! /psi - Poloidal flux at the grid points for 1D profiles [Wb], without 1/2pi and such that Bp = |grad psi| /
  integer  :: R=0       ! /R - Major radius at the line source. Time-dependent; Vector (npsi)
  integer  :: Z=0       ! /Z - Vertical position of the line source. Time-dependent; Vector (npsi)
  integer  :: theta=0       ! /theta - Polidal angle [rad]. Time-dependent; Vector (npsi)
  integer  :: theta_id=0       ! /theta_id - Type of poloidal angle: 1 : same as the poloidal angle in the equlibrium cpo; 2 : geometrical polar 
  integer  :: th2th_pol=0       ! /th2th_pol - Geometrical poloidal angle at grid points in theta, i.e. the transformation from theta to the polar 
  integer  :: pitch=0       ! /pitch - Pitch (i.e. v_parallel/v) of source particles. Time-dependent; Vector (npsi)
  integer  :: energy=0       ! /energy - Kinetic energy of source particles [eV]. Time-dependent; Vector (npsi)
  integer  :: ang_momentum=0       ! /ang_momentum - Kinetic angular momentum of a single source particles, R m v_phi [Nms]. Time-dependent; Vector (npsi
  integer  :: src_rate=0       ! /src_rate - Source density of particles [1/m^3/s]. Time-dependent; Vector (npsi)
endtype
  
type type_distsource_source_mask  !    Source
  type (type_enum_instance_mask),pointer :: source_id(:) => null()  ! /source_id(i) - List of identifiers for the source, in term the type and name of the injectors and reactions that pr
  type (type_species_reference_mask) :: species  ! /species - Defines the source species represented in this element of the vector /distsource/source. Time-depend
  integer  :: gyro_type=0       ! /gyro_type - Defines how to interpret the spatial coordinates: 1 = given at the actual particle birth point;  2 =
  type (type_distsource_global_param_mask) :: global_param  ! /global_param - Global parameters.
  type (type_distsource_profiles_1d_mask) :: profiles_1d  ! /profiles_1d - 1D radial profiles
  type (type_distsource_profiles_2d_mask) :: profiles_2d  ! /profiles_2d - 2D source profiles in terms of two phase space coordinates
  type (type_distsource_line_src_prof_mask),pointer :: line_srcprof(:) => null()  ! /line_srcprof(i) - 1D profiles representation of a line source. Time-dependent
  type (type_source_rate_mask) :: source_rate  ! /source_rate - Source density of particles in phase space (real space, velocity space, spin state).
  type (type_weighted_markers_mask) :: markers  ! /markers - Source given as a set of markers (test particles) born per second.
  type (type_codeparam_mask) :: codeparam  ! /codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype

  
type type_distsource  !    
  type (type_datainfo) :: datainfo  ! /distsource/datainfo - 
  type (type_composition) :: composition  ! /distsource/composition - Plasma composition.
  type (type_compositions_type) :: compositions  ! /distsource/compositions - Contains detailed information on the plasma composition (main ions, impurities, neutrals, edge speci
  type (type_distsource_source),pointer :: source(:) => null()  ! /distsource/source(i) - Source. Time-dependent. Structure array(nsrc_spec)
  type (type_codeparam) :: codeparam  ! /distsource/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /distsource/time - Time [s]; Time-dependent; scalar
endtype
  
type type_distsource_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /distsource/datainfo - 
  type (type_composition_mask) :: composition  ! /distsource/composition - Plasma composition.
  type (type_compositions_type_mask) :: compositions  ! /distsource/compositions - Contains detailed information on the plasma composition (main ions, impurities, neutrals, edge speci
  type (type_distsource_source_mask),pointer :: source(:) => null()  ! /distsource/source(i) - Source. Time-dependent. Structure array(nsrc_spec)
  type (type_codeparam_mask) :: codeparam  ! /distsource/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  integer  :: time=0       ! /distsource/time - Time [s]; Time-dependent; scalar
endtype

! ***********  Include ecediag.xsd
  
type type_ecesetup  !    diagnostic setup information
  real(EUITM_R8),pointer  :: frequency(:) => null()     ! /frequency - Frequency of the ECE channels. Vector (nchannels)
  type (type_setup_line_exp) :: los  ! /los - Geometry of the line of sight.
endtype

  
type type_ecemeasure  !    Measured values
  integer  :: harmonic=-999999999       ! /harmonic - Harmonic detected by the  ECE channels. Time-dependent.
  type (type_rzphi1Dexp) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
  type (type_exp1D) :: te  ! /te - Electron temperature [eV]. Time-dependent. Vector (nchannels)
endtype
  
type type_ecesetup_mask  !    diagnostic setup information
  integer  :: frequency=0       ! /frequency - Frequency of the ECE channels. Vector (nchannels)
  type (type_setup_line_exp_mask) :: los  ! /los - Geometry of the line of sight.
endtype
  
type type_ecemeasure_mask  !    Measured values
  integer  :: harmonic=0       ! /harmonic - Harmonic detected by the  ECE channels. Time-dependent.
  type (type_rzphi1Dexp_mask) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
  type (type_exp1D_mask) :: te  ! /te - Electron temperature [eV]. Time-dependent. Vector (nchannels)
endtype

  
type type_ecediag  !    
  type (type_datainfo) :: datainfo  ! /ecediag/datainfo - 
  type (type_ecesetup) :: setup  ! /ecediag/setup - diagnostic setup information
  type (type_ecemeasure) :: measure  ! /ecediag/measure - Measured values
  type (type_codeparam) :: codeparam  ! /ecediag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /ecediag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_ecediag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /ecediag/datainfo - 
  type (type_ecesetup_mask) :: setup  ! /ecediag/setup - diagnostic setup information
  type (type_ecemeasure_mask) :: measure  ! /ecediag/measure - Measured values
  type (type_codeparam_mask) :: codeparam  ! /ecediag/codeparam - 
  integer  :: time=0       ! /ecediag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include edge.xsd
  
type type_edge_fluid_scalar_transpcoeff  !    Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_vector_simplestruct) :: d  ! /d - Diffusivity [m^2/s]; Time-dependent;
  type (type_complexgrid_vector_simplestruct) :: v  ! /v - Velocity [m/s]; Time-dependent;
endtype

  
type type_edge_fluid_scalar_simplestruct  !    A scalar fluid quantity. To be used as simple structure.
  type (type_complexgrid_scalar),pointer :: value(:) => null()  ! /value(i) - Value of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (n
  type (type_complexgrid_scalar),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary values of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; A
  type (type_complexgrid_vector),pointer :: flux(:) => null()  ! /flux(i) - Flux of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (ns
  type (type_complexgrid_vector),pointer :: bndflux(:) => null()  ! /bndflux(i) - Flux of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; Array of str
  type (type_edge_fluid_scalar_transpcoeff),pointer :: transpcoeff(:) => null()  ! /transpcoeff(i) - Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_scalar),pointer :: source(:) => null()  ! /source(i) - Source; Time-dependent; Array of structures (nsubgrid_quantity)
endtype

  
type type_edge_fluid_scalar  !    A scalar fluid quantity. To be used as array of structure
  type (type_complexgrid_scalar),pointer :: value(:) => null()  ! /value(i) - Value of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (n
  type (type_complexgrid_scalar),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary values of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; A
  type (type_complexgrid_vector),pointer :: flux(:) => null()  ! /flux(i) - Flux of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (ns
  type (type_complexgrid_vector),pointer :: bndflux(:) => null()  ! /bndflux(i) - Flux of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; Array of str
  type (type_edge_fluid_scalar_transpcoeff),pointer :: transpcoeff(:) => null()  ! /transpcoeff(i) - Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_scalar),pointer :: source(:) => null()  ! /source(i) - Source; Time-dependent; Array of structures (nsubgrid_quantity)
endtype

  
type type_edge_fluid_vector_simplestruct  !    A fluid vector quantity, with components possibly explicitly aligned to a coordinate direction.  To be used as simple structure.
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  integer  :: basis=-999999999       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
  type (type_edge_fluid_scalar),pointer :: comps(:) => null()  ! /comps(i) - Components of the vector. Array of structures(ndim); Time-dependent;
  integer,pointer  :: align(:) => null()      ! /align - Alignment of vector components, numerical flag. Int vector(ndim);
  character(len=132), dimension(:), pointer ::alignid => null()       ! /alignid - Alignment of vector components, string description. String vector(ndim);
endtype

  
type type_edge_fluid_vector  !    A fluid vector quantity, with components possibly explicitly aligned to a coordinate direction. To be used as array of structure
  integer  :: griduid=-999999999       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  integer  :: basis=-999999999       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
  integer,pointer  :: align(:) => null()      ! /align - Alignment of vector components, numerical flag. Int vector (number of vector components);
  character(len=132), dimension(:), pointer ::alignid => null()       ! /alignid - Alignment of vector components, string description. String vector (number of vector components);
  type (type_edge_fluid_scalar),pointer :: comps(:) => null()  ! /comps(i) - Components of the vector. Array of structures (number of vector components); Time-dependent;
endtype

  
type type_edge_fluid  !    Fluid quantities
  type (type_edge_fluid_scalar_simplestruct) :: ne  ! /ne - Electron density [1/m^3]; Time-dependent;
  type (type_edge_fluid_scalar),pointer :: ni(:) => null()  ! /ni(i) - Ion density [1/m^3] (per species). Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_vector_simplestruct) :: ve  ! /ve - Electron velocity [m/s]; Time-dependent;
  type (type_edge_fluid_vector),pointer :: vi(:) => null()  ! /vi(i) - Ion velocity [m/s] (per species).Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_scalar_simplestruct) :: te  ! /te - Electron temperature [eV]; Time-dependent;
  type (type_edge_fluid_scalar),pointer :: ti(:) => null()  ! /ti(i) - Ion temperature [eV] (per species). Array of structures(nspecies).; Time-dependent;
  type (type_edge_fluid_vector_simplestruct) :: te_aniso  ! /te_aniso - Anisotropic electron temperature [eV]; Time-dependent;
  type (type_edge_fluid_vector),pointer :: ti_aniso(:) => null()  ! /ti_aniso(i) - Anisotropic ion temperature [eV] (per species). Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_scalar_simplestruct) :: po  ! /po - Electric potential [V]; Time-dependent;
  type (type_edge_fluid_vector_simplestruct) :: j  ! /j - Electric current [A]; Time-dependent;
  type (type_complexgrid_vector),pointer :: b(:) => null()  ! /b(i) - Magnetic field vector [T]; Time-dependent;
endtype

  
type type_edge_kinetic_distribution  !    
  type (type_complexgrid_scalar),pointer :: value(:) => null()  ! /value(i) - Value of distribution function. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). T
  type (type_complexgrid_scalar),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary value of distribution function. Possibly stored on multiple subgrids.; Vector (nsubgrid_qua
  type (type_complexgrid_vector),pointer :: fluxes(:) => null()  ! /fluxes(i) - Fluxes in phase space. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). Time-depen
  type (type_complexgrid_scalar),pointer :: source(:) => null()  ! /source(i) - Sources in phase space. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). Time-depe
endtype

  
type type_edge_kinetic  !    Kinetic quantities
  type (type_edge_kinetic_distribution),pointer :: f(:) => null()  ! /f(i) - Distribution function [1/m^3 (m/s)^-3]. Array of structuresr(nspecies); Time-dependent;
endtype
  
type type_edge_fluid_scalar_transpcoeff_mask  !    Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_vector_simplestruct_mask) :: d  ! /d - Diffusivity [m^2/s]; Time-dependent;
  type (type_complexgrid_vector_simplestruct_mask) :: v  ! /v - Velocity [m/s]; Time-dependent;
endtype
  
type type_edge_fluid_scalar_simplestruct_mask  !    A scalar fluid quantity. To be used as simple structure.
  type (type_complexgrid_scalar_mask),pointer :: value(:) => null()  ! /value(i) - Value of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (n
  type (type_complexgrid_scalar_mask),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary values of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; A
  type (type_complexgrid_vector_mask),pointer :: flux(:) => null()  ! /flux(i) - Flux of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (ns
  type (type_complexgrid_vector_mask),pointer :: bndflux(:) => null()  ! /bndflux(i) - Flux of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; Array of str
  type (type_edge_fluid_scalar_transpcoeff_mask),pointer :: transpcoeff(:) => null()  ! /transpcoeff(i) - Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_scalar_mask),pointer :: source(:) => null()  ! /source(i) - Source; Time-dependent; Array of structures (nsubgrid_quantity)
endtype
  
type type_edge_fluid_scalar_mask  !    A scalar fluid quantity. To be used as array of structure
  type (type_complexgrid_scalar_mask),pointer :: value(:) => null()  ! /value(i) - Value of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (n
  type (type_complexgrid_scalar_mask),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary values of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; A
  type (type_complexgrid_vector_mask),pointer :: flux(:) => null()  ! /flux(i) - Flux of the quantity. Possibly stored on multiple subgrids.; Time-dependent; Array of structures (ns
  type (type_complexgrid_vector_mask),pointer :: bndflux(:) => null()  ! /bndflux(i) - Flux of the quantity. Possibly stored on multiple (boundary) subgrids.; Time-dependent; Array of str
  type (type_edge_fluid_scalar_transpcoeff_mask),pointer :: transpcoeff(:) => null()  ! /transpcoeff(i) - Transport coefficients; Time-dependent; Array of structures (nsubgrid_quantity)
  type (type_complexgrid_scalar_mask),pointer :: source(:) => null()  ! /source(i) - Source; Time-dependent; Array of structures (nsubgrid_quantity)
endtype
  
type type_edge_fluid_vector_simplestruct_mask  !    A fluid vector quantity, with components possibly explicitly aligned to a coordinate direction.  To be used as simple structure.
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  integer  :: basis=0       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
  type (type_edge_fluid_scalar_mask),pointer :: comps(:) => null()  ! /comps(i) - Components of the vector. Array of structures(ndim); Time-dependent;
  integer  :: align=0       ! /align - Alignment of vector components, numerical flag. Int vector(ndim);
  integer  :: alignid=0       ! /alignid - Alignment of vector components, string description. String vector(ndim);
endtype
  
type type_edge_fluid_vector_mask  !    A fluid vector quantity, with components possibly explicitly aligned to a coordinate direction. To be used as array of structure
  integer  :: griduid=0       ! /griduid - Unique identifier of the grid this vector quantity is associated with.
  integer  :: basis=0       ! /basis - Index of basis (defined in associated grid) this vector is aligned to; If set to GRID_UNDEFINED=0, t
  integer  :: align=0       ! /align - Alignment of vector components, numerical flag. Int vector (number of vector components);
  integer  :: alignid=0       ! /alignid - Alignment of vector components, string description. String vector (number of vector components);
  type (type_edge_fluid_scalar_mask),pointer :: comps(:) => null()  ! /comps(i) - Components of the vector. Array of structures (number of vector components); Time-dependent;
endtype
  
type type_edge_fluid_mask  !    Fluid quantities
  type (type_edge_fluid_scalar_simplestruct_mask) :: ne  ! /ne - Electron density [1/m^3]; Time-dependent;
  type (type_edge_fluid_scalar_mask),pointer :: ni(:) => null()  ! /ni(i) - Ion density [1/m^3] (per species). Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_vector_simplestruct_mask) :: ve  ! /ve - Electron velocity [m/s]; Time-dependent;
  type (type_edge_fluid_vector_mask),pointer :: vi(:) => null()  ! /vi(i) - Ion velocity [m/s] (per species).Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_scalar_simplestruct_mask) :: te  ! /te - Electron temperature [eV]; Time-dependent;
  type (type_edge_fluid_scalar_mask),pointer :: ti(:) => null()  ! /ti(i) - Ion temperature [eV] (per species). Array of structures(nspecies).; Time-dependent;
  type (type_edge_fluid_vector_simplestruct_mask) :: te_aniso  ! /te_aniso - Anisotropic electron temperature [eV]; Time-dependent;
  type (type_edge_fluid_vector_mask),pointer :: ti_aniso(:) => null()  ! /ti_aniso(i) - Anisotropic ion temperature [eV] (per species). Array of structures(nspecies); Time-dependent;
  type (type_edge_fluid_scalar_simplestruct_mask) :: po  ! /po - Electric potential [V]; Time-dependent;
  type (type_edge_fluid_vector_simplestruct_mask) :: j  ! /j - Electric current [A]; Time-dependent;
  type (type_complexgrid_vector_mask),pointer :: b(:) => null()  ! /b(i) - Magnetic field vector [T]; Time-dependent;
endtype
  
type type_edge_kinetic_distribution_mask  !    
  type (type_complexgrid_scalar_mask),pointer :: value(:) => null()  ! /value(i) - Value of distribution function. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). T
  type (type_complexgrid_scalar_mask),pointer :: bndvalue(:) => null()  ! /bndvalue(i) - Boundary value of distribution function. Possibly stored on multiple subgrids.; Vector (nsubgrid_qua
  type (type_complexgrid_vector_mask),pointer :: fluxes(:) => null()  ! /fluxes(i) - Fluxes in phase space. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). Time-depen
  type (type_complexgrid_scalar_mask),pointer :: source(:) => null()  ! /source(i) - Sources in phase space. Possibly stored on multiple subgrids.; Vector (nsubgrid_quantity). Time-depe
endtype
  
type type_edge_kinetic_mask  !    Kinetic quantities
  type (type_edge_kinetic_distribution_mask),pointer :: f(:) => null()  ! /f(i) - Distribution function [1/m^3 (m/s)^-3]. Array of structuresr(nspecies); Time-dependent;
endtype

  
type type_edge  !    
  type (type_datainfo) :: datainfo  ! /edge/datainfo - 
  type (type_complexgrid) :: grid  ! /edge/grid - Grid description
  type (type_species_desc),pointer :: species(:) => null()  ! /edge/species(i) - Description of ion species. Array of structures(nspecies)
  type (type_compositions_type) :: compositions  ! /edge/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_edge_fluid) :: fluid  ! /edge/fluid - Fluid description of edge plasma. Time-dependent.
  type (type_edge_kinetic) :: kinetic  ! /edge/kinetic - Kinetic description of edge plasma. Time-dependent.
  type (type_codeparam) :: codeparam  ! /edge/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /edge/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_edge_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /edge/datainfo - 
  type (type_complexgrid_mask) :: grid  ! /edge/grid - Grid description
  type (type_species_desc_mask),pointer :: species(:) => null()  ! /edge/species(i) - Description of ion species. Array of structures(nspecies)
  type (type_compositions_type_mask) :: compositions  ! /edge/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_edge_fluid_mask) :: fluid  ! /edge/fluid - Fluid description of edge plasma. Time-dependent.
  type (type_edge_kinetic_mask) :: kinetic  ! /edge/kinetic - Kinetic description of edge plasma. Time-dependent.
  type (type_codeparam_mask) :: codeparam  ! /edge/codeparam - 
  integer  :: time=0       ! /edge/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include efcc.xsd
  
type type_edges  !    
  type (type_rzphi1D) :: edge_rzphi  ! /efcc/coil(i)/desc_coils/edges(i)/edge_rzphi - Sequence of points describing a coil edge. Vector (npoints)
endtype
  
type type_edges_mask  !    
  type (type_rzphi1D_mask) :: edge_rzphi  ! /efcc/coil(i)/desc_coils/edges(i)/edge_rzphi - Sequence of points describing a coil edge. Vector (npoints)
endtype

  
type type_desc_coils  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /efcc/coil(i)/desc_coils/name - Name of coil.
  real(EUITM_R8)  :: res=-9.0E40_EUITM_R8       ! /efcc/coil(i)/desc_coils/res - Coil resistance [Ohm]
  integer  :: nturns=-999999999       ! /efcc/coil(i)/desc_coils/nturns - number of turns inside the coil
  character(len=132), dimension(:), pointer ::closed => null()       ! /efcc/coil(i)/desc_coils/closed - Identify whether the coil is closed (y) or open (n). For closed coils there is no need to replicate 
  type (type_edges),pointer :: edges(:) => null()  ! /efcc/coil(i)/desc_coils/edges(i) - Edges defining the coil volume faces. Structure array. Replicate this edge structure N-times for N-e
endtype
  
type type_desc_coils_mask  !    
  integer  :: name=0       ! /efcc/coil(i)/desc_coils/name - Name of coil.
  integer  :: res=0       ! /efcc/coil(i)/desc_coils/res - Coil resistance [Ohm]
  integer  :: nturns=0       ! /efcc/coil(i)/desc_coils/nturns - number of turns inside the coil
  integer  :: closed=0       ! /efcc/coil(i)/desc_coils/closed - Identify whether the coil is closed (y) or open (n). For closed coils there is no need to replicate 
  type (type_edges_mask),pointer :: edges(:) => null()  ! /efcc/coil(i)/desc_coils/edges(i) - Edges defining the coil volume faces. Structure array. Replicate this edge structure N-times for N-e
endtype

  
type type_coil  !    
  type (type_desc_coils) :: desc_coils  ! /efcc/coil(i)/desc_coils - Description of the coils
  type (type_exp1D) :: coilcurrent  ! /efcc/coil(i)/coilcurrent - Circuit feed current in the coil, defined positive if it flows from point 1 to point 2 of the geomet
  type (type_exp1D) :: coilvoltage  ! /efcc/coil(i)/coilvoltage - Voltage on the full coil [V]; Time-dependent
endtype
  
type type_coil_mask  !    
  type (type_desc_coils_mask) :: desc_coils  ! /efcc/coil(i)/desc_coils - Description of the coils
  type (type_exp1D_mask) :: coilcurrent  ! /efcc/coil(i)/coilcurrent - Circuit feed current in the coil, defined positive if it flows from point 1 to point 2 of the geomet
  type (type_exp1D_mask) :: coilvoltage  ! /efcc/coil(i)/coilvoltage - Voltage on the full coil [V]; Time-dependent
endtype

  
type type_efcc  !    
  type (type_datainfo) :: datainfo  ! /efcc/datainfo - 
  type (type_coil),pointer :: coil(:) => null()  ! /efcc/coil(i) - Individual coil. Time-dependent. Structure array. Replicate this coil structure for coil element in 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /efcc/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam) :: codeparam  ! /efcc/codeparam - 
endtype
  
type type_efcc_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /efcc/datainfo - 
  type (type_coil_mask),pointer :: coil(:) => null()  ! /efcc/coil(i) - Individual coil. Time-dependent. Structure array. Replicate this coil structure for coil element in 
  integer  :: time=0       ! /efcc/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam_mask) :: codeparam  ! /efcc/codeparam - 
endtype

! ***********  Include eqcoord_sys.xsd
  
type type_coord_sys  !    
  character(len=132), dimension(:), pointer ::grid_type => null()       ! /coord_sys/grid_type - Type of coordinate system
  type (type_reggrid) :: grid  ! /coord_sys/grid - Regular grid definition; Time-dependent
  real(EUITM_R8),pointer  :: jacobian(:,:) => null()     ! /coord_sys/jacobian - Jacobian of the coordinate system; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: g_11(:,:) => null()     ! /coord_sys/g_11 - metric coefficients g_11; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  real(EUITM_R8),pointer  :: g_12(:,:) => null()     ! /coord_sys/g_12 - metric coefficients g_12; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  real(EUITM_R8),pointer  :: g_13(:,:) => null()     ! /coord_sys/g_13 - metric coefficients g_13; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  real(EUITM_R8),pointer  :: g_22(:,:) => null()     ! /coord_sys/g_22 - metric coefficients g_22; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  real(EUITM_R8),pointer  :: g_23(:,:) => null()     ! /coord_sys/g_23 - metric coefficients g_23; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  real(EUITM_R8),pointer  :: g_33(:,:) => null()     ! /coord_sys/g_33 - metric coefficients g_33; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  type (type_rz2D) :: position  ! /coord_sys/position - R and Z position of grid points; Time-dependent; Matrix (ndim1, ndim2)
endtype
  
type type_coord_sys_mask  !    
  integer  :: grid_type=0       ! /coord_sys/grid_type - Type of coordinate system
  type (type_reggrid_mask) :: grid  ! /coord_sys/grid - Regular grid definition; Time-dependent
  integer  :: jacobian=0       ! /coord_sys/jacobian - Jacobian of the coordinate system; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: g_11=0       ! /coord_sys/g_11 - metric coefficients g_11; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  integer  :: g_12=0       ! /coord_sys/g_12 - metric coefficients g_12; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  integer  :: g_13=0       ! /coord_sys/g_13 - metric coefficients g_13; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  integer  :: g_22=0       ! /coord_sys/g_22 - metric coefficients g_22; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  integer  :: g_23=0       ! /coord_sys/g_23 - metric coefficients g_23; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  integer  :: g_33=0       ! /coord_sys/g_33 - metric coefficients g_33; g_ij=g^ij are contravariant metric tensor for the grid described by grid_t
  type (type_rz2D_mask) :: position  ! /coord_sys/position - R and Z position of grid points; Time-dependent; Matrix (ndim1, ndim2)
endtype

! ***********  Include eqconstraint.xsd
  
type type_eqmes0D  !    Structure for equilibrium measurement 0D signal
  real(EUITM_R8)  :: measured=-9.0E40_EUITM_R8       ! /measured - Measured value of the signal; Time-dependent; Scalar.
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal); String
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Time (exact time slice used from the time array of the source signal. If the time slice does not exi
  integer  :: exact=-999999999       ! /exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; scalar inte
  real(EUITM_R8)  :: weight=-9.0E40_EUITM_R8       ! /weight - weight given to the measurement (>= 0); Time-dependent; Scalar.
  real(EUITM_R8)  :: sigma=-9.0E40_EUITM_R8       ! /sigma - standard deviation of the measurement; Time-dependent; Scalar.
  real(EUITM_R8)  :: calculated=-9.0E40_EUITM_R8       ! /calculated - Signal as recalculated by the equilibrium code; Time-dependent; Scalar.
  real(EUITM_R8)  :: chi2=-9.0E40_EUITM_R8       ! /chi2 - chi^2 of (calculated-measured); Time-dependent; Scalar.
endtype

  
type type_eqmes1D  !    Structure for equilibrium measurement 1D signal
  real(EUITM_R8),pointer  :: measured(:) => null()     ! /measured - Measured value of the signal; Time-dependent; Array(nmeas)
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal), e.g. '
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Exact time slice used from the time array of the source signal. If the time slice does not exist in 
  integer,pointer  :: exact(:) => null()      ! /exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; Time-depend
  real(EUITM_R8),pointer  :: weight(:) => null()     ! /weight - weight given to the measurement (>= 0); Time-dependent; Array(nmeas)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /sigma - standard deviation of the measurement; Time-dependent; Array(nmeas)
  real(EUITM_R8),pointer  :: calculated(:) => null()     ! /calculated - Signal as recalculated by the equilibrium code; Time-dependent; Array(nmeas)
  real(EUITM_R8),pointer  :: chi2(:) => null()     ! /chi2 - chi^2 of (calculated-measured); Time-dependent; Array(nmeas)
endtype
  
type type_eqmes0D_mask  !    Structure for equilibrium measurement 0D signal
  integer  :: measured=0       ! /measured - Measured value of the signal; Time-dependent; Scalar.
  integer  :: source=0       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal); String
  integer  :: time=0       ! /time - Time (exact time slice used from the time array of the source signal. If the time slice does not exi
  integer  :: exact=0       ! /exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; scalar inte
  integer  :: weight=0       ! /weight - weight given to the measurement (>= 0); Time-dependent; Scalar.
  integer  :: sigma=0       ! /sigma - standard deviation of the measurement; Time-dependent; Scalar.
  integer  :: calculated=0       ! /calculated - Signal as recalculated by the equilibrium code; Time-dependent; Scalar.
  integer  :: chi2=0       ! /chi2 - chi^2 of (calculated-measured); Time-dependent; Scalar.
endtype
  
type type_eqmes1D_mask  !    Structure for equilibrium measurement 1D signal
  integer  :: measured=0       ! /measured - Measured value of the signal; Time-dependent; Array(nmeas)
  integer  :: source=0       ! /source - Path to the source signal (diagnostic or genprof, from which to read all info on the signal), e.g. '
  integer  :: time=0       ! /time - Exact time slice used from the time array of the source signal. If the time slice does not exist in 
  integer  :: exact=0       ! /exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; Time-depend
  integer  :: weight=0       ! /weight - weight given to the measurement (>= 0); Time-dependent; Array(nmeas)
  integer  :: sigma=0       ! /sigma - standard deviation of the measurement; Time-dependent; Array(nmeas)
  integer  :: calculated=0       ! /calculated - Signal as recalculated by the equilibrium code; Time-dependent; Array(nmeas)
  integer  :: chi2=0       ! /chi2 - chi^2 of (calculated-measured); Time-dependent; Array(nmeas)
endtype

  
type type_isoflux  !    
  type (type_rz1D) :: position  ! /eqconstraint/isoflux/position - Position of the points at which the flux is considered the same; Time-dependent; Vector (nmeas)
  character(len=132), dimension(:), pointer ::source => null()       ! /eqconstraint/isoflux/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  real(EUITM_R8),pointer  :: weight(:) => null()     ! /eqconstraint/isoflux/weight - weight given to the measurement (>= 0); -1 if exact data; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /eqconstraint/isoflux/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: calculated(:) => null()     ! /eqconstraint/isoflux/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: chi2(:) => null()     ! /eqconstraint/isoflux/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype

  
type type_magnet_iron  !    
  type (type_eqmes1D) :: mr  ! /eqconstraint/magnet_iron/mr - Magnetisation along the R axis [T];
  type (type_eqmes1D) :: mz  ! /eqconstraint/magnet_iron/mz - Magnetisation along the Z axis [T];
endtype

  
type type_q  !    
  real(EUITM_R8),pointer  :: qvalue(:) => null()     ! /eqconstraint/q/qvalue - Safety factor values; Time-dependent; Vector (nmeas)
  type (type_rz1D) :: position  ! /eqconstraint/q/position - Major radius of the given safety factor values [m]; Time-dependent; Vector (nmeas)
  character(len=132), dimension(:), pointer ::source => null()       ! /eqconstraint/q/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  integer  :: exact=-999999999       ! /eqconstraint/q/exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; scalar inte
  real(EUITM_R8),pointer  :: weight(:) => null()     ! /eqconstraint/q/weight - weight given to the measurement (>= 0); Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /eqconstraint/q/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: calculated(:) => null()     ! /eqconstraint/q/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: chi2(:) => null()     ! /eqconstraint/q/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype

  
type type_xpts  !    
  type (type_rz1D) :: position  ! /eqconstraint/xpts/position - Position of the X-point(s); Time-dependent; Vector (nmeas)
  character(len=132), dimension(:), pointer ::source => null()       ! /eqconstraint/xpts/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  real(EUITM_R8),pointer  :: weight(:) => null()     ! /eqconstraint/xpts/weight - weight given to the measurement (>= 0); -1 if exact data; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /eqconstraint/xpts/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: calculated(:) => null()     ! /eqconstraint/xpts/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  real(EUITM_R8),pointer  :: chi2(:) => null()     ! /eqconstraint/xpts/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype
  
type type_isoflux_mask  !    
  type (type_rz1D_mask) :: position  ! /eqconstraint/isoflux/position - Position of the points at which the flux is considered the same; Time-dependent; Vector (nmeas)
  integer  :: source=0       ! /eqconstraint/isoflux/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  integer  :: weight=0       ! /eqconstraint/isoflux/weight - weight given to the measurement (>= 0); -1 if exact data; Time-dependent; Vector (nmeas)
  integer  :: sigma=0       ! /eqconstraint/isoflux/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  integer  :: calculated=0       ! /eqconstraint/isoflux/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  integer  :: chi2=0       ! /eqconstraint/isoflux/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype
  
type type_magnet_iron_mask  !    
  type (type_eqmes1D_mask) :: mr  ! /eqconstraint/magnet_iron/mr - Magnetisation along the R axis [T];
  type (type_eqmes1D_mask) :: mz  ! /eqconstraint/magnet_iron/mz - Magnetisation along the Z axis [T];
endtype
  
type type_q_mask  !    
  integer  :: qvalue=0       ! /eqconstraint/q/qvalue - Safety factor values; Time-dependent; Vector (nmeas)
  type (type_rz1D_mask) :: position  ! /eqconstraint/q/position - Major radius of the given safety factor values [m]; Time-dependent; Vector (nmeas)
  integer  :: source=0       ! /eqconstraint/q/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  integer  :: exact=0       ! /eqconstraint/q/exact - 1 means exact data, is not fitted; 0 means the equilibrium code does a least square fit; scalar inte
  integer  :: weight=0       ! /eqconstraint/q/weight - weight given to the measurement (>= 0); Time-dependent; Vector (nmeas)
  integer  :: sigma=0       ! /eqconstraint/q/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  integer  :: calculated=0       ! /eqconstraint/q/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  integer  :: chi2=0       ! /eqconstraint/q/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype
  
type type_xpts_mask  !    
  type (type_rz1D_mask) :: position  ! /eqconstraint/xpts/position - Position of the X-point(s); Time-dependent; Vector (nmeas)
  integer  :: source=0       ! /eqconstraint/xpts/source - Description or path to the source signal (diagnostic or genprof, from which to read all info on the 
  integer  :: weight=0       ! /eqconstraint/xpts/weight - weight given to the measurement (>= 0); -1 if exact data; Time-dependent; Vector (nmeas)
  integer  :: sigma=0       ! /eqconstraint/xpts/sigma - standard deviation of the measurement; Time-dependent; Vector (nmeas)
  integer  :: calculated=0       ! /eqconstraint/xpts/calculated - Signal as recalculated by the equilibrium code; Time-dependent; Vector (nmeas)
  integer  :: chi2=0       ! /eqconstraint/xpts/chi2 - chi^2 of (calculated-measured); Time-dependent; Vector (nmeas)
endtype

  
type type_eqconstraint  !    
  type (type_eqmes1D) :: bpol  ! /eqconstraint/bpol - poloidal pickup coils [T]
  type (type_eqmes0D) :: bvac_r  ! /eqconstraint/bvac_r - Vacuum field times radius in the toroidal field magnet [T.m];
  type (type_eqmes0D) :: diamagflux  ! /eqconstraint/diamagflux - Diamagnetic flux [Wb], defined as integral (Btor - Btor,vac) dS where the integral is over the poloi
  type (type_eqmes1D) :: faraday  ! /eqconstraint/faraday - Faraday rotation angles [rad]
  type (type_eqmes1D) :: flux  ! /eqconstraint/flux - Poloidal flux loops [Wb]
  type (type_eqmes0D) :: i_plasma  ! /eqconstraint/i_plasma - Plasma current [A];
  type (type_isoflux) :: isoflux  ! /eqconstraint/isoflux - Point series at which the flux is considered the same
  type (type_eqmes1D) :: jsurf  ! /eqconstraint/jsurf - Average of current density on the flux surface [A/m^2]
  type (type_magnet_iron) :: magnet_iron  ! /eqconstraint/magnet_iron - Magnetisation in iron segments [T]
  type (type_eqmes1D) :: mse  ! /eqconstraint/mse - MSE angles [rad]
  type (type_eqmes1D) :: ne  ! /eqconstraint/ne - Electron density [m^-3 for local measurement, m^-2 if line integrated]
  type (type_eqmes1D) :: pfcurrent  ! /eqconstraint/pfcurrent - Current in poloidal field coils [A]
  type (type_eqmes1D) :: pressure  ! /eqconstraint/pressure - Total pressure [Pa]
  type (type_q) :: q  ! /eqconstraint/q - Safety factor
  type (type_xpts) :: xpts  ! /eqconstraint/xpts - Position of the X-point(s)
endtype
  
type type_eqconstraint_mask  !    
  type (type_eqmes1D_mask) :: bpol  ! /eqconstraint/bpol - poloidal pickup coils [T]
  type (type_eqmes0D_mask) :: bvac_r  ! /eqconstraint/bvac_r - Vacuum field times radius in the toroidal field magnet [T.m];
  type (type_eqmes0D_mask) :: diamagflux  ! /eqconstraint/diamagflux - Diamagnetic flux [Wb], defined as integral (Btor - Btor,vac) dS where the integral is over the poloi
  type (type_eqmes1D_mask) :: faraday  ! /eqconstraint/faraday - Faraday rotation angles [rad]
  type (type_eqmes1D_mask) :: flux  ! /eqconstraint/flux - Poloidal flux loops [Wb]
  type (type_eqmes0D_mask) :: i_plasma  ! /eqconstraint/i_plasma - Plasma current [A];
  type (type_isoflux_mask) :: isoflux  ! /eqconstraint/isoflux - Point series at which the flux is considered the same
  type (type_eqmes1D_mask) :: jsurf  ! /eqconstraint/jsurf - Average of current density on the flux surface [A/m^2]
  type (type_magnet_iron_mask) :: magnet_iron  ! /eqconstraint/magnet_iron - Magnetisation in iron segments [T]
  type (type_eqmes1D_mask) :: mse  ! /eqconstraint/mse - MSE angles [rad]
  type (type_eqmes1D_mask) :: ne  ! /eqconstraint/ne - Electron density [m^-3 for local measurement, m^-2 if line integrated]
  type (type_eqmes1D_mask) :: pfcurrent  ! /eqconstraint/pfcurrent - Current in poloidal field coils [A]
  type (type_eqmes1D_mask) :: pressure  ! /eqconstraint/pressure - Total pressure [Pa]
  type (type_q_mask) :: q  ! /eqconstraint/q - Safety factor
  type (type_xpts_mask) :: xpts  ! /eqconstraint/xpts - Position of the X-point(s)
endtype

! ***********  Include flush.xsd
  
type type_flush  !    
  type (type_datainfo) :: datainfo  ! /flush/datainfo - 
  type (type_rz1D) :: position  ! /flush/position - Major radius and altitude of the FLUSH grid [m]; Time-dependent; Vectors resp. (nR) and (nZ)
  real(EUITM_R8),pointer  :: coef(:,:) => null()     ! /flush/coef - Coefficients of the fit; Time-dependent; Matrix 2D (nR,nZ)
  type (type_codeparam) :: codeparam  ! /flush/codeparam - 
endtype
  
type type_flush_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /flush/datainfo - 
  type (type_rz1D_mask) :: position  ! /flush/position - Major radius and altitude of the FLUSH grid [m]; Time-dependent; Vectors resp. (nR) and (nZ)
  integer  :: coef=0       ! /flush/coef - Coefficients of the fit; Time-dependent; Matrix 2D (nR,nZ)
  type (type_codeparam_mask) :: codeparam  ! /flush/codeparam - 
endtype

! ***********  Include eqgeometry.xsd
  
type type_eqgeometry  !    
  character(len=132), dimension(:), pointer ::source => null()       ! /eqgeometry/source - Comment describing the origin of the eqgeometry data; String
  integer  :: boundarytype=-999999999       ! /eqgeometry/boundarytype - 0 (limiter) or 1 (separatrix); Integer; Time-dependent
  type (type_rz1Dexp),pointer :: boundary(:) => null()  ! /eqgeometry/boundary(i) - RZ description of the plasma boundary; This is formally declared as an array of structure to allow f
  type (type_rz0D) :: geom_axis  ! /eqgeometry/geom_axis - RZ position of the geometric axis (defined as (Rmin+Rmax) / 2 and (Zmin+Zmax) / 2 of the boundary) [
  real(EUITM_R8)  :: a_minor=-9.0E40_EUITM_R8       ! /eqgeometry/a_minor - Minor radius of the plasma boundary [m]; Time-dependent; Scalar
  real(EUITM_R8)  :: elongation=-9.0E40_EUITM_R8       ! /eqgeometry/elongation - Elongation of the plasma boundary; Time-dependent; Scalar
  real(EUITM_R8)  :: elong_upper=-9.0E40_EUITM_R8       ! /eqgeometry/elong_upper - Elongation upper of the plasma boundary; Time-dependent; Scalar
  real(EUITM_R8)  :: elong_lower=-9.0E40_EUITM_R8       ! /eqgeometry/elong_lower - Elongation lower of the plasma boundary; Time-dependent; Scalar
  real(EUITM_R8)  :: tria_upper=-9.0E40_EUITM_R8       ! /eqgeometry/tria_upper - Upper triangularity of the plasma boundary; Time-dependent; Scalar
  real(EUITM_R8)  :: tria_lower=-9.0E40_EUITM_R8       ! /eqgeometry/tria_lower - Lower triangularity of the plasma boundary; Time-dependent; Scalar
  type (type_rz1Dexp),pointer :: xpts(:) => null()  ! /eqgeometry/xpts(i) - Position of the Xpoints, first is the active xpoint if diverted [m]; This is formally declared as an
  type (type_rz0D) :: left_low_st  ! /eqgeometry/left_low_st - Position of the lower left strike point [m]; Time-dependent; Scalar
  type (type_rz0D) :: right_low_st  ! /eqgeometry/right_low_st - Position of the lower right strike point [m]; Time-dependent; Scalar
  type (type_rz0D) :: left_up_st  ! /eqgeometry/left_up_st - Position of the upper left strike point [m]; Time-dependent; Scalar
  type (type_rz0D) :: right_up_st  ! /eqgeometry/right_up_st - Position of the upper right strike point [m]; Time-dependent; Scalar
  type (type_rz0D) :: active_limit  ! /eqgeometry/active_limit - Position of the active limiter point (point of the plasma boundary in contact with the limiter) [m];
  real(EUITM_R8)  :: ang_lcms_upo=-9.0E40_EUITM_R8       ! /eqgeometry/ang_lcms_upo - Angle at the LMCS X point upper outer; Time-dependent; Scalar
  real(EUITM_R8)  :: ang_lcms_upi=-9.0E40_EUITM_R8       ! /eqgeometry/ang_lcms_upi - Angle at the LMCS X point upper inner; Time-dependent; Scalar
  real(EUITM_R8)  :: ang_lcms_lwo=-9.0E40_EUITM_R8       ! /eqgeometry/ang_lcms_lwo - Angle at the LMCS X point lower outer; Time-dependent; Scalar 
  real(EUITM_R8)  :: ang_lcms_lwi=-9.0E40_EUITM_R8       ! /eqgeometry/ang_lcms_lwi - Angle at the LMCS X point lower inner; Time-dependent; Scalar
endtype
  
type type_eqgeometry_mask  !    
  integer  :: source=0       ! /eqgeometry/source - Comment describing the origin of the eqgeometry data; String
  integer  :: boundarytype=0       ! /eqgeometry/boundarytype - 0 (limiter) or 1 (separatrix); Integer; Time-dependent
  type (type_rz1Dexp_mask),pointer :: boundary(:) => null()  ! /eqgeometry/boundary(i) - RZ description of the plasma boundary; This is formally declared as an array of structure to allow f
  type (type_rz0D_mask) :: geom_axis  ! /eqgeometry/geom_axis - RZ position of the geometric axis (defined as (Rmin+Rmax) / 2 and (Zmin+Zmax) / 2 of the boundary) [
  integer  :: a_minor=0       ! /eqgeometry/a_minor - Minor radius of the plasma boundary [m]; Time-dependent; Scalar
  integer  :: elongation=0       ! /eqgeometry/elongation - Elongation of the plasma boundary; Time-dependent; Scalar
  integer  :: elong_upper=0       ! /eqgeometry/elong_upper - Elongation upper of the plasma boundary; Time-dependent; Scalar
  integer  :: elong_lower=0       ! /eqgeometry/elong_lower - Elongation lower of the plasma boundary; Time-dependent; Scalar
  integer  :: tria_upper=0       ! /eqgeometry/tria_upper - Upper triangularity of the plasma boundary; Time-dependent; Scalar
  integer  :: tria_lower=0       ! /eqgeometry/tria_lower - Lower triangularity of the plasma boundary; Time-dependent; Scalar
  type (type_rz1Dexp_mask),pointer :: xpts(:) => null()  ! /eqgeometry/xpts(i) - Position of the Xpoints, first is the active xpoint if diverted [m]; This is formally declared as an
  type (type_rz0D_mask) :: left_low_st  ! /eqgeometry/left_low_st - Position of the lower left strike point [m]; Time-dependent; Scalar
  type (type_rz0D_mask) :: right_low_st  ! /eqgeometry/right_low_st - Position of the lower right strike point [m]; Time-dependent; Scalar
  type (type_rz0D_mask) :: left_up_st  ! /eqgeometry/left_up_st - Position of the upper left strike point [m]; Time-dependent; Scalar
  type (type_rz0D_mask) :: right_up_st  ! /eqgeometry/right_up_st - Position of the upper right strike point [m]; Time-dependent; Scalar
  type (type_rz0D_mask) :: active_limit  ! /eqgeometry/active_limit - Position of the active limiter point (point of the plasma boundary in contact with the limiter) [m];
  integer  :: ang_lcms_upo=0       ! /eqgeometry/ang_lcms_upo - Angle at the LMCS X point upper outer; Time-dependent; Scalar
  integer  :: ang_lcms_upi=0       ! /eqgeometry/ang_lcms_upi - Angle at the LMCS X point upper inner; Time-dependent; Scalar
  integer  :: ang_lcms_lwo=0       ! /eqgeometry/ang_lcms_lwo - Angle at the LMCS X point lower outer; Time-dependent; Scalar 
  integer  :: ang_lcms_lwi=0       ! /eqgeometry/ang_lcms_lwi - Angle at the LMCS X point lower inner; Time-dependent; Scalar
endtype

! ***********  Include eqglobal.xsd
  
type type_mag_axis  !    
  type (type_rz0D) :: position  ! /global_param/mag_axis/position - Position of the magnetic axis [m]; Time-dependent; Scalar; 
  real(EUITM_R8)  :: bphi=-9.0E40_EUITM_R8       ! /global_param/mag_axis/bphi - Total toroidal magnetic field at the magnetic axis [T]; Time-dependent; Scalar
  real(EUITM_R8)  :: q=-9.0E40_EUITM_R8       ! /global_param/mag_axis/q - q at the magnetic axis; Time-dependent; Scalar
endtype
  
type type_mag_axis_mask  !    
  type (type_rz0D_mask) :: position  ! /global_param/mag_axis/position - Position of the magnetic axis [m]; Time-dependent; Scalar; 
  integer  :: bphi=0       ! /global_param/mag_axis/bphi - Total toroidal magnetic field at the magnetic axis [T]; Time-dependent; Scalar
  integer  :: q=0       ! /global_param/mag_axis/q - q at the magnetic axis; Time-dependent; Scalar
endtype

  
type type_global_param  !    
  real(EUITM_R8)  :: beta_pol=-9.0E40_EUITM_R8       ! /global_param/beta_pol - poloidal beta; Time-dependent; Scalar
  real(EUITM_R8)  :: beta_tor=-9.0E40_EUITM_R8       ! /global_param/beta_tor - toroidal beta; Time-dependent; Scalar
  real(EUITM_R8)  :: beta_normal=-9.0E40_EUITM_R8       ! /global_param/beta_normal - normalised beta; Time-dependent; Scalar
  real(EUITM_R8)  :: i_plasma=-9.0E40_EUITM_R8       ! /global_param/i_plasma - total toroidal plasma current [A]; Positive sign means anti-clockwise when viewed from above. Time-d
  real(EUITM_R8)  :: li=-9.0E40_EUITM_R8       ! /global_param/li - internal inductance; Time-dependent; Scalar
  real(EUITM_R8)  :: volume=-9.0E40_EUITM_R8       ! /global_param/volume - total plasma volume [m^3]; Time-dependent; Scalar
  real(EUITM_R8)  :: area=-9.0E40_EUITM_R8       ! /global_param/area - area poloidal cross section [m^2]; Time-dependent; Scalar
  real(EUITM_R8)  :: psi_ax=-9.0E40_EUITM_R8       ! /global_param/psi_ax - poloidal flux at the magnetic axis [Wb]; Time-dependent; Scalar
  real(EUITM_R8)  :: psi_bound=-9.0E40_EUITM_R8       ! /global_param/psi_bound - poloidal flux at the selected plasma boundary (separatrix for a free boundary code; fixed boundary f
  type (type_mag_axis) :: mag_axis  ! /global_param/mag_axis - Magnetic axis values
  real(EUITM_R8)  :: q_95=-9.0E40_EUITM_R8       ! /global_param/q_95 - q at the 95% poloidal flux surface; Time-dependent; Scalar
  real(EUITM_R8)  :: q_min=-9.0E40_EUITM_R8       ! /global_param/q_min - minimum q value in the plasma; Time-dependent; Scalar
  type (type_b0r0) :: toroid_field  ! /global_param/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to be used by the 
  real(EUITM_R8)  :: w_mhd=-9.0E40_EUITM_R8       ! /global_param/w_mhd - Plasma energy content = 3/2 * int(p,dV) with p being the total pressure (thermal + fast particles) [
  real(EUITM_R8)  :: gamma=-9.0E40_EUITM_R8       ! /global_param/gamma - Adiabatic index. Time-dependent; Scalar
endtype
  
type type_global_param_mask  !    
  integer  :: beta_pol=0       ! /global_param/beta_pol - poloidal beta; Time-dependent; Scalar
  integer  :: beta_tor=0       ! /global_param/beta_tor - toroidal beta; Time-dependent; Scalar
  integer  :: beta_normal=0       ! /global_param/beta_normal - normalised beta; Time-dependent; Scalar
  integer  :: i_plasma=0       ! /global_param/i_plasma - total toroidal plasma current [A]; Positive sign means anti-clockwise when viewed from above. Time-d
  integer  :: li=0       ! /global_param/li - internal inductance; Time-dependent; Scalar
  integer  :: volume=0       ! /global_param/volume - total plasma volume [m^3]; Time-dependent; Scalar
  integer  :: area=0       ! /global_param/area - area poloidal cross section [m^2]; Time-dependent; Scalar
  integer  :: psi_ax=0       ! /global_param/psi_ax - poloidal flux at the magnetic axis [Wb]; Time-dependent; Scalar
  integer  :: psi_bound=0       ! /global_param/psi_bound - poloidal flux at the selected plasma boundary (separatrix for a free boundary code; fixed boundary f
  type (type_mag_axis_mask) :: mag_axis  ! /global_param/mag_axis - Magnetic axis values
  integer  :: q_95=0       ! /global_param/q_95 - q at the 95% poloidal flux surface; Time-dependent; Scalar
  integer  :: q_min=0       ! /global_param/q_min - minimum q value in the plasma; Time-dependent; Scalar
  type (type_b0r0_mask) :: toroid_field  ! /global_param/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to be used by the 
  integer  :: w_mhd=0       ! /global_param/w_mhd - Plasma energy content = 3/2 * int(p,dV) with p being the total pressure (thermal + fast particles) [
  integer  :: gamma=0       ! /global_param/gamma - Adiabatic index. Time-dependent; Scalar
endtype

! ***********  Include eqprofiles.xsd
  
type type_profiles_1d  !    
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /profiles_1d/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /profiles_1d/phi - toroidal flux [Wb]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: pressure(:) => null()     ! /profiles_1d/pressure - pressure profile as a function of the poloidal flux [Pa]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: F_dia(:) => null()     ! /profiles_1d/F_dia - diamagnetic profile (R B_phi) [T m]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: pprime(:) => null()     ! /profiles_1d/pprime - psi derivative of the pressure profile [Pa/Wb]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: ffprime(:) => null()     ! /profiles_1d/ffprime - psi derivative of F_dia multiplied with F_dia [T^2 m^2/Wb]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: jphi(:) => null()     ! /profiles_1d/jphi - flux surface averaged toroidal current density = average(jphi/R) / average(1/R) [A/m^2]; Time-depend
  real(EUITM_R8),pointer  :: jparallel(:) => null()     ! /profiles_1d/jparallel - flux surface averaged parallel current density = average(j.B) / B0, where B0 = equilibrium/global_pa
  real(EUITM_R8),pointer  :: q(:) => null()     ! /profiles_1d/q - Safety factor = dphi/dpsi [-]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: shear(:) => null()     ! /profiles_1d/shear - Magnetic shear, defined as rho_tor/q*dq/drho_tor [-]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: r_inboard(:) => null()     ! /profiles_1d/r_inboard - radial coordinate (major radius) at the height and on the left of the magnetic axis [m]; Time-depend
  real(EUITM_R8),pointer  :: r_outboard(:) => null()     ! /profiles_1d/r_outboard - radial coordinate (major radius) at the height and on the right of the magnetic axis [m]; Time-depen
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /profiles_1d/rho_tor - Toroidal flux coordinate [m], to be used by the ETS and in many CPOs (coreprof, ...). Defined as sqr
  real(EUITM_R8),pointer  :: dpsidrho_tor(:) => null()     ! /profiles_1d/dpsidrho_tor - dpsi/drho_tor [Wb/m]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: rho_vol(:) => null()     ! /profiles_1d/rho_vol - Normalised radial coordinate related to the plasma volume. Defined as sqrt(volume / volume[LCFS]). T
  real(EUITM_R8),pointer  :: beta_pol(:) => null()     ! /profiles_1d/beta_pol - poloidal beta (inside the magnetic surface); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: li(:) => null()     ! /profiles_1d/li - internal inductance (inside the magnetic surface); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: elongation(:) => null()     ! /profiles_1d/elongation - Elongation; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: tria_upper(:) => null()     ! /profiles_1d/tria_upper - Upper triangularity profile; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: tria_lower(:) => null()     ! /profiles_1d/tria_lower - Lower triangularity profile; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /profiles_1d/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: vprime(:) => null()     ! /profiles_1d/vprime - Radial derivative of the volume enclosed in the flux surface with respect to psi, i.e. dV/dpsi [m^3/
  real(EUITM_R8),pointer  :: dvdrho(:) => null()     ! /profiles_1d/dvdrho - Radial derivative of the volume enclosed in the flux surface with respect to rho_tor, i.e. dV/drho_t
  real(EUITM_R8),pointer  :: area(:) => null()     ! /profiles_1d/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: aprime(:) => null()     ! /profiles_1d/aprime - Radial derivative of the cross-sectional area of the flux surface with respect to psi, i.e. darea/dp
  real(EUITM_R8),pointer  :: surface(:) => null()     ! /profiles_1d/surface - Surface area of the flux surface [m^2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: ftrap(:) => null()     ! /profiles_1d/ftrap - Trapped particle fraction; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm1(:) => null()     ! /profiles_1d/gm1 - average(1/R^2); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm2(:) => null()     ! /profiles_1d/gm2 - average(grad_rho^2/R^2); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm3(:) => null()     ! /profiles_1d/gm3 - average(grad_rho^2); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm4(:) => null()     ! /profiles_1d/gm4 - average(1/B^2) [T^-2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm5(:) => null()     ! /profiles_1d/gm5 - average(B^2) [T^2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm6(:) => null()     ! /profiles_1d/gm6 - average(grad_rho^2/B^2)  [T^-2]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm7(:) => null()     ! /profiles_1d/gm7 - average(grad_rho); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm8(:) => null()     ! /profiles_1d/gm8 - average(R); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: gm9(:) => null()     ! /profiles_1d/gm9 - average(1/R); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: b_av(:) => null()     ! /profiles_1d/b_av - average(B); Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: b_min(:) => null()     ! /profiles_1d/b_min - minimum(B) on the flux surface; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: b_max(:) => null()     ! /profiles_1d/b_max - maximum(B) on the flux surface; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: omega(:) => null()     ! /profiles_1d/omega - Toroidal rotation angular frequency (assumed constant on the flux surface)  [rad/s]; Time-dependent;
  real(EUITM_R8),pointer  :: omegaprime(:) => null()     ! /profiles_1d/omegaprime - Psi derivative of the toroidal rotation angular frequency (assumed constant on the flux surface)  [r
  real(EUITM_R8),pointer  :: mach_a(:) => null()     ! /profiles_1d/mach_a - Alfvenic Mach number; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: phi_flow(:) => null()     ! /profiles_1d/phi_flow - Poloidal flow function phi_flow = rho*v_pol/B_pol[kg/(V.s^2)] where rho is mass density; Time-depend
  real(EUITM_R8),pointer  :: s_flow(:) => null()     ! /profiles_1d/s_flow - Flux function in the closure equation p=S(psi).rho^(gamma); Entropy (gamma=5/3) or Temperature (gamm
  real(EUITM_R8),pointer  :: h_flow(:) => null()     ! /profiles_1d/h_flow - flow function h_flow = gamma/(gamma-1)*s_flow*rho^(gamma-1) + 0.5*(phi_flow*B/rho)^2 - 0.5*(R*omega)
  real(EUITM_R8),pointer  :: rho_mass(:) => null()     ! /profiles_1d/rho_mass - Mass density [kg/m^3]; Time-dependent; Vector (npsi)
endtype
  
type type_profiles_1d_mask  !    
  integer  :: psi=0       ! /profiles_1d/psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent; Vector (npsi)
  integer  :: phi=0       ! /profiles_1d/phi - toroidal flux [Wb]; Time-dependent; Vector (npsi)
  integer  :: pressure=0       ! /profiles_1d/pressure - pressure profile as a function of the poloidal flux [Pa]; Time-dependent; Vector (npsi)
  integer  :: F_dia=0       ! /profiles_1d/F_dia - diamagnetic profile (R B_phi) [T m]; Time-dependent; Vector (npsi)
  integer  :: pprime=0       ! /profiles_1d/pprime - psi derivative of the pressure profile [Pa/Wb]; Time-dependent; Vector (npsi)
  integer  :: ffprime=0       ! /profiles_1d/ffprime - psi derivative of F_dia multiplied with F_dia [T^2 m^2/Wb]; Time-dependent; Vector (npsi)
  integer  :: jphi=0       ! /profiles_1d/jphi - flux surface averaged toroidal current density = average(jphi/R) / average(1/R) [A/m^2]; Time-depend
  integer  :: jparallel=0       ! /profiles_1d/jparallel - flux surface averaged parallel current density = average(j.B) / B0, where B0 = equilibrium/global_pa
  integer  :: q=0       ! /profiles_1d/q - Safety factor = dphi/dpsi [-]; Time-dependent; Vector (npsi)
  integer  :: shear=0       ! /profiles_1d/shear - Magnetic shear, defined as rho_tor/q*dq/drho_tor [-]; Time-dependent; Vector (npsi)
  integer  :: r_inboard=0       ! /profiles_1d/r_inboard - radial coordinate (major radius) at the height and on the left of the magnetic axis [m]; Time-depend
  integer  :: r_outboard=0       ! /profiles_1d/r_outboard - radial coordinate (major radius) at the height and on the right of the magnetic axis [m]; Time-depen
  integer  :: rho_tor=0       ! /profiles_1d/rho_tor - Toroidal flux coordinate [m], to be used by the ETS and in many CPOs (coreprof, ...). Defined as sqr
  integer  :: dpsidrho_tor=0       ! /profiles_1d/dpsidrho_tor - dpsi/drho_tor [Wb/m]; Time-dependent; Vector (npsi)
  integer  :: rho_vol=0       ! /profiles_1d/rho_vol - Normalised radial coordinate related to the plasma volume. Defined as sqrt(volume / volume[LCFS]). T
  integer  :: beta_pol=0       ! /profiles_1d/beta_pol - poloidal beta (inside the magnetic surface); Time-dependent; Vector (npsi)
  integer  :: li=0       ! /profiles_1d/li - internal inductance (inside the magnetic surface); Time-dependent; Vector (npsi)
  integer  :: elongation=0       ! /profiles_1d/elongation - Elongation; Time-dependent; Vector (npsi)
  integer  :: tria_upper=0       ! /profiles_1d/tria_upper - Upper triangularity profile; Time-dependent; Vector (npsi)
  integer  :: tria_lower=0       ! /profiles_1d/tria_lower - Lower triangularity profile; Time-dependent; Vector (npsi)
  integer  :: volume=0       ! /profiles_1d/volume - Volume enclosed in the flux surface [m^3]; Time-dependent; Vector (npsi)
  integer  :: vprime=0       ! /profiles_1d/vprime - Radial derivative of the volume enclosed in the flux surface with respect to psi, i.e. dV/dpsi [m^3/
  integer  :: dvdrho=0       ! /profiles_1d/dvdrho - Radial derivative of the volume enclosed in the flux surface with respect to rho_tor, i.e. dV/drho_t
  integer  :: area=0       ! /profiles_1d/area - Cross-sectional area of the flux surface [m^2]; Time-dependent; Vector (npsi)
  integer  :: aprime=0       ! /profiles_1d/aprime - Radial derivative of the cross-sectional area of the flux surface with respect to psi, i.e. darea/dp
  integer  :: surface=0       ! /profiles_1d/surface - Surface area of the flux surface [m^2]; Time-dependent; Vector (npsi)
  integer  :: ftrap=0       ! /profiles_1d/ftrap - Trapped particle fraction; Time-dependent; Vector (npsi)
  integer  :: gm1=0       ! /profiles_1d/gm1 - average(1/R^2); Time-dependent; Vector (npsi)
  integer  :: gm2=0       ! /profiles_1d/gm2 - average(grad_rho^2/R^2); Time-dependent; Vector (npsi)
  integer  :: gm3=0       ! /profiles_1d/gm3 - average(grad_rho^2); Time-dependent; Vector (npsi)
  integer  :: gm4=0       ! /profiles_1d/gm4 - average(1/B^2) [T^-2]; Time-dependent; Vector (npsi)
  integer  :: gm5=0       ! /profiles_1d/gm5 - average(B^2) [T^2]; Time-dependent; Vector (npsi)
  integer  :: gm6=0       ! /profiles_1d/gm6 - average(grad_rho^2/B^2)  [T^-2]; Time-dependent; Vector (npsi)
  integer  :: gm7=0       ! /profiles_1d/gm7 - average(grad_rho); Time-dependent; Vector (npsi)
  integer  :: gm8=0       ! /profiles_1d/gm8 - average(R); Time-dependent; Vector (npsi)
  integer  :: gm9=0       ! /profiles_1d/gm9 - average(1/R); Time-dependent; Vector (npsi)
  integer  :: b_av=0       ! /profiles_1d/b_av - average(B); Time-dependent; Vector (npsi)
  integer  :: b_min=0       ! /profiles_1d/b_min - minimum(B) on the flux surface; Time-dependent; Vector (npsi)
  integer  :: b_max=0       ! /profiles_1d/b_max - maximum(B) on the flux surface; Time-dependent; Vector (npsi)
  integer  :: omega=0       ! /profiles_1d/omega - Toroidal rotation angular frequency (assumed constant on the flux surface)  [rad/s]; Time-dependent;
  integer  :: omegaprime=0       ! /profiles_1d/omegaprime - Psi derivative of the toroidal rotation angular frequency (assumed constant on the flux surface)  [r
  integer  :: mach_a=0       ! /profiles_1d/mach_a - Alfvenic Mach number; Time-dependent; Vector (npsi)
  integer  :: phi_flow=0       ! /profiles_1d/phi_flow - Poloidal flow function phi_flow = rho*v_pol/B_pol[kg/(V.s^2)] where rho is mass density; Time-depend
  integer  :: s_flow=0       ! /profiles_1d/s_flow - Flux function in the closure equation p=S(psi).rho^(gamma); Entropy (gamma=5/3) or Temperature (gamm
  integer  :: h_flow=0       ! /profiles_1d/h_flow - flow function h_flow = gamma/(gamma-1)*s_flow*rho^(gamma-1) + 0.5*(phi_flow*B/rho)^2 - 0.5*(R*omega)
  integer  :: rho_mass=0       ! /profiles_1d/rho_mass - Mass density [kg/m^3]; Time-dependent; Vector (npsi)
endtype

! ***********  Include equilibrium.xsd
  
type type_equilibrium_profiles2d_grid  !    definition of the 2D grid
  real(EUITM_R8),pointer  :: dim1(:) => null()     ! /dim1 - First dimension values; Time-dependent; Vector (ndim1) 
  real(EUITM_R8),pointer  :: dim2(:) => null()     ! /dim2 - Second dimension values; Time-dependent; Vector (ndim2) 
  integer,pointer  :: connect(:,:) => null()     ! /connect - In case of a finite elemnt representation, lists the points (3 for triangles, 4 for quadrangles) whi
endtype

  
type type_equilibrium_profiles_2d  !    output profiles in the poloidal plane
  character(len=132), dimension(:), pointer ::grid_type => null()       ! /grid_type - Selection of one of a set of grid types. 1-rectangular (R,Z) grid, in this case the position arrays 
  type (type_equilibrium_profiles2d_grid) :: grid  ! /grid - definition of the 2D grid
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /r - values of the major radius on the grid [m]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - values of the altitude on the grid [m]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: psi(:,:) => null()     ! /psi - values of the poloidal flux at the grid in the poloidal plane [Wb]; Time-dependent; Matrix (ndim1, n
  real(EUITM_R8),pointer  :: theta(:,:) => null()     ! /theta - values of the poloidal angle on the grid [rad]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: phi(:,:) => null()     ! /phi - Toroidal flux [Wb]. Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: jphi(:,:) => null()     ! /jphi - toroidal plasma current density [A m-2]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: jpar(:,:) => null()     ! /jpar - parallel (to magnetic field) plasma current density [A m-2]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: br(:,:) => null()     ! /br - R component of the poloidal magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1,
  real(EUITM_R8),pointer  :: bz(:,:) => null()     ! /bz - Z component of the poloidal magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1,
  real(EUITM_R8),pointer  :: bphi(:,:) => null()     ! /bphi - toroidal component of the magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1, n
  real(EUITM_R8),pointer  :: vphi(:,:) => null()     ! /vphi - toroidal flow velocity [m/s]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: vtheta(:,:) => null()     ! /vtheta - Poloidal flow velocity [m/s]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: rho_mass(:,:) => null()     ! /rho_mass - Mass density [kg/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: pressure(:,:) => null()     ! /pressure - Pressure [Pa]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: temperature(:,:) => null()     ! /temperature - Temperature [eV]; Time-dependent; Matrix (ndim1, ndim2)
endtype
  
type type_equilibrium_profiles2d_grid_mask  !    definition of the 2D grid
  integer  :: dim1=0       ! /dim1 - First dimension values; Time-dependent; Vector (ndim1) 
  integer  :: dim2=0       ! /dim2 - Second dimension values; Time-dependent; Vector (ndim2) 
  integer  :: connect=0       ! /connect - In case of a finite elemnt representation, lists the points (3 for triangles, 4 for quadrangles) whi
endtype
  
type type_equilibrium_profiles_2d_mask  !    output profiles in the poloidal plane
  integer  :: grid_type=0       ! /grid_type - Selection of one of a set of grid types. 1-rectangular (R,Z) grid, in this case the position arrays 
  type (type_equilibrium_profiles2d_grid_mask) :: grid  ! /grid - definition of the 2D grid
  integer  :: r=0       ! /r - values of the major radius on the grid [m]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: z=0       ! /z - values of the altitude on the grid [m]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: psi=0       ! /psi - values of the poloidal flux at the grid in the poloidal plane [Wb]; Time-dependent; Matrix (ndim1, n
  integer  :: theta=0       ! /theta - values of the poloidal angle on the grid [rad]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: phi=0       ! /phi - Toroidal flux [Wb]. Time-dependent; Matrix (ndim1, ndim2)
  integer  :: jphi=0       ! /jphi - toroidal plasma current density [A m-2]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: jpar=0       ! /jpar - parallel (to magnetic field) plasma current density [A m-2]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: br=0       ! /br - R component of the poloidal magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1,
  integer  :: bz=0       ! /bz - Z component of the poloidal magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1,
  integer  :: bphi=0       ! /bphi - toroidal component of the magnetic field at the specified grid [T]; Time-dependent; Matrix (ndim1, n
  integer  :: vphi=0       ! /vphi - toroidal flow velocity [m/s]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: vtheta=0       ! /vtheta - Poloidal flow velocity [m/s]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: rho_mass=0       ! /rho_mass - Mass density [kg/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: pressure=0       ! /pressure - Pressure [Pa]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: temperature=0       ! /temperature - Temperature [eV]; Time-dependent; Matrix (ndim1, ndim2)
endtype

  
type type_equilibrium  !    
  type (type_datainfo) :: datainfo  ! /equilibrium/datainfo - 
  type (type_eqconstraint) :: eqconstraint  ! /equilibrium/eqconstraint - 
  type (type_eqgeometry) :: eqgeometry  ! /equilibrium/eqgeometry - 
  type (type_flush) :: flush  ! /equilibrium/flush - 
  type (type_global_param) :: global_param  ! /equilibrium/global_param - 
  type (type_profiles_1d) :: profiles_1d  ! /equilibrium/profiles_1d - 
  type (type_equilibrium_profiles_2d),pointer :: profiles_2d(:) => null()  ! /equilibrium/profiles_2d(i) - Output profiles in the poloidal plane. Time-dependent
  type (type_coord_sys) :: coord_sys  ! /equilibrium/coord_sys - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /equilibrium/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam) :: codeparam  ! /equilibrium/codeparam - 
endtype
  
type type_equilibrium_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /equilibrium/datainfo - 
  type (type_eqconstraint_mask) :: eqconstraint  ! /equilibrium/eqconstraint - 
  type (type_eqgeometry_mask) :: eqgeometry  ! /equilibrium/eqgeometry - 
  type (type_flush_mask) :: flush  ! /equilibrium/flush - 
  type (type_global_param_mask) :: global_param  ! /equilibrium/global_param - 
  type (type_profiles_1d_mask) :: profiles_1d  ! /equilibrium/profiles_1d - 
  type (type_equilibrium_profiles_2d_mask),pointer :: profiles_2d(:) => null()  ! /equilibrium/profiles_2d(i) - Output profiles in the poloidal plane. Time-dependent
  type (type_coord_sys_mask) :: coord_sys  ! /equilibrium/coord_sys - 
  integer  :: time=0       ! /equilibrium/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam_mask) :: codeparam  ! /equilibrium/codeparam - 
endtype

! ***********  Include fusiondiag.xsd
  
type type_diag_func  !    
  character(len=132), dimension(:), pointer ::description => null()       ! /diag_func/description - Short description of the detector with reference to the number of cells (ncells).
  real(EUITM_R8),pointer  :: transf_mat(:,:) => null()     ! /diag_func/transf_mat - Transfer matrix of the detector. Each l.o.s. might have a dedicated detector response function and e
endtype
  
type type_diag_func_mask  !    
  integer  :: description=0       ! /diag_func/description - Short description of the detector with reference to the number of cells (ncells).
  integer  :: transf_mat=0       ! /diag_func/transf_mat - Transfer matrix of the detector. Each l.o.s. might have a dedicated detector response function and e
endtype

  
type type_fusiondiag_colliunit_circ  !    Detail of each collimator unit of each chord. Replicate this structure for each collimator. 
  real(EUITM_R8),pointer  :: radius(:) => null()     ! /radius - Radius of cross section; Typically dim=2 for just entry and exit of collimator; Vector (dim)
  type (type_rzphi1D) :: centre  ! /centre - Position of cross section centre; Typically dim=2 for just entry and exit of collimator; Vector (dim
endtype

  
type type_fusiondiag_colli_circ  !    Geometry of each channel of detector for circular cross section. Replicate this structure for each channel. 
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name tag for the chord.
  type (type_setup_line) :: setup_line  ! /setup_line - Geometric description of the line of sight. First pivot close to detector position and second pivot 
  type (type_fusiondiag_colliunit_circ),pointer :: colliunit(:) => null()  ! /colliunit(i) - Detail of each collimator unit of each chord. Replicate this structure for each collimator. 
endtype

  
type type_fusiondiag_colliunit_poly  !    Detail of each collimator unit of each chord. Replicate this structure for each collimator.
  real(EUITM_R8)  :: dimension=-9.0E40_EUITM_R8       ! /dimension - Number of edges of cross section.
  type (type_rzphi2D) :: nodes  ! /nodes - Coordinates of nodes defining each cross section; Typically dim=2 for just entry and exit of collima
endtype

  
type type_fusiondiag_colli_poly  !    Geometry of each channel of detector for polygon cross section. Replicate this structure for each channel.  
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name tag for the chord.
  type (type_setup_line) :: setup_line  ! /setup_line - Geometric description of the line of sight. First pivot close to detector position and second pivot 
  type (type_fusiondiag_colliunit_poly),pointer :: colliunit(:) => null()  ! /colliunit(i) - Detail of each collimator unit of each chord. Replicate this structure for each collimator.
endtype

  
type type_fusiondiag_voxels  !    Array of voxel structures defining the plasma region viewed from each collimator and scaling factor for effective solid angle for 
  type (type_rzphi0D) :: centre  ! /centre - Centre of voxel; used also as origin of direction to detector
  type (type_rzphi0D) :: direction  ! /direction - Second point defining the direction to detector.
  real(EUITM_R8)  :: volume=-9.0E40_EUITM_R8       ! /volume - Voxel Volume
  real(EUITM_R8)  :: solid_angle=-9.0E40_EUITM_R8       ! /solid_angle - effective solid angle (divided by 4pi) of the voxel towards detector.
endtype

  
type type_fusiondiag_colli_3d  !    Geometry of each channel of detector for arbitrary cross section. Replicate this structure for each channel.  
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name tag for the chord. String.
  type (type_fusiondiag_voxels),pointer :: voxels(:) => null()  ! /voxels(i) - Array of voxel structures defining the plasma region viewed from each collimator and scaling factor 
endtype

  
type type_fusiondiag_collimator  !    Collimator array.
  type (type_fusiondiag_colli_circ),pointer :: colli_circ(:) => null()  ! /colli_circ(i) - Geometry of each channel of detector for circular cross section. Replicate this structure for each c
  type (type_fusiondiag_colli_poly),pointer :: colli_poly(:) => null()  ! /colli_poly(i) - Geometry of each channel of detector for polygon cross section. Replicate this structure for each ch
  type (type_fusiondiag_colli_3d),pointer :: colli_3d(:) => null()  ! /colli_3d(i) - Geometry of each channel of detector for arbitrary cross section. Replicate this structure for each 
endtype

  
type type_fusiondiag_ct_chords  !    Integrated emissivity for all spatial chords. Replicate the structure for each energy bin [s^-1]. 
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name tag for each chord. Vector (nchords)
  type (type_exp0D) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved.
  type (type_exp1D) :: measure  ! /measure - Measured counts. Vector (nchords)
endtype

  
type type_fusiondiag_ct_energy  !    Integrated emissivity for each chord as function of energy like variable. Replicate this structure for each chord [s^-1].
  type (type_exp1D) :: energy  ! /energy - Energy array of detected counts spectra. Vector (nenergy)
  type (type_exp1D) :: measure  ! /measure - Measured counts spectra. Vector (nenergy)
endtype

  
type type_fusiondiag_detect_ct_energy  !    Detected integrated emissivity for each chord as function of energy like variable. Replicate this structure for each chord. This s
  type (type_exp1D) :: energy  ! /energy - Energy array of detected counts spectra. Vector (nenergy)
  type (type_exp1D) :: measure  ! /measure - Measured counts spectra. Vector (nenergy)
  type (type_diag_func) :: diag_func  ! /diag_func - Structure to provide the description on the detctor used and store the transfer matrix of the detect
endtype

  
type type_fusiondiag_counts  !    Integrated emissivity [s^-1]. 
  character(len=132), dimension(:), pointer ::units => null()       ! /units - Energy units (ev, tof - time of flight)
  type (type_fusiondiag_ct_chords),pointer :: ct_chords(:) => null()  ! /ct_chords(i) - Integrated emissivity for all spatial chords. Replicate the structure for each energy bin [s^-1]. Ti
  type (type_fusiondiag_ct_energy),pointer :: ct_energy(:) => null()  ! /ct_energy(i) - Integrated emissivity for each chord as function of energy like variable. Replicate this structure f
  type (type_fusiondiag_detect_ct_energy),pointer :: detect_ct(:) => null()  ! /detect_ct(i) - Detected integrated emissivity for each chord as function of energy like variable. Replicate this st
endtype

  
type type_fusiondiag_spec1d  !    Emissivity in given energy like variable range [counts.m^-3.s-1].
  type (type_exp0D) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved. Scalar
  type (type_exp1D) :: measure  ! /measure - reconstruction. Vector (dim)
endtype

  
type type_fusiondiag_emissivity1d  !    Reconstructed 1D emissivity [counts.m^-3.s-1]. 
  character(len=132), dimension(:), pointer ::units => null()       ! /units - Energy units (ev, tof - time of flight)
  type (type_exp1D) :: r  ! /r - horizontal grid. Vector (dim)
  type (type_exp1D) :: z  ! /z - vertical grid. Vector (dim)
  type (type_fusiondiag_spec1d),pointer :: spec1d(:) => null()  ! /spec1d(i) - Emissivity in given energy like variable range [counts.m^-3.s-1]; Time-dependent
endtype

  
type type_fusiondiag_spec2d  !    Emissivity in given energy like variable range [counts.m^-3.s-1].
  type (type_exp0D) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved. Scalar
  type (type_exp2D) :: measure  ! /measure - reconstruction. Vector (dim1,dim2)
endtype

  
type type_fusiondiag_emissivity2d  !    Reconstructed 2D emissivity [counts.m^-3.s-1]. 
  character(len=132), dimension(:), pointer ::units => null()       ! /units - Energy units (ev, tof - time of flight)
  type (type_exp2D) :: r  ! /r - radial grid. Vector (dim1,dim2)
  type (type_exp2D) :: z  ! /z - vertical grid. Vector (dim1,dim2)
  type (type_fusiondiag_spec2d),pointer :: spec2d(:) => null()  ! /spec2d(i) - Emissivity in given energy like variable range [counts.m^-3.s-1]; Time-dependent
endtype

  
type type_fusiondiag_fus_product  !    Source. Time-dependent. Structure array. Replicate this source structure to accommodate neutron and gammas.
  character(len=132), dimension(:), pointer ::product => null()       ! /product - Type of fusion product (neutron,gamma)
  character(len=132), dimension(:), pointer ::reaction => null()       ! /reaction - Type of reaction involved (e.g. DD neutron, Be-alpha,n,gamma-C)
  type (type_fusiondiag_collimator) :: collimator  ! /collimator - Collimator array.
  type (type_fusiondiag_counts) :: counts  ! /counts - Integrated emissivity [s^-1]. 
  type (type_fusiondiag_emissivity1d) :: emissivity1d  ! /emissivity1d - Reconstructed 1D emissivity [counts.m^-3.s-1]. 
  type (type_fusiondiag_emissivity2d) :: emissivity2d  ! /emissivity2d - Reconstructed 2D emissivity [counts.m^-3.s-1]. 
  type (type_codeparam) :: codeparam  ! /codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
endtype
  
type type_fusiondiag_colliunit_circ_mask  !    Detail of each collimator unit of each chord. Replicate this structure for each collimator. 
  integer  :: radius=0       ! /radius - Radius of cross section; Typically dim=2 for just entry and exit of collimator; Vector (dim)
  type (type_rzphi1D_mask) :: centre  ! /centre - Position of cross section centre; Typically dim=2 for just entry and exit of collimator; Vector (dim
endtype
  
type type_fusiondiag_colli_circ_mask  !    Geometry of each channel of detector for circular cross section. Replicate this structure for each channel. 
  integer  :: name=0       ! /name - Name tag for the chord.
  type (type_setup_line_mask) :: setup_line  ! /setup_line - Geometric description of the line of sight. First pivot close to detector position and second pivot 
  type (type_fusiondiag_colliunit_circ_mask),pointer :: colliunit(:) => null()  ! /colliunit(i) - Detail of each collimator unit of each chord. Replicate this structure for each collimator. 
endtype
  
type type_fusiondiag_colliunit_poly_mask  !    Detail of each collimator unit of each chord. Replicate this structure for each collimator.
  integer  :: dimension=0       ! /dimension - Number of edges of cross section.
  type (type_rzphi2D_mask) :: nodes  ! /nodes - Coordinates of nodes defining each cross section; Typically dim=2 for just entry and exit of collima
endtype
  
type type_fusiondiag_colli_poly_mask  !    Geometry of each channel of detector for polygon cross section. Replicate this structure for each channel.  
  integer  :: name=0       ! /name - Name tag for the chord.
  type (type_setup_line_mask) :: setup_line  ! /setup_line - Geometric description of the line of sight. First pivot close to detector position and second pivot 
  type (type_fusiondiag_colliunit_poly_mask),pointer :: colliunit(:) => null()  ! /colliunit(i) - Detail of each collimator unit of each chord. Replicate this structure for each collimator.
endtype
  
type type_fusiondiag_voxels_mask  !    Array of voxel structures defining the plasma region viewed from each collimator and scaling factor for effective solid angle for 
  type (type_rzphi0D_mask) :: centre  ! /centre - Centre of voxel; used also as origin of direction to detector
  type (type_rzphi0D_mask) :: direction  ! /direction - Second point defining the direction to detector.
  integer  :: volume=0       ! /volume - Voxel Volume
  integer  :: solid_angle=0       ! /solid_angle - effective solid angle (divided by 4pi) of the voxel towards detector.
endtype
  
type type_fusiondiag_colli_3d_mask  !    Geometry of each channel of detector for arbitrary cross section. Replicate this structure for each channel.  
  integer  :: name=0       ! /name - Name tag for the chord. String.
  type (type_fusiondiag_voxels_mask),pointer :: voxels(:) => null()  ! /voxels(i) - Array of voxel structures defining the plasma region viewed from each collimator and scaling factor 
endtype
  
type type_fusiondiag_collimator_mask  !    Collimator array.
  type (type_fusiondiag_colli_circ_mask),pointer :: colli_circ(:) => null()  ! /colli_circ(i) - Geometry of each channel of detector for circular cross section. Replicate this structure for each c
  type (type_fusiondiag_colli_poly_mask),pointer :: colli_poly(:) => null()  ! /colli_poly(i) - Geometry of each channel of detector for polygon cross section. Replicate this structure for each ch
  type (type_fusiondiag_colli_3d_mask),pointer :: colli_3d(:) => null()  ! /colli_3d(i) - Geometry of each channel of detector for arbitrary cross section. Replicate this structure for each 
endtype
  
type type_fusiondiag_ct_chords_mask  !    Integrated emissivity for all spatial chords. Replicate the structure for each energy bin [s^-1]. 
  integer  :: name=0       ! /name - Name tag for each chord. Vector (nchords)
  type (type_exp0D_mask) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved.
  type (type_exp1D_mask) :: measure  ! /measure - Measured counts. Vector (nchords)
endtype
  
type type_fusiondiag_ct_energy_mask  !    Integrated emissivity for each chord as function of energy like variable. Replicate this structure for each chord [s^-1].
  type (type_exp1D_mask) :: energy  ! /energy - Energy array of detected counts spectra. Vector (nenergy)
  type (type_exp1D_mask) :: measure  ! /measure - Measured counts spectra. Vector (nenergy)
endtype
  
type type_fusiondiag_detect_ct_energy_mask  !    Detected integrated emissivity for each chord as function of energy like variable. Replicate this structure for each chord. This s
  type (type_exp1D_mask) :: energy  ! /energy - Energy array of detected counts spectra. Vector (nenergy)
  type (type_exp1D_mask) :: measure  ! /measure - Measured counts spectra. Vector (nenergy)
  type (type_diag_func_mask) :: diag_func  ! /diag_func - Structure to provide the description on the detctor used and store the transfer matrix of the detect
endtype
  
type type_fusiondiag_counts_mask  !    Integrated emissivity [s^-1]. 
  integer  :: units=0       ! /units - Energy units (ev, tof - time of flight)
  type (type_fusiondiag_ct_chords_mask),pointer :: ct_chords(:) => null()  ! /ct_chords(i) - Integrated emissivity for all spatial chords. Replicate the structure for each energy bin [s^-1]. Ti
  type (type_fusiondiag_ct_energy_mask),pointer :: ct_energy(:) => null()  ! /ct_energy(i) - Integrated emissivity for each chord as function of energy like variable. Replicate this structure f
  type (type_fusiondiag_detect_ct_energy_mask),pointer :: detect_ct(:) => null()  ! /detect_ct(i) - Detected integrated emissivity for each chord as function of energy like variable. Replicate this st
endtype
  
type type_fusiondiag_spec1d_mask  !    Emissivity in given energy like variable range [counts.m^-3.s-1].
  type (type_exp0D_mask) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved. Scalar
  type (type_exp1D_mask) :: measure  ! /measure - reconstruction. Vector (dim)
endtype
  
type type_fusiondiag_emissivity1d_mask  !    Reconstructed 1D emissivity [counts.m^-3.s-1]. 
  integer  :: units=0       ! /units - Energy units (ev, tof - time of flight)
  type (type_exp1D_mask) :: r  ! /r - horizontal grid. Vector (dim)
  type (type_exp1D_mask) :: z  ! /z - vertical grid. Vector (dim)
  type (type_fusiondiag_spec1d_mask),pointer :: spec1d(:) => null()  ! /spec1d(i) - Emissivity in given energy like variable range [counts.m^-3.s-1]; Time-dependent
endtype
  
type type_fusiondiag_spec2d_mask  !    Emissivity in given energy like variable range [counts.m^-3.s-1].
  type (type_exp0D_mask) :: energy  ! /energy - Energy like variable span. Use mininum energy when no energy spectra is resolved. Scalar
  type (type_exp2D_mask) :: measure  ! /measure - reconstruction. Vector (dim1,dim2)
endtype
  
type type_fusiondiag_emissivity2d_mask  !    Reconstructed 2D emissivity [counts.m^-3.s-1]. 
  integer  :: units=0       ! /units - Energy units (ev, tof - time of flight)
  type (type_exp2D_mask) :: r  ! /r - radial grid. Vector (dim1,dim2)
  type (type_exp2D_mask) :: z  ! /z - vertical grid. Vector (dim1,dim2)
  type (type_fusiondiag_spec2d_mask),pointer :: spec2d(:) => null()  ! /spec2d(i) - Emissivity in given energy like variable range [counts.m^-3.s-1]; Time-dependent
endtype
  
type type_fusiondiag_fus_product_mask  !    Source. Time-dependent. Structure array. Replicate this source structure to accommodate neutron and gammas.
  integer  :: product=0       ! /product - Type of fusion product (neutron,gamma)
  integer  :: reaction=0       ! /reaction - Type of reaction involved (e.g. DD neutron, Be-alpha,n,gamma-C)
  type (type_fusiondiag_collimator_mask) :: collimator  ! /collimator - Collimator array.
  type (type_fusiondiag_counts_mask) :: counts  ! /counts - Integrated emissivity [s^-1]. 
  type (type_fusiondiag_emissivity1d_mask) :: emissivity1d  ! /emissivity1d - Reconstructed 1D emissivity [counts.m^-3.s-1]. 
  type (type_fusiondiag_emissivity2d_mask) :: emissivity2d  ! /emissivity2d - Reconstructed 2D emissivity [counts.m^-3.s-1]. 
  type (type_codeparam_mask) :: codeparam  ! /codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
endtype

  
type type_fusiondiag  !    
  type (type_datainfo) :: datainfo  ! /fusiondiag/datainfo - 
  type (type_fusiondiag_fus_product),pointer :: fus_product(:) => null()  ! /fusiondiag/fus_product(i) - Source. Time-dependent. Structure array. Replicate this source structure to accommodate neutron and 
  type (type_codeparam) :: codeparam  ! /fusiondiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /fusiondiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_fusiondiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /fusiondiag/datainfo - 
  type (type_fusiondiag_fus_product_mask),pointer :: fus_product(:) => null()  ! /fusiondiag/fus_product(i) - Source. Time-dependent. Structure array. Replicate this source structure to accommodate neutron and 
  type (type_codeparam_mask) :: codeparam  ! /fusiondiag/codeparam - 
  integer  :: time=0       ! /fusiondiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include halphadiag.xsd
  
type type_halpha_setup  !    setup for the lines of sight of the line integrated measurement
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name of the channel.  Array of strings (nlos).
  type (type_rzphi1D) :: pivot_point  ! /pivot_point - Pivot point of l.o.s. it can be either the collimator position or entry point on the vessel. Vector 
  real(EUITM_R8),pointer  :: horchordang(:) => null()     ! /horchordang - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS traject
  real(EUITM_R8),pointer  :: verchordang(:) => null()     ! /verchordang - Angle of l.o.s. with vertical axis (0 for bottom-top trajectory, Pi for top-bottom trajectory - see 
  type (type_rzphi1D) :: second_point  ! /second_point - Second point defining the l.o.s. together with the pivot_point. Vector (nlos)
  type (type_exp1D) :: solidangle  ! /solidangle - Solid angle of the detector; [sr] Vector (nlos)
endtype
  
type type_halpha_setup_mask  !    setup for the lines of sight of the line integrated measurement
  integer  :: name=0       ! /name - Name of the channel.  Array of strings (nlos).
  type (type_rzphi1D_mask) :: pivot_point  ! /pivot_point - Pivot point of l.o.s. it can be either the collimator position or entry point on the vessel. Vector 
  integer  :: horchordang=0       ! /horchordang - Angle [rad] of horizontal projection of l.o.s. with poloidal cross section (0 for HFS to LFS traject
  integer  :: verchordang=0       ! /verchordang - Angle of l.o.s. with vertical axis (0 for bottom-top trajectory, Pi for top-bottom trajectory - see 
  type (type_rzphi1D_mask) :: second_point  ! /second_point - Second point defining the l.o.s. together with the pivot_point. Vector (nlos)
  type (type_exp1D_mask) :: solidangle  ! /solidangle - Solid angle of the detector; [sr] Vector (nlos)
endtype

  
type type_halphadiag  !    
  type (type_datainfo) :: datainfo  ! /halphadiag/datainfo - 
  type (type_halpha_setup) :: setup  ! /halphadiag/setup - setup for the lines of sight of the line integrated measurement
  type (type_exp1D) :: intensity  ! /halphadiag/intensity - Measured light intensity (a.u.).  Time-dependent. Vector (nlos)
  type (type_codeparam) :: codeparam  ! /halphadiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /halphadiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_halphadiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /halphadiag/datainfo - 
  type (type_halpha_setup_mask) :: setup  ! /halphadiag/setup - setup for the lines of sight of the line integrated measurement
  type (type_exp1D_mask) :: intensity  ! /halphadiag/intensity - Measured light intensity (a.u.).  Time-dependent. Vector (nlos)
  type (type_codeparam_mask) :: codeparam  ! /halphadiag/codeparam - 
  integer  :: time=0       ! /halphadiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include heat_sources.xsd
  
type type_calorimetry_heat_source  !    Generic complex type for heat source or sink
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name of the source. String
  real(EUITM_R8)  :: temp_in=-9.0E40_EUITM_R8       ! /temp_in - Temperature of the input flow [K]; Scalar
  real(EUITM_R8)  :: temp_out=-9.0E40_EUITM_R8       ! /temp_out - Temperature of the output flow [K]; Scalar
  real(EUITM_R8)  :: press_in=-9.0E40_EUITM_R8       ! /press_in - Imput Pressure [Pa];Scalar
  real(EUITM_R8)  :: press_out=-9.0E40_EUITM_R8       ! /press_out - Output Pressure [Pa];Scalar
  real(EUITM_R8)  :: flow=-9.0E40_EUITM_R8       ! /flow - Flow of the source [kg/s]; Scalar
  real(EUITM_R8)  :: power=-9.0E40_EUITM_R8       ! /power - Power of the source [W];Scalar
endtype
  
type type_calorimetry_heat_source_mask  !    Generic complex type for heat source or sink
  integer  :: name=0       ! /name - Name of the source. String
  integer  :: temp_in=0       ! /temp_in - Temperature of the input flow [K]; Scalar
  integer  :: temp_out=0       ! /temp_out - Temperature of the output flow [K]; Scalar
  integer  :: press_in=0       ! /press_in - Imput Pressure [Pa];Scalar
  integer  :: press_out=0       ! /press_out - Output Pressure [Pa];Scalar
  integer  :: flow=0       ! /flow - Flow of the source [kg/s]; Scalar
  integer  :: power=0       ! /power - Power of the source [W];Scalar
endtype

  
type type_heat_sources  !    
  type (type_datainfo) :: datainfo  ! /heat_sources/datainfo - 
  type (type_calorimetry_heat_source),pointer :: sources(:) => null()  ! /heat_sources/sources(i) - Heat sources. Array of structure (nheat_source)
  type (type_calorimetry_heat_source),pointer :: sinks(:) => null()  ! /heat_sources/sinks(i) - Heat sinks. Array of structure (nheat_sink)
  type (type_codeparam) :: codeparam  ! /heat_sources/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /heat_sources/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_heat_sources_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /heat_sources/datainfo - 
  type (type_calorimetry_heat_source_mask),pointer :: sources(:) => null()  ! /heat_sources/sources(i) - Heat sources. Array of structure (nheat_source)
  type (type_calorimetry_heat_source_mask),pointer :: sinks(:) => null()  ! /heat_sources/sinks(i) - Heat sinks. Array of structure (nheat_sink)
  type (type_codeparam_mask) :: codeparam  ! /heat_sources/codeparam - 
  integer  :: time=0       ! /heat_sources/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include ironmodel.xsd
  
type type_permeability  !    
  real(EUITM_R8),pointer  :: b(:,:) => null()     ! /ironmodel/desc_iron/permeability/b - List of B values for description of the mur(B) dependence [T]; Matrix (nsegment,nB)
  real(EUITM_R8),pointer  :: mur(:,:) => null()     ! /ironmodel/desc_iron/permeability/mur - Relative permeability mur(B) [dimensionless]; Matrix (nsegment,nB)
endtype

  
type type_geom_iron  !    
  integer,pointer  :: npoints(:) => null()      ! /ironmodel/desc_iron/geom_iron/npoints - Number of points describing an element (irregular outline rzcoordinate); Vector (nsegment)
  type (type_rz2D) :: rzcoordinate  ! /ironmodel/desc_iron/geom_iron/rzcoordinate - Irregular outline [m]; 2D arrays (nsegment,max_npoints)
endtype
  
type type_permeability_mask  !    
  integer  :: b=0       ! /ironmodel/desc_iron/permeability/b - List of B values for description of the mur(B) dependence [T]; Matrix (nsegment,nB)
  integer  :: mur=0       ! /ironmodel/desc_iron/permeability/mur - Relative permeability mur(B) [dimensionless]; Matrix (nsegment,nB)
endtype
  
type type_geom_iron_mask  !    
  integer  :: npoints=0       ! /ironmodel/desc_iron/geom_iron/npoints - Number of points describing an element (irregular outline rzcoordinate); Vector (nsegment)
  type (type_rz2D_mask) :: rzcoordinate  ! /ironmodel/desc_iron/geom_iron/rzcoordinate - Irregular outline [m]; 2D arrays (nsegment,max_npoints)
endtype

  
type type_desc_iron  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /ironmodel/desc_iron/name - Name of circuit. Array of strings (ncircuit).
  character(len=132), dimension(:), pointer ::id => null()       ! /ironmodel/desc_iron/id - ID of circuit.  Array of strings (ncircuit).
  type (type_permeability) :: permeability  ! /ironmodel/desc_iron/permeability - Permeability model (can be different for each iron segment)
  type (type_geom_iron) :: geom_iron  ! /ironmodel/desc_iron/geom_iron - Geometry of the iron segments
endtype

  
type type_magnetise  !    
  type (type_exp1D) :: mr  ! /ironmodel/magnetise/mr - Magnetisation along the R axis [T]; Time-dependent; Vector (nsegment)
  type (type_exp1D) :: mz  ! /ironmodel/magnetise/mz - Magnetisation along the Z axis [T]; Time-dependent; Vector (nsegment)
endtype
  
type type_desc_iron_mask  !    
  integer  :: name=0       ! /ironmodel/desc_iron/name - Name of circuit. Array of strings (ncircuit).
  integer  :: id=0       ! /ironmodel/desc_iron/id - ID of circuit.  Array of strings (ncircuit).
  type (type_permeability_mask) :: permeability  ! /ironmodel/desc_iron/permeability - Permeability model (can be different for each iron segment)
  type (type_geom_iron_mask) :: geom_iron  ! /ironmodel/desc_iron/geom_iron - Geometry of the iron segments
endtype
  
type type_magnetise_mask  !    
  type (type_exp1D_mask) :: mr  ! /ironmodel/magnetise/mr - Magnetisation along the R axis [T]; Time-dependent; Vector (nsegment)
  type (type_exp1D_mask) :: mz  ! /ironmodel/magnetise/mz - Magnetisation along the Z axis [T]; Time-dependent; Vector (nsegment)
endtype

  
type type_ironmodel  !    
  type (type_datainfo) :: datainfo  ! /ironmodel/datainfo - 
  type (type_desc_iron) :: desc_iron  ! /ironmodel/desc_iron - Description of the iron segments
  type (type_magnetise) :: magnetise  ! /ironmodel/magnetise - Magnetisation M of the iron segment, assumed to be constant inside a given iron segment. Reminder : 
  type (type_codeparam) :: codeparam  ! /ironmodel/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /ironmodel/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_ironmodel_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /ironmodel/datainfo - 
  type (type_desc_iron_mask) :: desc_iron  ! /ironmodel/desc_iron - Description of the iron segments
  type (type_magnetise_mask) :: magnetise  ! /ironmodel/magnetise - Magnetisation M of the iron segment, assumed to be constant inside a given iron segment. Reminder : 
  type (type_codeparam_mask) :: codeparam  ! /ironmodel/codeparam - 
  integer  :: time=0       ! /ironmodel/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include langmuirdiag.xsd
  
type type_lang_measure  !    Structure for elementary Langmuir probe measurement
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name of the probe e.g. Jsatur1,Vfloat1). String vector
  character(len=132), dimension(:), pointer ::direction => null()       ! /direction - Direction of the probe w.r.t. magnetic field. For Mach arrangement use 'co  ' (co-field) and 'ct  ' 
  type (type_exp1D) :: area  ! /area - Effective area of probe [m^2].  Time-dependent.
  type (type_rzphi1Dexp) :: position  ! /position - Position of the measurement. Time-dependent.
  type (type_exp1D) :: measure  ! /measure - Measured quantity. Time-dependent.
endtype

  
type type_lang_derived  !    Structure for physics quantities derived from Langmuir probe measurements
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Probes in probe holder used to derive measure. String vector
  type (type_rzphi1Dexp) :: position  ! /position - Position of the measurement. Time-dependent. 
  type (type_exp1D) :: measure  ! /measure - Measured quantity.  Time-dependent.
endtype
  
type type_lang_measure_mask  !    Structure for elementary Langmuir probe measurement
  integer  :: name=0       ! /name - Name of the probe e.g. Jsatur1,Vfloat1). String vector
  integer  :: direction=0       ! /direction - Direction of the probe w.r.t. magnetic field. For Mach arrangement use 'co  ' (co-field) and 'ct  ' 
  type (type_exp1D_mask) :: area  ! /area - Effective area of probe [m^2].  Time-dependent.
  type (type_rzphi1Dexp_mask) :: position  ! /position - Position of the measurement. Time-dependent.
  type (type_exp1D_mask) :: measure  ! /measure - Measured quantity. Time-dependent.
endtype
  
type type_lang_derived_mask  !    Structure for physics quantities derived from Langmuir probe measurements
  integer  :: source=0       ! /source - Probes in probe holder used to derive measure. String vector
  type (type_rzphi1Dexp_mask) :: position  ! /position - Position of the measurement. Time-dependent. 
  type (type_exp1D_mask) :: measure  ! /measure - Measured quantity.  Time-dependent.
endtype

  
type type_langmuirdiag  !    
  type (type_datainfo) :: datainfo  ! /langmuirdiag/datainfo - 
  type (type_lang_measure) :: potential  ! /langmuirdiag/potential - Floating potential [V]. All children are vectors(npot)
  type (type_lang_measure) :: bias  ! /langmuirdiag/bias - Biasing potential [V]. All children are vectors(bias)
  type (type_lang_measure) :: jsat  ! /langmuirdiag/jsat - Ion saturation current [A/m^2]. All children are vectors(njsat)
  type (type_lang_derived) :: ne  ! /langmuirdiag/ne - Electron density [m^-3]. All children are vectors(ndensity).
  type (type_lang_derived) :: te  ! /langmuirdiag/te - Electron Temperature [eV]. All children are vectors(nte)
  type (type_lang_derived) :: machpar  ! /langmuirdiag/machpar - Parallel Mach number. All children are vectors(nmach) 
  type (type_codeparam) :: codeparam  ! /langmuirdiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /langmuirdiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_langmuirdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /langmuirdiag/datainfo - 
  type (type_lang_measure_mask) :: potential  ! /langmuirdiag/potential - Floating potential [V]. All children are vectors(npot)
  type (type_lang_measure_mask) :: bias  ! /langmuirdiag/bias - Biasing potential [V]. All children are vectors(bias)
  type (type_lang_measure_mask) :: jsat  ! /langmuirdiag/jsat - Ion saturation current [A/m^2]. All children are vectors(njsat)
  type (type_lang_derived_mask) :: ne  ! /langmuirdiag/ne - Electron density [m^-3]. All children are vectors(ndensity).
  type (type_lang_derived_mask) :: te  ! /langmuirdiag/te - Electron Temperature [eV]. All children are vectors(nte)
  type (type_lang_derived_mask) :: machpar  ! /langmuirdiag/machpar - Parallel Mach number. All children are vectors(nmach) 
  type (type_codeparam_mask) :: codeparam  ! /langmuirdiag/codeparam - 
  integer  :: time=0       ! /langmuirdiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include launchs.xsd
  
type type_launchs_rfbeam_spot  !    Spot characteristics
  real(EUITM_R8),pointer  :: waist(:,:) => null()     ! /waist - Waist for the spot ellipse [m], Matrix (nantenna,2). Time-dependent
  real(EUITM_R8),pointer  :: angle(:) => null()     ! /angle - Rotation angle for the spot ellipse [rd], Vector(nantenna). Time-dependent
endtype

  
type type_launchs_rfbeam_phaseellipse  !    Phase ellipse characteristics of the spot
  real(EUITM_R8),pointer  :: invcurvrad(:,:) => null()     ! /invcurvrad - Inverse curvature radii for the phase ellipse [m-1], Matrix (nantenna,2). Time-dependent
  real(EUITM_R8),pointer  :: angle(:) => null()     ! /angle - Rotation angle for the phase ellipse [rd], Vector(nantenna). Time-dependent
endtype

  
type type_launchs_rfbeam  !    Beam characteristics (RF wave description)
  type (type_launchs_rfbeam_spot) :: spot  ! /spot - Spot characteristics
  type (type_launchs_rfbeam_phaseellipse) :: phaseellipse  ! /phaseellipse - Phase ellipse characteristics of the spot
endtype

  
type type_launchs_parallel  !    Power spectrum as a function of the parallel refractive index.
  integer,pointer  :: nn_par(:) => null()      ! /nn_par - Number of points for the discretization of the spectrum in the poloidal direction, Vector of integer
  real(EUITM_R8),pointer  :: n_par(:,:) => null()     ! /n_par - Refraction index in the parallel direction, Matrix (nantenna,max_nn_par).
  real(EUITM_R8),pointer  :: power(:) => null()     ! /power - W/dN_par [W], Matrix(nantenna, max_nn_par). Time-dependent
endtype

  
type type_launchs_phi_theta  !    Power spectrum as a function of the refractive index in the toroidal and poloidal directions.
  integer,pointer  :: nn_phi(:) => null()      ! /nn_phi - Number of points for the discretization of the spectrum in the toroidal direction, Vector of integer
  integer,pointer  :: nn_theta(:) => null()      ! /nn_theta - Number of points for the discretization of the spectrum in the poloidal direction, Vector of integer
  real(EUITM_R8),pointer  :: n_phi(:,:) => null()     ! /n_phi - Refraction index in the toroidal direction, Matrix (nantenna,max_nn_phi).
  real(EUITM_R8),pointer  :: n_theta(:,:) => null()     ! /n_theta - Refraction index in poloidal direction, Matrix (nantenna,max_nn_theta).
  real(EUITM_R8),pointer  :: power(:,:,:) => null()     ! /power - W/dNphi/dNtheta [W], Array (nantenna, max_nn_phi, max_nn_theta). Time-dependent
endtype
  
type type_launchs_rfbeam_spot_mask  !    Spot characteristics
  integer  :: waist=0       ! /waist - Waist for the spot ellipse [m], Matrix (nantenna,2). Time-dependent
  integer  :: angle=0       ! /angle - Rotation angle for the spot ellipse [rd], Vector(nantenna). Time-dependent
endtype
  
type type_launchs_rfbeam_phaseellipse_mask  !    Phase ellipse characteristics of the spot
  integer  :: invcurvrad=0       ! /invcurvrad - Inverse curvature radii for the phase ellipse [m-1], Matrix (nantenna,2). Time-dependent
  integer  :: angle=0       ! /angle - Rotation angle for the phase ellipse [rd], Vector(nantenna). Time-dependent
endtype
  
type type_launchs_rfbeam_mask  !    Beam characteristics (RF wave description)
  type (type_launchs_rfbeam_spot_mask) :: spot  ! /spot - Spot characteristics
  type (type_launchs_rfbeam_phaseellipse_mask) :: phaseellipse  ! /phaseellipse - Phase ellipse characteristics of the spot
endtype
  
type type_launchs_parallel_mask  !    Power spectrum as a function of the parallel refractive index.
  integer  :: nn_par=0       ! /nn_par - Number of points for the discretization of the spectrum in the poloidal direction, Vector of integer
  integer  :: n_par=0       ! /n_par - Refraction index in the parallel direction, Matrix (nantenna,max_nn_par).
  integer  :: power=0       ! /power - W/dN_par [W], Matrix(nantenna, max_nn_par). Time-dependent
endtype
  
type type_launchs_phi_theta_mask  !    Power spectrum as a function of the refractive index in the toroidal and poloidal directions.
  integer  :: nn_phi=0       ! /nn_phi - Number of points for the discretization of the spectrum in the toroidal direction, Vector of integer
  integer  :: nn_theta=0       ! /nn_theta - Number of points for the discretization of the spectrum in the poloidal direction, Vector of integer
  integer  :: n_phi=0       ! /n_phi - Refraction index in the toroidal direction, Matrix (nantenna,max_nn_phi).
  integer  :: n_theta=0       ! /n_theta - Refraction index in poloidal direction, Matrix (nantenna,max_nn_theta).
  integer  :: power=0       ! /power - W/dNphi/dNtheta [W], Array (nantenna, max_nn_phi, max_nn_theta). Time-dependent
endtype

  
type type_spectrum  !    
  type (type_launchs_phi_theta) :: phi_theta  ! /launchs/spectrum/phi_theta - Power spectrum as a function of the refractive index in the toroidal and poloidal directions.
  type (type_launchs_parallel) :: parallel  ! /launchs/spectrum/parallel - Power spectrum as a function of the parallel refractive index.
endtype
  
type type_spectrum_mask  !    
  type (type_launchs_phi_theta_mask) :: phi_theta  ! /launchs/spectrum/phi_theta - Power spectrum as a function of the refractive index in the toroidal and poloidal directions.
  type (type_launchs_parallel_mask) :: parallel  ! /launchs/spectrum/parallel - Power spectrum as a function of the parallel refractive index.
endtype

  
type type_launchs  !    
  type (type_datainfo) :: datainfo  ! /launchs/datainfo - 
  character(len=132), dimension(:), pointer ::name => null()       ! /launchs/name - Antenna name, Vector of strings (nantenna)
  character(len=132), dimension(:), pointer ::type => null()       ! /launchs/type - Wave type (LH, EC, IC, ...), Vector of strings (nantenna)
  real(EUITM_R8),pointer  :: frequency(:) => null()     ! /launchs/frequency - Wave frequency [Hz], Vector (nantenna).
  integer,pointer  :: mode(:) => null()      ! /launchs/mode - Incoming wave mode (+ 1 : slow wave only; -1 both slow and fast wave modes). Vector of integers (nan
  type (type_rzphi1D) :: position  ! /launchs/position - Reference global position of the antenna. Time-dependent
  type (type_spectrum) :: spectrum  ! /launchs/spectrum - Spectral properties of the wave.
  type (type_launchs_rfbeam) :: beam  ! /launchs/beam - Beam characteristics
  type (type_codeparam) :: codeparam  ! /launchs/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /launchs/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_launchs_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /launchs/datainfo - 
  integer  :: name=0       ! /launchs/name - Antenna name, Vector of strings (nantenna)
  integer  :: type=0       ! /launchs/type - Wave type (LH, EC, IC, ...), Vector of strings (nantenna)
  integer  :: frequency=0       ! /launchs/frequency - Wave frequency [Hz], Vector (nantenna).
  integer  :: mode=0       ! /launchs/mode - Incoming wave mode (+ 1 : slow wave only; -1 both slow and fast wave modes). Vector of integers (nan
  type (type_rzphi1D_mask) :: position  ! /launchs/position - Reference global position of the antenna. Time-dependent
  type (type_spectrum_mask) :: spectrum  ! /launchs/spectrum - Spectral properties of the wave.
  type (type_launchs_rfbeam_mask) :: beam  ! /launchs/beam - Beam characteristics
  type (type_codeparam_mask) :: codeparam  ! /launchs/codeparam - 
  integer  :: time=0       ! /launchs/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include lithiumdiag.xsd
  
type type_lithsetup  !    diagnostic setup information
  type (type_rzphi1D) :: position  ! /position - Position of the measurement. Vector (nchannels)
endtype

  
type type_lithmeasure  !    Measured values
  type (type_exp1D) :: ne  ! /ne - Electron density [m^-3]. Vector (nchannels)
endtype
  
type type_lithsetup_mask  !    diagnostic setup information
  type (type_rzphi1D_mask) :: position  ! /position - Position of the measurement. Vector (nchannels)
endtype
  
type type_lithmeasure_mask  !    Measured values
  type (type_exp1D_mask) :: ne  ! /ne - Electron density [m^-3]. Vector (nchannels)
endtype

  
type type_lithiumdiag  !    
  type (type_datainfo) :: datainfo  ! /lithiumdiag/datainfo - 
  type (type_lithsetup) :: setup  ! /lithiumdiag/setup - diagnostic setup information
  type (type_lithmeasure) :: measure  ! /lithiumdiag/measure - Measured values
  type (type_codeparam) :: codeparam  ! /lithiumdiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /lithiumdiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_lithiumdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /lithiumdiag/datainfo - 
  type (type_lithsetup_mask) :: setup  ! /lithiumdiag/setup - diagnostic setup information
  type (type_lithmeasure_mask) :: measure  ! /lithiumdiag/measure - Measured values
  type (type_codeparam_mask) :: codeparam  ! /lithiumdiag/codeparam - 
  integer  :: time=0       ! /lithiumdiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include magdiag.xsd
  
type type_setup_floops  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /magdiag/flux_loops/setup_floops/name - Name of loop. Array of strings (nloops).
  character(len=132), dimension(:), pointer ::id => null()       ! /magdiag/flux_loops/setup_floops/id - ID of loop. Array of strings (nloops).
  type (type_rzphi2D) :: position  ! /magdiag/flux_loops/setup_floops/position - List of (R,Z,phi) points defining the position of the loop (see data structure documentation FLUXLOO
  integer,pointer  :: npoints(:) => null()      ! /magdiag/flux_loops/setup_floops/npoints - Number of points describing each loop in the "position" matrices. Vector (nloops)
endtype

  
type type_setup_bprobe  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /magdiag/bpol_probes/setup_bprobe/name - Name of the probe.  Array of strings (nprobes).
  character(len=132), dimension(:), pointer ::id => null()       ! /magdiag/bpol_probes/setup_bprobe/id - ID of the probe.  Array of strings (nprobes).
  type (type_rz1D) :: position  ! /magdiag/bpol_probes/setup_bprobe/position - RZ of coil centre [m]; Vector (nprobes)
  real(EUITM_R8),pointer  :: polangle(:) => null()     ! /magdiag/bpol_probes/setup_bprobe/polangle - Poloidal angle of coil orientation (w.r.t. horizontal ?? to be checked) [rad]; Vector (nprobes)
  real(EUITM_R8),pointer  :: torangle(:) => null()     ! /magdiag/bpol_probes/setup_bprobe/torangle - Toroidal angle of coil orientation (0 if fully in the poloidal plane) [rad] ; Vector (nprobes)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /magdiag/bpol_probes/setup_bprobe/area - Area of coil [m^2]; Vector (nprobes)
  real(EUITM_R8),pointer  :: length(:) => null()     ! /magdiag/bpol_probes/setup_bprobe/length - Length of coil [m]; Vector (nprobes)
  integer,pointer  :: turns(:) => null()      ! /magdiag/bpol_probes/setup_bprobe/turns - Turns in the coil; Vector (nprobes)
endtype
  
type type_setup_floops_mask  !    
  integer  :: name=0       ! /magdiag/flux_loops/setup_floops/name - Name of loop. Array of strings (nloops).
  integer  :: id=0       ! /magdiag/flux_loops/setup_floops/id - ID of loop. Array of strings (nloops).
  type (type_rzphi2D_mask) :: position  ! /magdiag/flux_loops/setup_floops/position - List of (R,Z,phi) points defining the position of the loop (see data structure documentation FLUXLOO
  integer  :: npoints=0       ! /magdiag/flux_loops/setup_floops/npoints - Number of points describing each loop in the "position" matrices. Vector (nloops)
endtype
  
type type_setup_bprobe_mask  !    
  integer  :: name=0       ! /magdiag/bpol_probes/setup_bprobe/name - Name of the probe.  Array of strings (nprobes).
  integer  :: id=0       ! /magdiag/bpol_probes/setup_bprobe/id - ID of the probe.  Array of strings (nprobes).
  type (type_rz1D_mask) :: position  ! /magdiag/bpol_probes/setup_bprobe/position - RZ of coil centre [m]; Vector (nprobes)
  integer  :: polangle=0       ! /magdiag/bpol_probes/setup_bprobe/polangle - Poloidal angle of coil orientation (w.r.t. horizontal ?? to be checked) [rad]; Vector (nprobes)
  integer  :: torangle=0       ! /magdiag/bpol_probes/setup_bprobe/torangle - Toroidal angle of coil orientation (0 if fully in the poloidal plane) [rad] ; Vector (nprobes)
  integer  :: area=0       ! /magdiag/bpol_probes/setup_bprobe/area - Area of coil [m^2]; Vector (nprobes)
  integer  :: length=0       ! /magdiag/bpol_probes/setup_bprobe/length - Length of coil [m]; Vector (nprobes)
  integer  :: turns=0       ! /magdiag/bpol_probes/setup_bprobe/turns - Turns in the coil; Vector (nprobes)
endtype

  
type type_flux_loops  !    
  type (type_setup_floops) :: setup_floops  ! /magdiag/flux_loops/setup_floops - diagnostic setup information
  type (type_exp1D) :: measure  ! /magdiag/flux_loops/measure - Measured flux [Wb]; Time-dependent; Vector (nloops)
endtype

  
type type_bpol_probes  !    
  type (type_setup_bprobe) :: setup_bprobe  ! /magdiag/bpol_probes/setup_bprobe - diagnostic setup information
  type (type_exp1D) :: measure  ! /magdiag/bpol_probes/measure - Measured value [T]; Time-dependent; Vector (nprobes)
endtype
  
type type_flux_loops_mask  !    
  type (type_setup_floops_mask) :: setup_floops  ! /magdiag/flux_loops/setup_floops - diagnostic setup information
  type (type_exp1D_mask) :: measure  ! /magdiag/flux_loops/measure - Measured flux [Wb]; Time-dependent; Vector (nloops)
endtype
  
type type_bpol_probes_mask  !    
  type (type_setup_bprobe_mask) :: setup_bprobe  ! /magdiag/bpol_probes/setup_bprobe - diagnostic setup information
  type (type_exp1D_mask) :: measure  ! /magdiag/bpol_probes/measure - Measured value [T]; Time-dependent; Vector (nprobes)
endtype

  
type type_magdiag  !    
  type (type_datainfo) :: datainfo  ! /magdiag/datainfo - 
  type (type_exp0D) :: ip  ! /magdiag/ip - Plasma current [A]. Positive sign means anti-clockwise when viewed from above.  Time-dependent. Scal
  type (type_exp0D) :: diamagflux  ! /magdiag/diamagflux - Diamagnetic flux [Wb]; Time-dependent; Scalar
  type (type_exp0D) :: diamagener  ! /magdiag/diamagener - Diamagnetic energy [J]; Time-dependent; Scalar
  type (type_flux_loops) :: flux_loops  ! /magdiag/flux_loops - Poloidal flux loops RZ coordinates have 1 component for the full loop and two if there is a negative
  type (type_bpol_probes) :: bpol_probes  ! /magdiag/bpol_probes - Poloidal field probes
  type (type_codeparam) :: codeparam  ! /magdiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /magdiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_magdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /magdiag/datainfo - 
  type (type_exp0D_mask) :: ip  ! /magdiag/ip - Plasma current [A]. Positive sign means anti-clockwise when viewed from above.  Time-dependent. Scal
  type (type_exp0D_mask) :: diamagflux  ! /magdiag/diamagflux - Diamagnetic flux [Wb]; Time-dependent; Scalar
  type (type_exp0D_mask) :: diamagener  ! /magdiag/diamagener - Diamagnetic energy [J]; Time-dependent; Scalar
  type (type_flux_loops_mask) :: flux_loops  ! /magdiag/flux_loops - Poloidal flux loops RZ coordinates have 1 component for the full loop and two if there is a negative
  type (type_bpol_probes_mask) :: bpol_probes  ! /magdiag/bpol_probes - Poloidal field probes
  type (type_codeparam_mask) :: codeparam  ! /magdiag/codeparam - 
  integer  :: time=0       ! /magdiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include msediag.xsd
  
type type_msediag_setup  !    Geometry for the observation line of sight
  type (type_rzphi0D) :: pivot_point  ! /pivot_point - Pivot point of mse line of sight. Scalar
  real(EUITM_R8)  :: horchordang=-9.0E40_EUITM_R8       ! /horchordang - Angle [rad] of horizontal projection of mse line of sight with poloidal cross section (0 for HFS to 
  real(EUITM_R8)  :: verchordang=-9.0E40_EUITM_R8       ! /verchordang - Angle of mse line of sight with vertical axis (0 for bottom-top trajectory, Pi for top-bottom trajec
  type (type_rzphi0D) :: second_point  ! /second_point - Second point defining the mse line of sight together with the pivot_point. Scalar
endtype

  
type type_msediag_stokes  !    Stokes vector (I,U,S,V) as a function of the wavelength for the polarized and unpolarized relevant MSE spectral lines. Replicate f
  type (type_identifier) :: type  ! /type - Type of the polarization. 0 for unpolarised, 1 for Pi, 2 for sigma^+ and 3 for sigma^-
  real(EUITM_R8),pointer  :: vector(:,:) => null()     ! /vector - Stokes vector (I,U,S,V) as a function of the wavelength. Vector (4,nwavelength).
endtype

  
type type_msediag_radia_chord  !    MSE radiance characterization. This structure is used for each line of sight of the MSE setup and contains the geometry of the lin
  type (type_msediag_setup) :: setup  ! /setup - Geometry for the observation line of sight
  type (type_msediag_stokes),pointer :: stokes(:) => null()  ! /stokes(i) - Stokes vector (I,U,S,V) as a function of the wavelength for the polarized and unpolarized relevant M
  type (type_exp1D) :: totradiance  ! /totradiance - Total Radiance integrated along the lines of sight (Wm^-2sr-^1). Vector (nwavelength)
endtype

  
type type_msediag_polarization  !    Polarized and unpolarized emissivity of the relevant MSE spectral lines. Structure Array (ncomp). Time-dependent.
  type (type_identifier) :: type  ! /type - Type of the polarization. 0 for unpolarised, 1 for Pi, 2 for sigma^+ and 3 for sigma^-
  real(EUITM_R8),pointer  :: spec_emiss(:,:) => null()     ! /spec_emiss - Spectral emissivity of a particular polarization (Wm^-3sr-^1). Matrix (npos,nwavelength). Time-depen
endtype

  
type type_msediag_emiss_chord  !    MSE Emissivity characterization. This structure is used for each line of sight of the MSE setup and contains the geometry of the l
  real(EUITM_R8)  :: volume=-9.0E40_EUITM_R8       ! /volume - Emitting volume (m^-3). Scalar
  type (type_rzphi1D) :: setup  ! /setup - Description of the line of sight (for the moment a line - not a cone of sight). Vector (npos).
  type (type_msediag_polarization),pointer :: polarization(:) => null()  ! /polarization(i) - Polarized and unpolarized emissivity of the relevant MSE spectral lines. Structure Array (ncomp). Ti
  real(EUITM_R8),pointer  :: quantiaxis(:) => null()     ! /quantiaxis - Quantization axis for the line of sight (eR,ePhi,eZ). It is a unitary vector associated to the line 
endtype

  
type type_msediag_emissivity  !    Emissivity characteristics. 
  real(EUITM_R8),pointer  :: wavelength(:) => null()     ! /wavelength - Wavelength [m]. Vector (nwavelength)
  type (type_msediag_emiss_chord),pointer :: emiss_chord(:) => null()  ! /emiss_chord(i) - MSE Emissivity characterization. This structure is used for each line of sight of the MSE setup and 
endtype

  
type type_msediag_setup_polarimetry  !    diagnostic setup information
  type (type_rzphidrdzdphi1D) :: rzgamma  ! /rzgamma - Position and width of the intersection between beam and line of sight. Vectors (nchords)
  real(EUITM_R8),pointer  :: geom_coef(:,:) => null()     ! /geom_coef - Geometric coefficients (9) describing the angle between beam and line of sight; The first dimension 
endtype

  
type type_msediag_radiance  !    Emissivity characteristics. 
  type (type_exp1D) :: wavelength  ! /wavelength - Wavelength [m]. Vector (nwavelength)
  type (type_msediag_radia_chord),pointer :: radia_chord(:) => null()  ! /radia_chord(i) - MSE radiance characterization. This structure is used for each line of sight of the MSE setup and co
endtype
  
type type_msediag_setup_mask  !    Geometry for the observation line of sight
  type (type_rzphi0D_mask) :: pivot_point  ! /pivot_point - Pivot point of mse line of sight. Scalar
  integer  :: horchordang=0       ! /horchordang - Angle [rad] of horizontal projection of mse line of sight with poloidal cross section (0 for HFS to 
  integer  :: verchordang=0       ! /verchordang - Angle of mse line of sight with vertical axis (0 for bottom-top trajectory, Pi for top-bottom trajec
  type (type_rzphi0D_mask) :: second_point  ! /second_point - Second point defining the mse line of sight together with the pivot_point. Scalar
endtype
  
type type_msediag_stokes_mask  !    Stokes vector (I,U,S,V) as a function of the wavelength for the polarized and unpolarized relevant MSE spectral lines. Replicate f
  type (type_identifier_mask) :: type  ! /type - Type of the polarization. 0 for unpolarised, 1 for Pi, 2 for sigma^+ and 3 for sigma^-
  integer  :: vector=0       ! /vector - Stokes vector (I,U,S,V) as a function of the wavelength. Vector (4,nwavelength).
endtype
  
type type_msediag_radia_chord_mask  !    MSE radiance characterization. This structure is used for each line of sight of the MSE setup and contains the geometry of the lin
  type (type_msediag_setup_mask) :: setup  ! /setup - Geometry for the observation line of sight
  type (type_msediag_stokes_mask),pointer :: stokes(:) => null()  ! /stokes(i) - Stokes vector (I,U,S,V) as a function of the wavelength for the polarized and unpolarized relevant M
  type (type_exp1D_mask) :: totradiance  ! /totradiance - Total Radiance integrated along the lines of sight (Wm^-2sr-^1). Vector (nwavelength)
endtype
  
type type_msediag_polarization_mask  !    Polarized and unpolarized emissivity of the relevant MSE spectral lines. Structure Array (ncomp). Time-dependent.
  type (type_identifier_mask) :: type  ! /type - Type of the polarization. 0 for unpolarised, 1 for Pi, 2 for sigma^+ and 3 for sigma^-
  integer  :: spec_emiss=0       ! /spec_emiss - Spectral emissivity of a particular polarization (Wm^-3sr-^1). Matrix (npos,nwavelength). Time-depen
endtype
  
type type_msediag_emiss_chord_mask  !    MSE Emissivity characterization. This structure is used for each line of sight of the MSE setup and contains the geometry of the l
  integer  :: volume=0       ! /volume - Emitting volume (m^-3). Scalar
  type (type_rzphi1D_mask) :: setup  ! /setup - Description of the line of sight (for the moment a line - not a cone of sight). Vector (npos).
  type (type_msediag_polarization_mask),pointer :: polarization(:) => null()  ! /polarization(i) - Polarized and unpolarized emissivity of the relevant MSE spectral lines. Structure Array (ncomp). Ti
  integer  :: quantiaxis=0       ! /quantiaxis - Quantization axis for the line of sight (eR,ePhi,eZ). It is a unitary vector associated to the line 
endtype
  
type type_msediag_emissivity_mask  !    Emissivity characteristics. 
  integer  :: wavelength=0       ! /wavelength - Wavelength [m]. Vector (nwavelength)
  type (type_msediag_emiss_chord_mask),pointer :: emiss_chord(:) => null()  ! /emiss_chord(i) - MSE Emissivity characterization. This structure is used for each line of sight of the MSE setup and 
endtype
  
type type_msediag_setup_polarimetry_mask  !    diagnostic setup information
  type (type_rzphidrdzdphi1D_mask) :: rzgamma  ! /rzgamma - Position and width of the intersection between beam and line of sight. Vectors (nchords)
  integer  :: geom_coef=0       ! /geom_coef - Geometric coefficients (9) describing the angle between beam and line of sight; The first dimension 
endtype
  
type type_msediag_radiance_mask  !    Emissivity characteristics. 
  type (type_exp1D_mask) :: wavelength  ! /wavelength - Wavelength [m]. Vector (nwavelength)
  type (type_msediag_radia_chord_mask),pointer :: radia_chord(:) => null()  ! /radia_chord(i) - MSE radiance characterization. This structure is used for each line of sight of the MSE setup and co
endtype

  
type type_polarimetry  !    
  type (type_msediag_setup_polarimetry) :: setup  ! /msediag/polarimetry/setup - diagnostic setup information
  type (type_exp1D) :: measure  ! /msediag/polarimetry/measure - Measured value (MSE angle gamma [rad]). Time-dependent; Vector (nchords)
endtype

  
type type_spectral  !    
  type (type_msediag_emissivity) :: emissivity  ! /msediag/spectral/emissivity - Emissivity characteristics. 
  type (type_msediag_radiance) :: radiance  ! /msediag/spectral/radiance - Emissivity characteristics. 
  type (type_codeparam) :: codeparam  ! /msediag/spectral/codeparam - 
endtype
  
type type_polarimetry_mask  !    
  type (type_msediag_setup_polarimetry_mask) :: setup  ! /msediag/polarimetry/setup - diagnostic setup information
  type (type_exp1D_mask) :: measure  ! /msediag/polarimetry/measure - Measured value (MSE angle gamma [rad]). Time-dependent; Vector (nchords)
endtype
  
type type_spectral_mask  !    
  type (type_msediag_emissivity_mask) :: emissivity  ! /msediag/spectral/emissivity - Emissivity characteristics. 
  type (type_msediag_radiance_mask) :: radiance  ! /msediag/spectral/radiance - Emissivity characteristics. 
  type (type_codeparam_mask) :: codeparam  ! /msediag/spectral/codeparam - 
endtype

  
type type_msediag  !    
  type (type_datainfo) :: datainfo  ! /msediag/datainfo - 
  type (type_polarimetry) :: polarimetry  ! /msediag/polarimetry - This structure accomodates the polarimetry setup and measurements of a mse diagnostic, as widely use
  type (type_spectral) :: spectral  ! /msediag/spectral - This structure accommodates the types needed on a spectral MSE diagnostic namely the emmissivity and
  type (type_codeparam) :: codeparam  ! /msediag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /msediag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_msediag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /msediag/datainfo - 
  type (type_polarimetry_mask) :: polarimetry  ! /msediag/polarimetry - This structure accomodates the polarimetry setup and measurements of a mse diagnostic, as widely use
  type (type_spectral_mask) :: spectral  ! /msediag/spectral - This structure accommodates the types needed on a spectral MSE diagnostic namely the emmissivity and
  type (type_codeparam_mask) :: codeparam  ! /msediag/codeparam - 
  integer  :: time=0       ! /msediag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include mhd.xsd
  
type type_mhd_vector  !    Vector structure for MHD CPO
  COMPLEX(EUITM_R8),pointer  :: coord1(:,:) => null()     ! /coord1 - Fourier components of first coordinate; Time-dependent; Array 2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: coord2(:,:) => null()     ! /coord2 - Fourier components of second coordinate; Time-dependent; Array 2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: coord3(:,:) => null()     ! /coord3 - Fourier components of third coordinate; Time-dependent; Array 2D (npsi,nm)
endtype

  
type type_mhd_vacuum  !    External modes
  real(EUITM_R8),pointer  :: m(:,:,:) => null()     ! /m - Poloidal mode number; Time-dependent; Array2D (npsi,nm)
  type (type_coord_sys) :: coord_sys  ! /coord_sys - 
  type (type_mhd_vector) :: a_pert  ! /a_pert - Pertubed vector potential (in Fourier space) [T.m]
  type (type_mhd_vector) :: b_pert  ! /b_pert - Perturbed magnetic field (in Fourier space) [T]
endtype

  
type type_mhd_plasma  !    MHD modes in the confined plasma
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Position in poloidal flux [Wb] (without 1/2pi and such that Bp=|grad psi| /R/2/pi). Time-dependent; 
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  real(EUITM_R8),pointer  :: m(:,:) => null()     ! /m - Poloidal mode number; Time-dependent; Array2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: disp_perp(:,:) => null()     ! /disp_perp - Perpendicular displacement of the mode (in Fourier space) [m]; Time-dependent; Array 2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: disp_par(:,:) => null()     ! /disp_par - Parallel displacement of the mode (in Fourier space) [m]; Time-dependent; Array 2D (npsi,nm)
  real(EUITM_R8),pointer  :: tau_alfven(:) => null()     ! /tau_alfven - Alven time=R/vA=R0 sqrt(mi ni(rho))/B0 [s]; Definitions of R0, BO, mi, ni to be clarified. rho grid 
  real(EUITM_R8),pointer  :: tau_res(:) => null()     ! /tau_res - Resistive time = mu_0 rho*rho/1.22/eta_neo [s]; Source of eta_neo to be clarified. Time-dependent; V
  type (type_coord_sys) :: coord_sys  ! /coord_sys - 
  type (type_mhd_vector) :: a_pert  ! /a_pert - Pertubed vector potential (in Fourier space) [T.m]
  type (type_mhd_vector) :: b_pert  ! /b_pert - Perturbed magnetic field (in Fourier space) [T]
  type (type_mhd_vector) :: v_pert  ! /v_pert - Perturbed velocity (in Fourier space) [m/s]
  COMPLEX(EUITM_R8),pointer  :: p_pert(:,:) => null()     ! /p_pert - Perturbed pressure (in Fourier space) [Pa]; Time-dependent; Array 2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: rho_mass_per(:,:) => null()     ! /rho_mass_per - Perturbed mass density (in Fourier space) [kg/m^3]; Time-dependent; Array 2D (npsi,nm)
  COMPLEX(EUITM_R8),pointer  :: temp_per(:,:) => null()     ! /temp_per - Perturbed temperature (in Fourier space) [eV]; Time-dependent; Array 2D (npsi,nm)
endtype

  
type type_mhd_mode  !    MHD modes in the confined plasma
  integer  :: modenum=-999999999       ! /modenum - Toroidal mode number of the MHD mode; Scalar; Time-dependent.
  real(EUITM_R8)  :: growthrate=-9.0E40_EUITM_R8       ! /growthrate - Linear growthrate of the mode [Hz]; Scalar; Time-dependent.
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /frequency - Frequency of the mode [Hz]; Scalar; Time-dependent.
  type (type_mhd_plasma) :: plasma  ! /plasma - MHD modes in the confined plasma
  type (type_mhd_vacuum) :: vacuum  ! /vacuum - External modes
endtype
  
type type_mhd_vector_mask  !    Vector structure for MHD CPO
  integer  :: coord1=0       ! /coord1 - Fourier components of first coordinate; Time-dependent; Array 2D (npsi,nm)
  integer  :: coord2=0       ! /coord2 - Fourier components of second coordinate; Time-dependent; Array 2D (npsi,nm)
  integer  :: coord3=0       ! /coord3 - Fourier components of third coordinate; Time-dependent; Array 2D (npsi,nm)
endtype
  
type type_mhd_vacuum_mask  !    External modes
  integer  :: m=0       ! /m - Poloidal mode number; Time-dependent; Array2D (npsi,nm)
  type (type_coord_sys_mask) :: coord_sys  ! /coord_sys - 
  type (type_mhd_vector_mask) :: a_pert  ! /a_pert - Pertubed vector potential (in Fourier space) [T.m]
  type (type_mhd_vector_mask) :: b_pert  ! /b_pert - Perturbed magnetic field (in Fourier space) [T]
endtype
  
type type_mhd_plasma_mask  !    MHD modes in the confined plasma
  integer  :: psi=0       ! /psi - Position in poloidal flux [Wb] (without 1/2pi and such that Bp=|grad psi| /R/2/pi). Time-dependent; 
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  integer  :: m=0       ! /m - Poloidal mode number; Time-dependent; Array2D (npsi,nm)
  integer  :: disp_perp=0       ! /disp_perp - Perpendicular displacement of the mode (in Fourier space) [m]; Time-dependent; Array 2D (npsi,nm)
  integer  :: disp_par=0       ! /disp_par - Parallel displacement of the mode (in Fourier space) [m]; Time-dependent; Array 2D (npsi,nm)
  integer  :: tau_alfven=0       ! /tau_alfven - Alven time=R/vA=R0 sqrt(mi ni(rho))/B0 [s]; Definitions of R0, BO, mi, ni to be clarified. rho grid 
  integer  :: tau_res=0       ! /tau_res - Resistive time = mu_0 rho*rho/1.22/eta_neo [s]; Source of eta_neo to be clarified. Time-dependent; V
  type (type_coord_sys_mask) :: coord_sys  ! /coord_sys - 
  type (type_mhd_vector_mask) :: a_pert  ! /a_pert - Pertubed vector potential (in Fourier space) [T.m]
  type (type_mhd_vector_mask) :: b_pert  ! /b_pert - Perturbed magnetic field (in Fourier space) [T]
  type (type_mhd_vector_mask) :: v_pert  ! /v_pert - Perturbed velocity (in Fourier space) [m/s]
  integer  :: p_pert=0       ! /p_pert - Perturbed pressure (in Fourier space) [Pa]; Time-dependent; Array 2D (npsi,nm)
  integer  :: rho_mass_per=0       ! /rho_mass_per - Perturbed mass density (in Fourier space) [kg/m^3]; Time-dependent; Array 2D (npsi,nm)
  integer  :: temp_per=0       ! /temp_per - Perturbed temperature (in Fourier space) [eV]; Time-dependent; Array 2D (npsi,nm)
endtype
  
type type_mhd_mode_mask  !    MHD modes in the confined plasma
  integer  :: modenum=0       ! /modenum - Toroidal mode number of the MHD mode; Scalar; Time-dependent.
  integer  :: growthrate=0       ! /growthrate - Linear growthrate of the mode [Hz]; Scalar; Time-dependent.
  integer  :: frequency=0       ! /frequency - Frequency of the mode [Hz]; Scalar; Time-dependent.
  type (type_mhd_plasma_mask) :: plasma  ! /plasma - MHD modes in the confined plasma
  type (type_mhd_vacuum_mask) :: vacuum  ! /vacuum - External modes
endtype

  
type type_mhd  !    
  type (type_datainfo) :: datainfo  ! /mhd/datainfo - 
  type (type_b0r0) :: toroid_field  ! /mhd/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_mhd_mode),pointer :: n(:) => null()  ! /mhd/n(i) - Vector of toroidal mode numbers; Structure Array (ntor); Time-dependent
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /mhd/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam) :: codeparam  ! /mhd/codeparam - 
endtype
  
type type_mhd_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /mhd/datainfo - 
  type (type_b0r0_mask) :: toroid_field  ! /mhd/toroid_field - Characteristics of the vacuum toroidal field, redundant with the toroidfield CPO, to document the no
  type (type_mhd_mode_mask),pointer :: n(:) => null()  ! /mhd/n(i) - Vector of toroidal mode numbers; Structure Array (ntor); Time-dependent
  integer  :: time=0       ! /mhd/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam_mask) :: codeparam  ! /mhd/codeparam - 
endtype

! ***********  Include nbi.xsd
  
type type_nbi_nbi_unit_wall_surface  !    A collimating solid surface described by a polygon; no particle can pass through this surface  
  type (type_trianglexyz),pointer :: triangle(:) => null()  ! /triangle(i) - Triangular wall surface described by its three corners: point1, point2, and point3. Vector(n_triangl
  type (type_rectanglexyz),pointer :: rectangle(:) => null()  ! /rectangle(i) - Rectangular wall surface described by its four corners. These form an ordered sequence: point00, poi
endtype

  
type type_nbi_nbi_unit_wall  !    Description of the wall components in the NBI system that limits the beam spatial width of the beam. The wall is here described a 
  type (type_nbi_nbi_unit_wall_surface) :: surface  ! /surface - A collimating solid surface described by a polygon; no particle can pass through this surface  
  type (type_flat_polygon),pointer :: collimator(:) => null()  ! /collimator(i) - Vector of collimating holes (openings). Each hole has to be flat, i.e. it lies on a surface. Particl
endtype
  
type type_nbi_nbi_unit_wall_surface_mask  !    A collimating solid surface described by a polygon; no particle can pass through this surface  
  type (type_trianglexyz_mask),pointer :: triangle(:) => null()  ! /triangle(i) - Triangular wall surface described by its three corners: point1, point2, and point3. Vector(n_triangl
  type (type_rectanglexyz_mask),pointer :: rectangle(:) => null()  ! /rectangle(i) - Rectangular wall surface described by its four corners. These form an ordered sequence: point00, poi
endtype
  
type type_nbi_nbi_unit_wall_mask  !    Description of the wall components in the NBI system that limits the beam spatial width of the beam. The wall is here described a 
  type (type_nbi_nbi_unit_wall_surface_mask) :: surface  ! /surface - A collimating solid surface described by a polygon; no particle can pass through this surface  
  type (type_flat_polygon_mask),pointer :: collimator(:) => null()  ! /collimator(i) - Vector of collimating holes (openings). Each hole has to be flat, i.e. it lies on a surface. Particl
endtype

  
type type_focussing  !    
  real(EUITM_R8)  :: focal_len_hz=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/focal_len_hz - Horizontal focal length along the beam line, i.e. the point along the centre of the beamlet-group wh
  real(EUITM_R8)  :: focal_len_vc=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/focal_len_vc - Vertical focal length along the beam line, i.e. the point along the centre of the beamlet-group wher
  real(EUITM_R8)  :: width_min_hz=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/width_min_hz - The horizontal width of the beamlet-group at the at the horizontal focal point [m]. Scalar
  real(EUITM_R8)  :: width_min_vc=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/width_min_vc - The vertical width of the beamlet-group at the at the vertical focal point [m]. Scalar
endtype

  
type type_divergence  !    
  real(EUITM_R8),pointer  :: frac_divcomp(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/frac_divcomp - Fraction of injected particles. Vector(ndiv_comp)
  real(EUITM_R8),pointer  :: div_vert(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/div_vert - The vertical beamlet divergence [rad]. Here the divergence is defined for Gaussian beams as the ange
  real(EUITM_R8),pointer  :: div_horiz(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/div_horiz - The horizontal beamlet divergence [rad]. Here the divergence is defined for Gaussian beams as the an
endtype

  
type type_beamlets  !    
  type (type_rzphi1D) :: position  ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/position - Position of beamlets. Vector rzphi1D (nbeamlets)
  real(EUITM_R8),pointer  :: tang_rad_blt(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/tang_rad_blt - Tangency radius (major radius where the central line of a beamlet is tangent to a circle around the 
  real(EUITM_R8),pointer  :: angle_blt(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/angle_blt - Angle of inclination between a line at the centre of a beamlet and the horiontal plane [rad]; Vector
  real(EUITM_R8),pointer  :: pow_frc_blt(:) => null()     ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/pow_frc_blt - Fraction of power of a unit injected by a beamlet; Vector(nbeamlets)
endtype
  
type type_focussing_mask  !    
  integer  :: focal_len_hz=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/focal_len_hz - Horizontal focal length along the beam line, i.e. the point along the centre of the beamlet-group wh
  integer  :: focal_len_vc=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/focal_len_vc - Vertical focal length along the beam line, i.e. the point along the centre of the beamlet-group wher
  integer  :: width_min_hz=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/width_min_hz - The horizontal width of the beamlet-group at the at the horizontal focal point [m]. Scalar
  integer  :: width_min_vc=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing/width_min_vc - The vertical width of the beamlet-group at the at the vertical focal point [m]. Scalar
endtype
  
type type_divergence_mask  !    
  integer  :: frac_divcomp=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/frac_divcomp - Fraction of injected particles. Vector(ndiv_comp)
  integer  :: div_vert=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/div_vert - The vertical beamlet divergence [rad]. Here the divergence is defined for Gaussian beams as the ange
  integer  :: div_horiz=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence/div_horiz - The horizontal beamlet divergence [rad]. Here the divergence is defined for Gaussian beams as the an
endtype
  
type type_beamlets_mask  !    
  type (type_rzphi1D_mask) :: position  ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/position - Position of beamlets. Vector rzphi1D (nbeamlets)
  integer  :: tang_rad_blt=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/tang_rad_blt - Tangency radius (major radius where the central line of a beamlet is tangent to a circle around the 
  integer  :: angle_blt=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/angle_blt - Angle of inclination between a line at the centre of a beamlet and the horiontal plane [rad]; Vector
  integer  :: pow_frc_blt=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets/pow_frc_blt - Fraction of power of a unit injected by a beamlet; Vector(nbeamlets)
endtype

  
type type_inj_spec  !    
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/inj_spec/amn - Atomic mass number
  real(EUITM_R8)  :: zn=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/inj_spec/zn - Nuclear charge
endtype

  
type type_beamletgroup  !    
  type (type_rzphi0D) :: position  ! /nbi/nbi_unit(i)/beamletgroup(i)/position - Position of centre of injection unit surface (or grounded grid).
  real(EUITM_R8)  :: tang_rad=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/tang_rad - Tangency radius (major radius where the central line of a NBI unit is tangent to a circle around the
  real(EUITM_R8)  :: angle=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/angle - Angle of inclination between a line at the centre of the injection unit surface and the horiontal pl
  integer  :: direction=-999999999       ! /nbi/nbi_unit(i)/beamletgroup(i)/direction - Direction of the beam seen from above the torus: -1 = clockwise; 1 = counter clockwise
  real(EUITM_R8)  :: width_horiz=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/width_horiz - Horizontal width of the beam group at the injection unit surface (or grounded grid) [m]
  real(EUITM_R8)  :: width_vert=-9.0E40_EUITM_R8       ! /nbi/nbi_unit(i)/beamletgroup(i)/width_vert - Vertical width of the beam group at the injection unit surface (or grounded grid) [m]
  type (type_focussing) :: focussing  ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing - Describes how the beam is focussed.
  type (type_divergence) :: divergence  ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence - Detailed information on beamlet divergence. Divergens is described as a super position of Gaussian p
  type (type_beamlets) :: beamlets  ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets - Detailed information on beamlets.
endtype
  
type type_inj_spec_mask  !    
  integer  :: amn=0       ! /nbi/nbi_unit(i)/inj_spec/amn - Atomic mass number
  integer  :: zn=0       ! /nbi/nbi_unit(i)/inj_spec/zn - Nuclear charge
endtype
  
type type_beamletgroup_mask  !    
  type (type_rzphi0D_mask) :: position  ! /nbi/nbi_unit(i)/beamletgroup(i)/position - Position of centre of injection unit surface (or grounded grid).
  integer  :: tang_rad=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/tang_rad - Tangency radius (major radius where the central line of a NBI unit is tangent to a circle around the
  integer  :: angle=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/angle - Angle of inclination between a line at the centre of the injection unit surface and the horiontal pl
  integer  :: direction=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/direction - Direction of the beam seen from above the torus: -1 = clockwise; 1 = counter clockwise
  integer  :: width_horiz=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/width_horiz - Horizontal width of the beam group at the injection unit surface (or grounded grid) [m]
  integer  :: width_vert=0       ! /nbi/nbi_unit(i)/beamletgroup(i)/width_vert - Vertical width of the beam group at the injection unit surface (or grounded grid) [m]
  type (type_focussing_mask) :: focussing  ! /nbi/nbi_unit(i)/beamletgroup(i)/focussing - Describes how the beam is focussed.
  type (type_divergence_mask) :: divergence  ! /nbi/nbi_unit(i)/beamletgroup(i)/divergence - Detailed information on beamlet divergence. Divergens is described as a super position of Gaussian p
  type (type_beamlets_mask) :: beamlets  ! /nbi/nbi_unit(i)/beamletgroup(i)/beamlets - Detailed information on beamlets.
endtype

  
type type_nbi_unit  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /nbi/nbi_unit(i)/name - Name of the neutral beam injector
  type (type_inj_spec) :: inj_spec  ! /nbi/nbi_unit(i)/inj_spec - Injected species
  type (type_exp0D) :: pow_unit  ! /nbi/nbi_unit(i)/pow_unit - Power delivered by an NBI unit [W]; Time-dependent
  type (type_exp0D) :: inj_eng_unit  ! /nbi/nbi_unit(i)/inj_eng_unit - Full injection energy of a unit [ev]; Time-dependent
  type (type_exp1D) :: beamcurrfrac  ! /nbi/nbi_unit(i)/beamcurrfrac - Beam current fractions; beamcurrfrac(j) is the fraction of the beam current from beam neutrals with 
  type (type_exp1D) :: beampowrfrac  ! /nbi/nbi_unit(i)/beampowrfrac - Beam power fractions; beampowrfrac(j) is the fraction of the beam power from beam neutrals with the 
  type (type_beamletgroup),pointer :: beamletgroup(:) => null()  ! /nbi/nbi_unit(i)/beamletgroup(i) - Group of beamlets with common vertical and horizontal focal point. If there are no common focal poin
  type (type_nbi_nbi_unit_wall) :: wall  ! /nbi/nbi_unit(i)/wall - Description of the wall components in the NBI system that limits the beam spatial width of the beam.
  type (type_codeparam) :: codeparam  ! /nbi/nbi_unit(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype
  
type type_nbi_unit_mask  !    
  integer  :: name=0       ! /nbi/nbi_unit(i)/name - Name of the neutral beam injector
  type (type_inj_spec_mask) :: inj_spec  ! /nbi/nbi_unit(i)/inj_spec - Injected species
  type (type_exp0D_mask) :: pow_unit  ! /nbi/nbi_unit(i)/pow_unit - Power delivered by an NBI unit [W]; Time-dependent
  type (type_exp0D_mask) :: inj_eng_unit  ! /nbi/nbi_unit(i)/inj_eng_unit - Full injection energy of a unit [ev]; Time-dependent
  type (type_exp1D_mask) :: beamcurrfrac  ! /nbi/nbi_unit(i)/beamcurrfrac - Beam current fractions; beamcurrfrac(j) is the fraction of the beam current from beam neutrals with 
  type (type_exp1D_mask) :: beampowrfrac  ! /nbi/nbi_unit(i)/beampowrfrac - Beam power fractions; beampowrfrac(j) is the fraction of the beam power from beam neutrals with the 
  type (type_beamletgroup_mask),pointer :: beamletgroup(:) => null()  ! /nbi/nbi_unit(i)/beamletgroup(i) - Group of beamlets with common vertical and horizontal focal point. If there are no common focal poin
  type (type_nbi_nbi_unit_wall_mask) :: wall  ! /nbi/nbi_unit(i)/wall - Description of the wall components in the NBI system that limits the beam spatial width of the beam.
  type (type_codeparam_mask) :: codeparam  ! /nbi/nbi_unit(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype

  
type type_nbi  !    
  type (type_datainfo) :: datainfo  ! /nbi/datainfo - 
  type (type_nbi_unit),pointer :: nbi_unit(:) => null()  ! /nbi/nbi_unit(i) - Vector of Neutral Beam Injector units. The NBI system should be separated in to the individually pow
  type (type_codeparam) :: codeparam  ! /nbi/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /nbi/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_nbi_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /nbi/datainfo - 
  type (type_nbi_unit_mask),pointer :: nbi_unit(:) => null()  ! /nbi/nbi_unit(i) - Vector of Neutral Beam Injector units. The NBI system should be separated in to the individually pow
  type (type_codeparam_mask) :: codeparam  ! /nbi/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  integer  :: time=0       ! /nbi/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include ntm.xsd
  
type type_ntm_mode_onset  !    NTM onset characteristics. Time-dependent
  real(EUITM_R8)  :: w=-9.0E40_EUITM_R8       ! /w - Seed island full width [m]. Time-dependent.
  real(EUITM_R8)  :: time_onset=-9.0E40_EUITM_R8       ! /time_onset - Onset time [s]. Time-dependent.
  real(EUITM_R8)  :: time_offset=-9.0E40_EUITM_R8       ! /time_offset - Offset time [s] (when a mode disappears). If the mode reappears later in the simulation, use another
  real(EUITM_R8)  :: phase=-9.0E40_EUITM_R8       ! /phase - Phase of the mode at onset [rad]. Time-dependent.
  integer  :: n=-999999999       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=-999999999       ! /m - Poloidal mode number. Time-dependent.
  character(len=132), dimension(:), pointer ::description => null()       ! /description - Cause of the mode onset. Time-dependent.
endtype

  
type type_ntm_mode_full_evol_island  !    Island description
  real(EUITM_R8),pointer  :: geometry(:,:) => null()     ! /geometry - Description of island geometry [?]. Matrix(nradial, ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: coord_values(:,:) => null()     ! /coord_values - Radial coordinate values [?]. Matrix(nradial, ntime_evol). Time-dependent.
  character(len=132), dimension(:), pointer ::coord_desc => null()       ! /coord_desc - Description of flux label, use the same for all islands. Time-dependent.
endtype

  
type type_ntm_mode_full_evol  !    Detailed NTM evolution on a finer timebase than the CPO timebase. Time-dependent.
  real(EUITM_R8),pointer  :: time_evol(:) => null()     ! /time_evol - Time array used to describe the detailed mode evolution which can be different from the CPO timebase
  real(EUITM_R8),pointer  :: w(:) => null()     ! /w - Full width of the mode [m]. Vector(ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: dwdt(:) => null()     ! /dwdt - Time derivative of the full width of the mode [m/s]. Vector(ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: phase(:) => null()     ! /phase - Phase of the mode [rad]. Vector(ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: dphasedt(:) => null()     ! /dphasedt - Time-derivative of the phase of the mode [rad]. Vector(ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: frequency(:) => null()     ! /frequency - Frequency of the mode [Hz]. Vector(ntime_evol). Time-dependent.
  real(EUITM_R8),pointer  :: dfrequencydt(:) => null()     ! /dfrequencydt - time derivative of the frequency of the mode [Hz]. Vector(ntime_evol). Time-dependent.
  type (type_ntm_mode_full_evol_island) :: island  ! /island - Island description
  integer  :: n=-999999999       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=-999999999       ! /m - Poloidal mode number. Time-dependent.
  real(EUITM_R8),pointer  :: deltaw_value(:,:) => null()     ! /deltaw_value - Matrix(ntype, ntime_evol). Time-dependent.
  character(len=132), dimension(:), pointer ::deltaw_name => null()       ! /deltaw_name - Name of the deltaw contribution. String vector (ntype). Time-dependent.
  real(EUITM_R8),pointer  :: torque_value(:,:) => null()     ! /torque_value - Matrix(ntype_torque, ntime_evol). Time-dependent.
  character(len=132), dimension(:), pointer ::torque_name => null()       ! /torque_name - Name of the torque contribution. String vector (ntype_torque). Time-dependent.
  real(EUITM_R8),pointer  :: delta_diff(:,:) => null()     ! /delta_diff - Extra diffusion coefficient for Te, ne, Ti equation. Matrix(nequation, ntime_evol). Time-dependent.
  character(len=132), dimension(:), pointer ::description => null()       ! /description - How the mode evolution is calculated. Time-dependent.
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - [m]. Vector(ntime_evol) Time-dependent.
endtype

  
type type_ntm_mode_evolution_island  !    Island description
  real(EUITM_R8),pointer  :: geometry(:) => null()     ! /geometry - Description of island geometry [?]. Vector(nradial). Time-dependent.
  real(EUITM_R8),pointer  :: coord_values(:) => null()     ! /coord_values - Radial coordinate values [?]. Vector(nradial). Time-dependent.
  character(len=132), dimension(:), pointer ::coord_desc => null()       ! /coord_desc - Description of flux label, use the same for all islands. Time-dependent.
endtype

  
type type_ntm_mode_evolution  !    NTM evolution corresponding to the CPO timebase. Time-dependent.
  real(EUITM_R8)  :: w=-9.0E40_EUITM_R8       ! /w - Full width of the mode [m]. Time-dependent.
  real(EUITM_R8)  :: dwdt=-9.0E40_EUITM_R8       ! /dwdt - Time derivative of the full width of the mode [m/s].  Time-dependent.
  real(EUITM_R8)  :: phase=-9.0E40_EUITM_R8       ! /phase - Phase of the mode [rad].  Time-dependent.
  real(EUITM_R8)  :: dphasedt=-9.0E40_EUITM_R8       ! /dphasedt - Time-derivative of the phase of the mode [rad]. Time-dependent.
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /frequency - Frequency of the mode [Hz]. Time-dependent.
  real(EUITM_R8)  :: dfrequencydt=-9.0E40_EUITM_R8       ! /dfrequencydt - Time derivative of the frequency of the mode [Hz].  Time-dependent.
  type (type_ntm_mode_evolution_island) :: island  ! /island - Island description
  integer  :: n=-999999999       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=-999999999       ! /m - Poloidal mode number. Time-dependent.
  real(EUITM_R8),pointer  :: deltaw_value(:) => null()     ! /deltaw_value - Vector(ntype). Time-dependent.
  character(len=132), dimension(:), pointer ::deltaw_name => null()       ! /deltaw_name - Name of the deltaw contribution. String vector (ntype). Time-dependent.
  real(EUITM_R8),pointer  :: torque_value(:) => null()     ! /torque_value - Vector(ntype_torque). Time-dependent.
  character(len=132), dimension(:), pointer ::torque_name => null()       ! /torque_name - Name of the torque contribution. String vector (ntype). Time-dependent.
  real(EUITM_R8),pointer  :: delta_diff(:) => null()     ! /delta_diff - Extra diffusion coefficient for Te, ne, Ti equation. Vector(nequation). Time-dependent.
  character(len=132), dimension(:), pointer ::description => null()       ! /description - How the mode evolution is calculated. Time-dependent.
  real(EUITM_R8)  :: rho_tor=-9.0E40_EUITM_R8       ! /rho_tor - [m]. Time-dependent.
endtype

  
type type_ntm_mode  !    List of the various NTM modes appearing during the simulation. If a mode appears several times, use several indices in this arra o
  type (type_ntm_mode_onset) :: onset  ! /onset - NTM onset characteristics. Time-dependent
  type (type_ntm_mode_full_evol) :: full_evol  ! /full_evol - Detailed NTM evolution on a finer timebase than the CPO timebase. Time-dependent.
  type (type_ntm_mode_evolution) :: evolution  ! /evolution - NTM evolution corresponding to the CPO timebase. Time-dependent.
endtype
  
type type_ntm_mode_onset_mask  !    NTM onset characteristics. Time-dependent
  integer  :: w=0       ! /w - Seed island full width [m]. Time-dependent.
  integer  :: time_onset=0       ! /time_onset - Onset time [s]. Time-dependent.
  integer  :: time_offset=0       ! /time_offset - Offset time [s] (when a mode disappears). If the mode reappears later in the simulation, use another
  integer  :: phase=0       ! /phase - Phase of the mode at onset [rad]. Time-dependent.
  integer  :: n=0       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=0       ! /m - Poloidal mode number. Time-dependent.
  integer  :: description=0       ! /description - Cause of the mode onset. Time-dependent.
endtype
  
type type_ntm_mode_full_evol_island_mask  !    Island description
  integer  :: geometry=0       ! /geometry - Description of island geometry [?]. Matrix(nradial, ntime_evol). Time-dependent.
  integer  :: coord_values=0       ! /coord_values - Radial coordinate values [?]. Matrix(nradial, ntime_evol). Time-dependent.
  integer  :: coord_desc=0       ! /coord_desc - Description of flux label, use the same for all islands. Time-dependent.
endtype
  
type type_ntm_mode_full_evol_mask  !    Detailed NTM evolution on a finer timebase than the CPO timebase. Time-dependent.
  integer  :: time_evol=0       ! /time_evol - Time array used to describe the detailed mode evolution which can be different from the CPO timebase
  integer  :: w=0       ! /w - Full width of the mode [m]. Vector(ntime_evol). Time-dependent.
  integer  :: dwdt=0       ! /dwdt - Time derivative of the full width of the mode [m/s]. Vector(ntime_evol). Time-dependent.
  integer  :: phase=0       ! /phase - Phase of the mode [rad]. Vector(ntime_evol). Time-dependent.
  integer  :: dphasedt=0       ! /dphasedt - Time-derivative of the phase of the mode [rad]. Vector(ntime_evol). Time-dependent.
  integer  :: frequency=0       ! /frequency - Frequency of the mode [Hz]. Vector(ntime_evol). Time-dependent.
  integer  :: dfrequencydt=0       ! /dfrequencydt - time derivative of the frequency of the mode [Hz]. Vector(ntime_evol). Time-dependent.
  type (type_ntm_mode_full_evol_island_mask) :: island  ! /island - Island description
  integer  :: n=0       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=0       ! /m - Poloidal mode number. Time-dependent.
  integer  :: deltaw_value=0       ! /deltaw_value - Matrix(ntype, ntime_evol). Time-dependent.
  integer  :: deltaw_name=0       ! /deltaw_name - Name of the deltaw contribution. String vector (ntype). Time-dependent.
  integer  :: torque_value=0       ! /torque_value - Matrix(ntype_torque, ntime_evol). Time-dependent.
  integer  :: torque_name=0       ! /torque_name - Name of the torque contribution. String vector (ntype_torque). Time-dependent.
  integer  :: delta_diff=0       ! /delta_diff - Extra diffusion coefficient for Te, ne, Ti equation. Matrix(nequation, ntime_evol). Time-dependent.
  integer  :: description=0       ! /description - How the mode evolution is calculated. Time-dependent.
  integer  :: rho_tor=0       ! /rho_tor - [m]. Vector(ntime_evol) Time-dependent.
endtype
  
type type_ntm_mode_evolution_island_mask  !    Island description
  integer  :: geometry=0       ! /geometry - Description of island geometry [?]. Vector(nradial). Time-dependent.
  integer  :: coord_values=0       ! /coord_values - Radial coordinate values [?]. Vector(nradial). Time-dependent.
  integer  :: coord_desc=0       ! /coord_desc - Description of flux label, use the same for all islands. Time-dependent.
endtype
  
type type_ntm_mode_evolution_mask  !    NTM evolution corresponding to the CPO timebase. Time-dependent.
  integer  :: w=0       ! /w - Full width of the mode [m]. Time-dependent.
  integer  :: dwdt=0       ! /dwdt - Time derivative of the full width of the mode [m/s].  Time-dependent.
  integer  :: phase=0       ! /phase - Phase of the mode [rad].  Time-dependent.
  integer  :: dphasedt=0       ! /dphasedt - Time-derivative of the phase of the mode [rad]. Time-dependent.
  integer  :: frequency=0       ! /frequency - Frequency of the mode [Hz]. Time-dependent.
  integer  :: dfrequencydt=0       ! /dfrequencydt - Time derivative of the frequency of the mode [Hz].  Time-dependent.
  type (type_ntm_mode_evolution_island_mask) :: island  ! /island - Island description
  integer  :: n=0       ! /n - Toroidal mode number. Time-dependent.
  integer  :: m=0       ! /m - Poloidal mode number. Time-dependent.
  integer  :: deltaw_value=0       ! /deltaw_value - Vector(ntype). Time-dependent.
  integer  :: deltaw_name=0       ! /deltaw_name - Name of the deltaw contribution. String vector (ntype). Time-dependent.
  integer  :: torque_value=0       ! /torque_value - Vector(ntype_torque). Time-dependent.
  integer  :: torque_name=0       ! /torque_name - Name of the torque contribution. String vector (ntype). Time-dependent.
  integer  :: delta_diff=0       ! /delta_diff - Extra diffusion coefficient for Te, ne, Ti equation. Vector(nequation). Time-dependent.
  integer  :: description=0       ! /description - How the mode evolution is calculated. Time-dependent.
  integer  :: rho_tor=0       ! /rho_tor - [m]. Time-dependent.
endtype
  
type type_ntm_mode_mask  !    List of the various NTM modes appearing during the simulation. If a mode appears several times, use several indices in this arra o
  type (type_ntm_mode_onset_mask) :: onset  ! /onset - NTM onset characteristics. Time-dependent
  type (type_ntm_mode_full_evol_mask) :: full_evol  ! /full_evol - Detailed NTM evolution on a finer timebase than the CPO timebase. Time-dependent.
  type (type_ntm_mode_evolution_mask) :: evolution  ! /evolution - NTM evolution corresponding to the CPO timebase. Time-dependent.
endtype

  
type type_ntm  !    
  type (type_datainfo) :: datainfo  ! /ntm/datainfo - 
  type (type_ntm_mode),pointer :: mode(:) => null()  ! /ntm/mode(i) - List of the various NTM modes appearing during the simulation. If a mode appears several times, use 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /ntm/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam) :: codeparam  ! /ntm/codeparam - 
endtype
  
type type_ntm_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /ntm/datainfo - 
  type (type_ntm_mode_mask),pointer :: mode(:) => null()  ! /ntm/mode(i) - List of the various NTM modes appearing during the simulation. If a mode appears several times, use 
  integer  :: time=0       ! /ntm/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam_mask) :: codeparam  ! /ntm/codeparam - 
endtype

! ***********  Include neoclassic.xsd
  
type type_neoclassic_impurity  !    
  real(EUITM_R8),pointer  :: utheta_z(:,:) => null()     ! /utheta_z - Ion poloidal flow for various charge states [m/s].  Time-dependent. Matrix(nrho,nzimp).
endtype
  
type type_neoclassic_impurity_mask  !    
  integer  :: utheta_z=0       ! /utheta_z - Ion poloidal flow for various charge states [m/s].  Time-dependent. Matrix(nrho,nzimp).
endtype

  
type type_neoclassic  !    
  type (type_datainfo) :: datainfo  ! /neoclassic/datainfo - 
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /neoclassic/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /neoclassic/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  type (type_composition) :: composition  ! /neoclassic/composition - 
  type (type_desc_impur) :: desc_impur  ! /neoclassic/desc_impur - 
  type (type_compositions_type) :: compositions  ! /neoclassic/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_transcoefion) :: ni_neo  ! /neoclassic/ni_neo - Neoclassical transport coefficients for ion density equation. Time-dependent.
  type (type_transcoefel) :: ne_neo  ! /neoclassic/ne_neo - Neoclassical transport coefficients for electron density equation. Time-dependent.
  type (type_transcoefimp),pointer :: nz_neo(:) => null()  ! /neoclassic/nz_neo(i) - Neoclassical transport coefficients for impurity (multiple charge state) density equation. Time-depe
  type (type_transcoefion) :: ti_neo  ! /neoclassic/ti_neo - Neoclassical transport coefficients for ion temperature equation. Time-dependent.
  type (type_transcoefel) :: te_neo  ! /neoclassic/te_neo - Neoclassical transport coefficients for electron temperature equation. Time-dependent.
  type (type_transcoefimp),pointer :: tz_neo(:) => null()  ! /neoclassic/tz_neo(i) - Neoclassical transport coefficients for impurity (multiple charge state) temperature equation. Time-
  type (type_transcoefel) :: mtor_neo  ! /neoclassic/mtor_neo - Neoclassical transport coefficients for total toroidal momentum equation. Time-dependent.
  real(EUITM_R8),pointer  :: sigma(:) => null()     ! /neoclassic/sigma - Neoclassical conductivity [ohm^-1.m^-1]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: jboot(:) => null()     ! /neoclassic/jboot - Bootstrap current density [A.m^-2]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: er(:) => null()     ! /neoclassic/er - Radial electric field [V/m]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: vpol(:,:) => null()     ! /neoclassic/vpol - Neoclassical poloidal rotation of each ion species [m/s]. Time-dependent. Matrix(nrho,nion).
  real(EUITM_R8),pointer  :: vtor(:,:) => null()     ! /neoclassic/vtor - Neoclassical toroidal rotation of each ion species [m/s]. Time-dependent. Matrix(nrho,nion).
  real(EUITM_R8),pointer  :: mach(:,:) => null()     ! /neoclassic/mach - Mach number of each ion species. Time-dependent. Matrix(nrho,nion).
  real(EUITM_R8),pointer  :: utheta_e(:) => null()     ! /neoclassic/utheta_e - Electron poloidal flow [m/s]. Time-dependent. Vector(nrho).
  real(EUITM_R8),pointer  :: utheta_i(:,:) => null()     ! /neoclassic/utheta_i - Ion poloidal flow [m/s].  Time-dependent. Matrix(nrho,nion).
  real(EUITM_R8),pointer  :: viscosity_par(:,:) => null()     ! /neoclassic/viscosity_par - Ion parallel viscosity [?].  Time-dependent. Matrix(nrho,nion).
  type (type_neoclassic_impurity),pointer :: impurity(:) => null()  ! /neoclassic/impurity(i) - Array(nimp). Time-dependent
  real(EUITM_R8),pointer  :: fext(:,:,:) => null()     ! /neoclassic/fext - Moments of parallel external force on each ion species [T.J.m^-3]. Time-dependent. Array3D(nrho,nion
  real(EUITM_R8),pointer  :: jext(:) => null()     ! /neoclassic/jext - Current density response to fext [A.m^-2]. Time-dependent. Vector(nrho).
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /neoclassic/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam) :: codeparam  ! /neoclassic/codeparam - 
endtype
  
type type_neoclassic_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /neoclassic/datainfo - 
  integer  :: rho_tor_norm=0       ! /neoclassic/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: rho_tor=0       ! /neoclassic/rho_tor - Toroidal flux coordinate (not normalised, equivalent to rho_tor_norm) [m]; Vector (nrho). Time-depen
  type (type_composition_mask) :: composition  ! /neoclassic/composition - 
  type (type_desc_impur_mask) :: desc_impur  ! /neoclassic/desc_impur - 
  type (type_compositions_type_mask) :: compositions  ! /neoclassic/compositions - Contains all the composition information for the simulation (main ions, impurities, neutrals, edge s
  type (type_transcoefion_mask) :: ni_neo  ! /neoclassic/ni_neo - Neoclassical transport coefficients for ion density equation. Time-dependent.
  type (type_transcoefel_mask) :: ne_neo  ! /neoclassic/ne_neo - Neoclassical transport coefficients for electron density equation. Time-dependent.
  type (type_transcoefimp_mask),pointer :: nz_neo(:) => null()  ! /neoclassic/nz_neo(i) - Neoclassical transport coefficients for impurity (multiple charge state) density equation. Time-depe
  type (type_transcoefion_mask) :: ti_neo  ! /neoclassic/ti_neo - Neoclassical transport coefficients for ion temperature equation. Time-dependent.
  type (type_transcoefel_mask) :: te_neo  ! /neoclassic/te_neo - Neoclassical transport coefficients for electron temperature equation. Time-dependent.
  type (type_transcoefimp_mask),pointer :: tz_neo(:) => null()  ! /neoclassic/tz_neo(i) - Neoclassical transport coefficients for impurity (multiple charge state) temperature equation. Time-
  type (type_transcoefel_mask) :: mtor_neo  ! /neoclassic/mtor_neo - Neoclassical transport coefficients for total toroidal momentum equation. Time-dependent.
  integer  :: sigma=0       ! /neoclassic/sigma - Neoclassical conductivity [ohm^-1.m^-1]. Time-dependent. Vector(nrho).
  integer  :: jboot=0       ! /neoclassic/jboot - Bootstrap current density [A.m^-2]. Time-dependent. Vector(nrho).
  integer  :: er=0       ! /neoclassic/er - Radial electric field [V/m]. Time-dependent. Vector(nrho).
  integer  :: vpol=0       ! /neoclassic/vpol - Neoclassical poloidal rotation of each ion species [m/s]. Time-dependent. Matrix(nrho,nion).
  integer  :: vtor=0       ! /neoclassic/vtor - Neoclassical toroidal rotation of each ion species [m/s]. Time-dependent. Matrix(nrho,nion).
  integer  :: mach=0       ! /neoclassic/mach - Mach number of each ion species. Time-dependent. Matrix(nrho,nion).
  integer  :: utheta_e=0       ! /neoclassic/utheta_e - Electron poloidal flow [m/s]. Time-dependent. Vector(nrho).
  integer  :: utheta_i=0       ! /neoclassic/utheta_i - Ion poloidal flow [m/s].  Time-dependent. Matrix(nrho,nion).
  integer  :: viscosity_par=0       ! /neoclassic/viscosity_par - Ion parallel viscosity [?].  Time-dependent. Matrix(nrho,nion).
  type (type_neoclassic_impurity_mask),pointer :: impurity(:) => null()  ! /neoclassic/impurity(i) - Array(nimp). Time-dependent
  integer  :: fext=0       ! /neoclassic/fext - Moments of parallel external force on each ion species [T.J.m^-3]. Time-dependent. Array3D(nrho,nion
  integer  :: jext=0       ! /neoclassic/jext - Current density response to fext [A.m^-2]. Time-dependent. Vector(nrho).
  integer  :: time=0       ! /neoclassic/time - Time [s]; Time-dependent; Scalar.
  type (type_codeparam_mask) :: codeparam  ! /neoclassic/codeparam - 
endtype

! ***********  Include orbit.xsd
  
type type_orbit_pos  !    Complex type for orbit position (Vector)
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius [m]; Time-dependent; Vector (norbits). 
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Altitude [m]; Time-dependent; Vector (norbits).
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Toroidal angle [rad]; Time-dependent; Vector (norbits).
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Position in psi [normalised poloidal flux]; Time-dependent; Vector (norbits).
  real(EUITM_R8),pointer  :: theta_b(:) => null()     ! /theta_b - Poloidal Boozer angle [rad]; Time-dependent; Vector (norbits). 
endtype

  
type type_orbit_midplane  !    Intersections with the midplane
  type (type_orbit_pos) :: outer  ! /outer - Position at outer mid-plane
  type (type_orbit_pos) :: inner  ! /inner - Position at inner mid-plane
endtype

  
type type_orbit_turning_pts  !    Location of turning points
  type (type_orbit_pos) :: upper  ! /upper - Position at upper turning point
  type (type_orbit_pos) :: lower  ! /lower - Position at lower turning point
endtype

  
type type_orbit_special_pos  !    Special positions along an orbit (like turning points).
  type (type_orbit_midplane) :: midplane  ! /midplane - Intersections with the midplane
  type (type_orbit_turning_pts) :: turning_pts  ! /turning_pts - Location of turning points
endtype

  
type type_orbit_global_param  !    Global quantities associated with an orbit.
  integer,pointer  :: orbit_type(:) => null()      ! /orbit_type - Identifier of orbit type: 0 trapped, -1 co-passing, + 1 counter-passing ; Time-dependent; Vector (no
  real(EUITM_R8),pointer  :: omega_b(:) => null()     ! /omega_b - Bounce angular frequency rad/s; Time-dependent; Vector (norbits)
  real(EUITM_R8),pointer  :: omega_phi(:) => null()     ! /omega_phi - Toroidal angular precession frequency [rad/s]; Time-dependent; Vector (norbits).
  real(EUITM_R8),pointer  :: omega_c_av(:) => null()     ! /omega_c_av - Orbit averaged cyclotron frequency [rad/a]; Time-dependent; Vector(norbits).
  type (type_orbit_special_pos) :: special_pos  ! /special_pos - Special positions along an orbit (like turning points).
endtype
  
type type_orbit_pos_mask  !    Complex type for orbit position (Vector)
  integer  :: r=0       ! /r - Major radius [m]; Time-dependent; Vector (norbits). 
  integer  :: z=0       ! /z - Altitude [m]; Time-dependent; Vector (norbits).
  integer  :: phi=0       ! /phi - Toroidal angle [rad]; Time-dependent; Vector (norbits).
  integer  :: psi=0       ! /psi - Position in psi [normalised poloidal flux]; Time-dependent; Vector (norbits).
  integer  :: theta_b=0       ! /theta_b - Poloidal Boozer angle [rad]; Time-dependent; Vector (norbits). 
endtype
  
type type_orbit_midplane_mask  !    Intersections with the midplane
  type (type_orbit_pos_mask) :: outer  ! /outer - Position at outer mid-plane
  type (type_orbit_pos_mask) :: inner  ! /inner - Position at inner mid-plane
endtype
  
type type_orbit_turning_pts_mask  !    Location of turning points
  type (type_orbit_pos_mask) :: upper  ! /upper - Position at upper turning point
  type (type_orbit_pos_mask) :: lower  ! /lower - Position at lower turning point
endtype
  
type type_orbit_special_pos_mask  !    Special positions along an orbit (like turning points).
  type (type_orbit_midplane_mask) :: midplane  ! /midplane - Intersections with the midplane
  type (type_orbit_turning_pts_mask) :: turning_pts  ! /turning_pts - Location of turning points
endtype
  
type type_orbit_global_param_mask  !    Global quantities associated with an orbit.
  integer  :: orbit_type=0       ! /orbit_type - Identifier of orbit type: 0 trapped, -1 co-passing, + 1 counter-passing ; Time-dependent; Vector (no
  integer  :: omega_b=0       ! /omega_b - Bounce angular frequency rad/s; Time-dependent; Vector (norbits)
  integer  :: omega_phi=0       ! /omega_phi - Toroidal angular precession frequency [rad/s]; Time-dependent; Vector (norbits).
  integer  :: omega_c_av=0       ! /omega_c_av - Orbit averaged cyclotron frequency [rad/a]; Time-dependent; Vector(norbits).
  type (type_orbit_special_pos_mask) :: special_pos  ! /special_pos - Special positions along an orbit (like turning points).
endtype

  
type type_com  !    
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /orbit/com/amn - Atomic mass of the particle; Scalar
  real(EUITM_R8)  :: zion=-9.0E40_EUITM_R8       ! /orbit/com/zion - Atomic charge of the particle; Scalar
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /orbit/com/energy - Energy of the particle [keV]; Time-dependent; Vector (norbits).
  real(EUITM_R8),pointer  :: magn_mom(:) => null()     ! /orbit/com/magn_mom - Magnetic momentum [kg m^2 / s^2 / T]; Time-dependent, Vector(norbits).
  real(EUITM_R8),pointer  :: p_phi(:) => null()     ! /orbit/com/p_phi - toroidal angular momentum [kg m^2 / s]; Time-dependent; Vector(norbits);
  integer,pointer  :: sigma(:) => null()      ! /orbit/com/sigma - Sign of parallel velocity at psi=psi_max along the orbit; Time-dependent; Vector(norbits)
endtype

  
type type_trace  !    
  real(EUITM_R8),pointer  :: time_orb(:,:) => null()     ! /orbit/trace/time_orb - Time along the orbit  [s]; Time-dependent; Matrix (norbits, max_ntorb)
  integer,pointer  :: ntorb(:) => null()      ! /orbit/trace/ntorb - Number of time slices along the orbit, for each orbit. Time-dependent; Vector (norbits)
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /orbit/trace/r - Major radius of the guiding centre [m], Major radius; Time-dependent; Matrix (norbits, max_ntorb). 
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /orbit/trace/z - Altitude of the guiding centre [m]; Time-dependent; Matrix (norbits, max_ntorb).
  real(EUITM_R8),pointer  :: phi(:,:) => null()     ! /orbit/trace/phi - Toroidal angle of the guiding centre [rad]; Time-dependent; Matrix (norbits, max_ntorb).
  real(EUITM_R8),pointer  :: psi(:,:) => null()     ! /orbit/trace/psi - Guiding centre position in psi [normalised poloidal flux]; Time-dependent; Matrix (norbits, max_ntor
  real(EUITM_R8),pointer  :: theta_b(:,:) => null()     ! /orbit/trace/theta_b - Position of the guiding centre in poloidal Boozer angle [rad]; Time-dependent; Matrix (norbits, max_
  real(EUITM_R8),pointer  :: v_parallel(:,:) => null()     ! /orbit/trace/v_parallel - Parallel velocity along the orbit [m/s]; Time-dependent; Matrix (norbits, max_ntorb).
  real(EUITM_R8),pointer  :: v_perp(:,:) => null()     ! /orbit/trace/v_perp - Perpendicular velocity along the orbit [m/s]; Time-dependent; Matrix (norbits, max_ntorb).
endtype
  
type type_com_mask  !    
  integer  :: amn=0       ! /orbit/com/amn - Atomic mass of the particle; Scalar
  integer  :: zion=0       ! /orbit/com/zion - Atomic charge of the particle; Scalar
  integer  :: energy=0       ! /orbit/com/energy - Energy of the particle [keV]; Time-dependent; Vector (norbits).
  integer  :: magn_mom=0       ! /orbit/com/magn_mom - Magnetic momentum [kg m^2 / s^2 / T]; Time-dependent, Vector(norbits).
  integer  :: p_phi=0       ! /orbit/com/p_phi - toroidal angular momentum [kg m^2 / s]; Time-dependent; Vector(norbits);
  integer  :: sigma=0       ! /orbit/com/sigma - Sign of parallel velocity at psi=psi_max along the orbit; Time-dependent; Vector(norbits)
endtype
  
type type_trace_mask  !    
  integer  :: time_orb=0       ! /orbit/trace/time_orb - Time along the orbit  [s]; Time-dependent; Matrix (norbits, max_ntorb)
  integer  :: ntorb=0       ! /orbit/trace/ntorb - Number of time slices along the orbit, for each orbit. Time-dependent; Vector (norbits)
  integer  :: r=0       ! /orbit/trace/r - Major radius of the guiding centre [m], Major radius; Time-dependent; Matrix (norbits, max_ntorb). 
  integer  :: z=0       ! /orbit/trace/z - Altitude of the guiding centre [m]; Time-dependent; Matrix (norbits, max_ntorb).
  integer  :: phi=0       ! /orbit/trace/phi - Toroidal angle of the guiding centre [rad]; Time-dependent; Matrix (norbits, max_ntorb).
  integer  :: psi=0       ! /orbit/trace/psi - Guiding centre position in psi [normalised poloidal flux]; Time-dependent; Matrix (norbits, max_ntor
  integer  :: theta_b=0       ! /orbit/trace/theta_b - Position of the guiding centre in poloidal Boozer angle [rad]; Time-dependent; Matrix (norbits, max_
  integer  :: v_parallel=0       ! /orbit/trace/v_parallel - Parallel velocity along the orbit [m/s]; Time-dependent; Matrix (norbits, max_ntorb).
  integer  :: v_perp=0       ! /orbit/trace/v_perp - Perpendicular velocity along the orbit [m/s]; Time-dependent; Matrix (norbits, max_ntorb).
endtype

  
type type_orbit  !    
  type (type_datainfo) :: datainfo  ! /orbit/datainfo - 
  type (type_com) :: com  ! /orbit/com - COM (Constants Of Motion) parameters identifying an orbit
  type (type_trace) :: trace  ! /orbit/trace - Position of particle in 5D space (3D in real and 2D in velocity).
  type (type_orbit_global_param) :: global_param  ! /orbit/global_param - Global quantities associated with an orbit.
  type (type_codeparam) :: codeparam  ! /orbit/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /orbit/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_orbit_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /orbit/datainfo - 
  type (type_com_mask) :: com  ! /orbit/com - COM (Constants Of Motion) parameters identifying an orbit
  type (type_trace_mask) :: trace  ! /orbit/trace - Position of particle in 5D space (3D in real and 2D in velocity).
  type (type_orbit_global_param_mask) :: global_param  ! /orbit/global_param - Global quantities associated with an orbit.
  type (type_codeparam_mask) :: codeparam  ! /orbit/codeparam - 
  integer  :: time=0       ! /orbit/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include pellets.xsd
  
type type_pellet_shape  !    Structure defining the shape of the pellet. Time-dependent.
  type (type_identifier) :: type  ! /type - Identifier for the shape of the pellet: 1-spherical; 2-cylindrical; 3-rectangular; 4-generic.  Time-
  real(EUITM_R8),pointer  :: dimensions(:) => null()     ! /dimensions - Vector specifying the dimensions of the pellet following the order for predefined shapes. Spherical 
endtype

  
type type_pellet_elements  !    Structure defining the composition of the pellet. Time-dependent.
  integer,pointer  :: nucindex(:) => null()      ! /nucindex - Index into list of nuclei, array over elements in pellet (NATM). Time-dependent.
  real(EUITM_R8),pointer  :: density(:) => null()     ! /density - Material density of each element of the pellet, array over elements (NATM). Time-dependent.
  real(EUITM_R8),pointer  :: fraction(:) => null()     ! /fraction - Fraction of each element in the pellet, array over elements in pellet (NATM). Time-dependent.
  real(EUITM_R8),pointer  :: subl_energy(:) => null()     ! /subl_energy - Sublimation energy per atom, array over elements in pellet (NATM). Time-dependent.
endtype

  
type type_pellet_angles  !    Angles of the pellet trajectory. Time-dependent.
  real(EUITM_R8)  :: horizontal=-9.0E40_EUITM_R8       ! /horizontal - Angle [rad] of the horizontal projection of the path with poloidal cross section (0 for HFS , then c
  real(EUITM_R8)  :: vertical=-9.0E40_EUITM_R8       ! /vertical - Angle [rad] of the path with vertical axis section (0 for bottom-top trajectory, then counter clockw
endtype

  
type type_pellet_geometry  !    Structure describing the geometry of the pellet path. Time-dependent.
  type (type_rzphi0D) :: pivot_point  ! /pivot_point - Coordinates of the pivot point for pellet trajectory. Time-dependent.
  type (type_rzphi0D) :: second_point  ! /second_point - Coordinates of the second point for pellet trajectory. Time-dependent.
  real(EUITM_R8)  :: velocity=-9.0E40_EUITM_R8       ! /velocity - Starting velocity of the pellet [m/s]. Scalar. Time-dependent.
  type (type_pellet_angles) :: angles  ! /angles - Angles of the pellet trajectory. Time-dependent.
endtype

  
type type_pellet_pathprofiles  !    Structure describing 1-D profiles of plasma and pellet along the pellet path. Time-dependent.
  real(EUITM_R8),pointer  :: distance(:) => null()     ! /distance - Coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: rho_pol(:) => null()     ! /rho_pol - Poloidal flux coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: velocity(:) => null()     ! /velocity - Pellet velocity along the pellet trajectory [m/s], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Electron density along the pellet trajectory [m^-3], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: te(:) => null()     ! /te - Electron temperature along the pellet trajectory [eV], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: abl_rate(:) => null()     ! /abl_rate - Ablation rate along the pellet trajectory [part/s], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: abl_particles(:) => null()     ! /abl_particles - Number of ablated particles along the pellet trajectory [part], array (NPATH). Time-dependent.
  real(EUITM_R8),pointer  :: delta_drift(:) => null()     ! /delta_drift - Radial displacement due to ExB drifts along the pellet trajectory [m], array (NPATH). Time-dependent
  type (type_rzphi1D) :: position  ! /position - Coordinates of the pellet trajectory line, array (NPATH). Time-dependent.
endtype

  
type type_pellet_impurity  !    Contributions to impurity array of structures (NIMP).  Time-dependent
  real(EUITM_R8),pointer  :: delta_nz(:,:) => null()     ! /delta_nz - Instant change of Nz profile (per charge state) due to pellet ablation [m^-3], array (NRHO, NZIMP). 
endtype

  
type type_pellet_deposition  !    Structure defining the pellet action on the plasma (along rho_tor). Time-dependent.
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate [m], array (NRHO). Time-dependent.
  real(EUITM_R8),pointer  :: rho_pol(:) => null()     ! /rho_pol - Poloidal flux coordinate [m], array(NRHO). Time-dependent.
  real(EUITM_R8),pointer  :: delta_ne(:) => null()     ! /delta_ne - Instant change of ne profile due to pellet ablation [m^-3], array(NRHO). Time-dependent.
  real(EUITM_R8),pointer  :: delta_te(:) => null()     ! /delta_te - Instant change of Te profile  due to pellet ablation [eV], array(NRHO). Time-dependent.
  real(EUITM_R8),pointer  :: delta_ni(:,:) => null()     ! /delta_ni - Instant change of ni profile due to pellet ablation [m^-3], array (NRHO, NION). Time-dependent.
  real(EUITM_R8),pointer  :: delta_ti(:,:) => null()     ! /delta_ti - Instant change of Ti profile due to pellet ablation [eV], array (NRHO, NION). Time-dependent.

  real(EUITM_R8),pointer  :: delta_vtor(:,:) => null()     ! /delta_vtor - Instant change of Vtor profile due to pellet ablation [m/s], array (NRHO, NION). Time-dependent.

  type (type_pellet_impurity),pointer :: impurity(:) => null()  ! /impurity(i) - Contributions to impurity array of structures (NIMP).  Time-dependent
endtype

  
type type_pellet  !    Description of the pellets entering the plasma at given time. Array of structures (NPEL). Time-dependent.
  type (type_pellet_shape) :: shape  ! /shape - Structure defining the shape of the pellet. Time-dependent.
  type (type_pellet_elements) :: elements  ! /elements - Structure defining the composition of the pellet. Time-dependent.

  type (type_pellet_geometry) :: geometry  ! /geometry - Structure describing the geometry of the pellet path. Time-dependent.
  type (type_pellet_pathprofiles) :: pathprofiles  ! /pathprofiles - Structure describing 1-D profiles of plasma and pellet along the pellet path. Time-dependent.
  type (type_pellet_deposition) :: deposition  ! /deposition - Structure defining the pellet action on the plasma (along rho_tor). Time-dependent.
endtype
  
type type_pellet_shape_mask  !    Structure defining the shape of the pellet. Time-dependent.
  type (type_identifier_mask) :: type  ! /type - Identifier for the shape of the pellet: 1-spherical; 2-cylindrical; 3-rectangular; 4-generic.  Time-
  integer  :: dimensions=0       ! /dimensions - Vector specifying the dimensions of the pellet following the order for predefined shapes. Spherical 
endtype
  
type type_pellet_elements_mask  !    Structure defining the composition of the pellet. Time-dependent.
  integer  :: nucindex=0       ! /nucindex - Index into list of nuclei, array over elements in pellet (NATM). Time-dependent.
  integer  :: density=0       ! /density - Material density of each element of the pellet, array over elements (NATM). Time-dependent.
  integer  :: fraction=0       ! /fraction - Fraction of each element in the pellet, array over elements in pellet (NATM). Time-dependent.
  integer  :: subl_energy=0       ! /subl_energy - Sublimation energy per atom, array over elements in pellet (NATM). Time-dependent.
endtype
  
type type_pellet_angles_mask  !    Angles of the pellet trajectory. Time-dependent.
  integer  :: horizontal=0       ! /horizontal - Angle [rad] of the horizontal projection of the path with poloidal cross section (0 for HFS , then c
  integer  :: vertical=0       ! /vertical - Angle [rad] of the path with vertical axis section (0 for bottom-top trajectory, then counter clockw
endtype
  
type type_pellet_geometry_mask  !    Structure describing the geometry of the pellet path. Time-dependent.
  type (type_rzphi0D_mask) :: pivot_point  ! /pivot_point - Coordinates of the pivot point for pellet trajectory. Time-dependent.
  type (type_rzphi0D_mask) :: second_point  ! /second_point - Coordinates of the second point for pellet trajectory. Time-dependent.
  integer  :: velocity=0       ! /velocity - Starting velocity of the pellet [m/s]. Scalar. Time-dependent.
  type (type_pellet_angles_mask) :: angles  ! /angles - Angles of the pellet trajectory. Time-dependent.
endtype
  
type type_pellet_pathprofiles_mask  !    Structure describing 1-D profiles of plasma and pellet along the pellet path. Time-dependent.
  integer  :: distance=0       ! /distance - Coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  integer  :: rho_pol=0       ! /rho_pol - Poloidal flux coordinate along the pellet trajectory [m], array (NPATH). Time-dependent.
  integer  :: velocity=0       ! /velocity - Pellet velocity along the pellet trajectory [m/s], array (NPATH). Time-dependent.
  integer  :: ne=0       ! /ne - Electron density along the pellet trajectory [m^-3], array (NPATH). Time-dependent.
  integer  :: te=0       ! /te - Electron temperature along the pellet trajectory [eV], array (NPATH). Time-dependent.
  integer  :: abl_rate=0       ! /abl_rate - Ablation rate along the pellet trajectory [part/s], array (NPATH). Time-dependent.
  integer  :: abl_particles=0       ! /abl_particles - Number of ablated particles along the pellet trajectory [part], array (NPATH). Time-dependent.
  integer  :: delta_drift=0       ! /delta_drift - Radial displacement due to ExB drifts along the pellet trajectory [m], array (NPATH). Time-dependent
  type (type_rzphi1D_mask) :: position  ! /position - Coordinates of the pellet trajectory line, array (NPATH). Time-dependent.
endtype
  
type type_pellet_impurity_mask  !    Contributions to impurity array of structures (NIMP).  Time-dependent
  integer  :: delta_nz=0       ! /delta_nz - Instant change of Nz profile (per charge state) due to pellet ablation [m^-3], array (NRHO, NZIMP). 
endtype
  
type type_pellet_deposition_mask  !    Structure defining the pellet action on the plasma (along rho_tor). Time-dependent.
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m], array (NRHO). Time-dependent.
  integer  :: rho_pol=0       ! /rho_pol - Poloidal flux coordinate [m], array(NRHO). Time-dependent.
  integer  :: delta_ne=0       ! /delta_ne - Instant change of ne profile due to pellet ablation [m^-3], array(NRHO). Time-dependent.
  integer  :: delta_te=0       ! /delta_te - Instant change of Te profile  due to pellet ablation [eV], array(NRHO). Time-dependent.
  integer  :: delta_ni=0       ! /delta_ni - Instant change of ni profile due to pellet ablation [m^-3], array (NRHO, NION). Time-dependent.
  integer  :: delta_ti=0       ! /delta_ti - Instant change of Ti profile due to pellet ablation [eV], array (NRHO, NION). Time-dependent.

  integer  :: delta_vtor=0       ! /delta_vtor - Instant change of Vtor profile due to pellet ablation [m/s], array (NRHO, NION). Time-dependent.

  type (type_pellet_impurity_mask),pointer :: impurity(:) => null()  ! /impurity(i) - Contributions to impurity array of structures (NIMP).  Time-dependent
endtype
  
type type_pellet_mask  !    Description of the pellets entering the plasma at given time. Array of structures (NPEL). Time-dependent.
  type (type_pellet_shape_mask) :: shape  ! /shape - Structure defining the shape of the pellet. Time-dependent.
  type (type_pellet_elements_mask) :: elements  ! /elements - Structure defining the composition of the pellet. Time-dependent.

  type (type_pellet_geometry_mask) :: geometry  ! /geometry - Structure describing the geometry of the pellet path. Time-dependent.
  type (type_pellet_pathprofiles_mask) :: pathprofiles  ! /pathprofiles - Structure describing 1-D profiles of plasma and pellet along the pellet path. Time-dependent.
  type (type_pellet_deposition_mask) :: deposition  ! /deposition - Structure defining the pellet action on the plasma (along rho_tor). Time-dependent.
endtype

  
type type_pellets  !    
  type (type_datainfo) :: datainfo  ! /pellets/datainfo - 
  type (type_compositions_type) :: compositions  ! /pellets/compositions - Pellet composition
  type (type_pellet),pointer :: pellet(:) => null()  ! /pellets/pellet(i) - Description of the pellets entering the plasma at given time. Array of structures (NPEL). Time-depen
  type (type_codeparam) :: codeparam  ! /pellets/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /pellets/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_pellets_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /pellets/datainfo - 
  type (type_compositions_type_mask) :: compositions  ! /pellets/compositions - Pellet composition
  type (type_pellet_mask),pointer :: pellet(:) => null()  ! /pellets/pellet(i) - Description of the pellets entering the plasma at given time. Array of structures (NPEL). Time-depen
  type (type_codeparam_mask) :: codeparam  ! /pellets/codeparam - 
  integer  :: time=0       ! /pellets/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include pfgeometry.xsd
  
type type_pfgeometry  !    
  integer,pointer  :: type(:,:) => null()     ! /pfgeometry/type - Type used to describe a coil shape (0 for 'rzcoordinates' or 1 for 'rzdrdz'); Matrix of integers (nc
  integer,pointer  :: npoints(:,:) => null()     ! /pfgeometry/npoints - Number of points describing an element (irregular outline rzcoordinates); Matrix (ncoils,max_nelemen
  type (type_rz3D) :: rzcoordinate  ! /pfgeometry/rzcoordinate - Irregular outline [m]; 3D arrays (ncoils,max_nelements,max_npoints)
  real(EUITM_R8),pointer  :: rzdrdz(:,:,:) => null()     ! /pfgeometry/rzdrdz - 4-vector defining Centre R,Z and full extents dR, dZ [m]; 3D Array (ncoils,max_nelements,4)
endtype
  
type type_pfgeometry_mask  !    
  integer  :: type=0       ! /pfgeometry/type - Type used to describe a coil shape (0 for 'rzcoordinates' or 1 for 'rzdrdz'); Matrix of integers (nc
  integer  :: npoints=0       ! /pfgeometry/npoints - Number of points describing an element (irregular outline rzcoordinates); Matrix (ncoils,max_nelemen
  type (type_rz3D_mask) :: rzcoordinate  ! /pfgeometry/rzcoordinate - Irregular outline [m]; 3D arrays (ncoils,max_nelements,max_npoints)
  integer  :: rzdrdz=0       ! /pfgeometry/rzdrdz - 4-vector defining Centre R,Z and full extents dR, dZ [m]; 3D Array (ncoils,max_nelements,4)
endtype

! ***********  Include pfelement.xsd
  
type type_pfelement  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /pfelement/name - Name of this element. Should be a matrix of strings (ncoils,max_nelements), but not supported by the
  character(len=132), dimension(:), pointer ::id => null()       ! /pfelement/id - ID of this element. Should be a matrix of strings (ncoils,max_nelements), but not supported by the U
  real(EUITM_R8),pointer  :: turnsign(:,:) => null()     ! /pfelement/turnsign - Sign of turn and fraction of a turn for calculating magnetic field of the Element; Matrix (ncoils,ma
  real(EUITM_R8),pointer  :: area(:,:) => null()     ! /pfelement/area - Surface area of this element [m^2]; Matrix (ncoils,max_nelements)
  type (type_pfgeometry) :: pfgeometry  ! /pfelement/pfgeometry - 
endtype
  
type type_pfelement_mask  !    
  integer  :: name=0       ! /pfelement/name - Name of this element. Should be a matrix of strings (ncoils,max_nelements), but not supported by the
  integer  :: id=0       ! /pfelement/id - ID of this element. Should be a matrix of strings (ncoils,max_nelements), but not supported by the U
  integer  :: turnsign=0       ! /pfelement/turnsign - Sign of turn and fraction of a turn for calculating magnetic field of the Element; Matrix (ncoils,ma
  integer  :: area=0       ! /pfelement/area - Surface area of this element [m^2]; Matrix (ncoils,max_nelements)
  type (type_pfgeometry_mask) :: pfgeometry  ! /pfelement/pfgeometry - 
endtype

! ***********  Include pfcircuits.xsd
  
type type_pfcircuits  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /pfcircuits/name - Name of circuit, array of strings (ncircuits)
  character(len=132), dimension(:), pointer ::id => null()       ! /pfcircuits/id - ID of circuit, array of strings (ncircuits)
  character(len=132), dimension(:), pointer ::type => null()       ! /pfcircuits/type - Type of circuit, array of strings (ncircuits)
  integer,pointer  :: nnodes(:) => null()      ! /pfcircuits/nnodes - Number of nodes used to describe a circuit. Vector (ncircuits)
  integer,pointer  :: connections(:,:,:) => null()     ! /pfcircuits/connections - Description of the supplies and coils connections (nodes) across each circuit. Array 3D (ncircuits,m
endtype
  
type type_pfcircuits_mask  !    
  integer  :: name=0       ! /pfcircuits/name - Name of circuit, array of strings (ncircuits)
  integer  :: id=0       ! /pfcircuits/id - ID of circuit, array of strings (ncircuits)
  integer  :: type=0       ! /pfcircuits/type - Type of circuit, array of strings (ncircuits)
  integer  :: nnodes=0       ! /pfcircuits/nnodes - Number of nodes used to describe a circuit. Vector (ncircuits)
  integer  :: connections=0       ! /pfcircuits/connections - Description of the supplies and coils connections (nodes) across each circuit. Array 3D (ncircuits,m
endtype

! ***********  Include pfcoils.xsd
  
type type_structure_cs  !    
  real(EUITM_R8)  :: gaptf=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/gaptf - gap between CS external radius and TF internal vault radius [m]; Scalar
  real(EUITM_R8)  :: ri=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/ri - CS internal radius [m]; Scalar
  real(EUITM_R8)  :: re=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/re - CS external radius [m]; Scalar
  real(EUITM_R8)  :: jcable=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/jcable - Maximum allowable CS Cable In Conduit current density [A/m^2]; Scalar
  real(EUITM_R8)  :: current_nom=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/current_nom - Nominal current in the CS conductor [A]; Scalar
  real(EUITM_R8)  :: sigma=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/sigma - Maximum allowable stress in the CS [Pa]; Scalar
  real(EUITM_R8)  :: tiso=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/tiso - Insulation thickness of CS conductor [m]; Scalar
  real(EUITM_R8)  :: nlay=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/structure_cs/nlay - Number of conductor layers in the Central Solenoid; Scalar
endtype
  
type type_structure_cs_mask  !    
  integer  :: gaptf=0       ! /pfcoils/desc_pfcoils/structure_cs/gaptf - gap between CS external radius and TF internal vault radius [m]; Scalar
  integer  :: ri=0       ! /pfcoils/desc_pfcoils/structure_cs/ri - CS internal radius [m]; Scalar
  integer  :: re=0       ! /pfcoils/desc_pfcoils/structure_cs/re - CS external radius [m]; Scalar
  integer  :: jcable=0       ! /pfcoils/desc_pfcoils/structure_cs/jcable - Maximum allowable CS Cable In Conduit current density [A/m^2]; Scalar
  integer  :: current_nom=0       ! /pfcoils/desc_pfcoils/structure_cs/current_nom - Nominal current in the CS conductor [A]; Scalar
  integer  :: sigma=0       ! /pfcoils/desc_pfcoils/structure_cs/sigma - Maximum allowable stress in the CS [Pa]; Scalar
  integer  :: tiso=0       ! /pfcoils/desc_pfcoils/structure_cs/tiso - Insulation thickness of CS conductor [m]; Scalar
  integer  :: nlay=0       ! /pfcoils/desc_pfcoils/structure_cs/nlay - Number of conductor layers in the Central Solenoid; Scalar
endtype

  
type type_desc_pfcoils  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /pfcoils/desc_pfcoils/name - Name of coil. Array of strings (ncoils)
  character(len=132), dimension(:), pointer ::id => null()       ! /pfcoils/desc_pfcoils/id - ID of coil. Array of strings (ncoils)
  real(EUITM_R8),pointer  :: res(:) => null()     ! /pfcoils/desc_pfcoils/res - Coil resistance [Ohm]; Vector (ncoils)
  real(EUITM_R8),pointer  :: emax(:) => null()     ! /pfcoils/desc_pfcoils/emax - Maximum Energy to be dissipated in coils [J]; Vector (ncoils)
  type (type_structure_cs) :: structure_cs  ! /pfcoils/desc_pfcoils/structure_cs - Detailed description of the coil structure, for coils that are part of the central solenoid.
  real(EUITM_R8)  :: pol_flux_cs=-9.0E40_EUITM_R8       ! /pfcoils/desc_pfcoils/pol_flux_cs - Maximum poloidal flux available in the Central Solenoid for a plasma pulse [Wb].
  integer,pointer  :: nelement(:) => null()      ! /pfcoils/desc_pfcoils/nelement - Number of elements used to describe a coil; Vector (ncoils)
  type (type_pfelement) :: pfelement  ! /pfcoils/desc_pfcoils/pfelement - Filament describing part of the coil as a rectangle
endtype
  
type type_desc_pfcoils_mask  !    
  integer  :: name=0       ! /pfcoils/desc_pfcoils/name - Name of coil. Array of strings (ncoils)
  integer  :: id=0       ! /pfcoils/desc_pfcoils/id - ID of coil. Array of strings (ncoils)
  integer  :: res=0       ! /pfcoils/desc_pfcoils/res - Coil resistance [Ohm]; Vector (ncoils)
  integer  :: emax=0       ! /pfcoils/desc_pfcoils/emax - Maximum Energy to be dissipated in coils [J]; Vector (ncoils)
  type (type_structure_cs_mask) :: structure_cs  ! /pfcoils/desc_pfcoils/structure_cs - Detailed description of the coil structure, for coils that are part of the central solenoid.
  integer  :: pol_flux_cs=0       ! /pfcoils/desc_pfcoils/pol_flux_cs - Maximum poloidal flux available in the Central Solenoid for a plasma pulse [Wb].
  integer  :: nelement=0       ! /pfcoils/desc_pfcoils/nelement - Number of elements used to describe a coil; Vector (ncoils)
  type (type_pfelement_mask) :: pfelement  ! /pfcoils/desc_pfcoils/pfelement - Filament describing part of the coil as a rectangle
endtype

  
type type_pfcoils  !    
  type (type_desc_pfcoils) :: desc_pfcoils  ! /pfcoils/desc_pfcoils - Description of the coils
  type (type_exp1D) :: coilcurrent  ! /pfcoils/coilcurrent - Circuit feed current in the coil, defined positive if it flows from point 1 to point 2 of the compon
  type (type_exp1D) :: coilvoltage  ! /pfcoils/coilvoltage - Voltage on the full coil [V]; Time-dependent; Vector (ncoils)
  real(EUITM_R8)  :: p_cryo=-9.0E40_EUITM_R8       ! /pfcoils/p_cryo - Total electric power consumed by the cryoplant system [W]; Time-dependent. Scalar.
  real(EUITM_R8),pointer  :: p_nh(:) => null()     ! /pfcoils/p_nh - Nuclear heating on the poloidal field coils [W]; Time-dependent. Vector(ncoils)
endtype
  
type type_pfcoils_mask  !    
  type (type_desc_pfcoils_mask) :: desc_pfcoils  ! /pfcoils/desc_pfcoils - Description of the coils
  type (type_exp1D_mask) :: coilcurrent  ! /pfcoils/coilcurrent - Circuit feed current in the coil, defined positive if it flows from point 1 to point 2 of the compon
  type (type_exp1D_mask) :: coilvoltage  ! /pfcoils/coilvoltage - Voltage on the full coil [V]; Time-dependent; Vector (ncoils)
  integer  :: p_cryo=0       ! /pfcoils/p_cryo - Total electric power consumed by the cryoplant system [W]; Time-dependent. Scalar.
  integer  :: p_nh=0       ! /pfcoils/p_nh - Nuclear heating on the poloidal field coils [W]; Time-dependent. Vector(ncoils)
endtype

! ***********  Include pfpassive.xsd
  
type type_pfpassive_current  !    Current induced in passive structures.
  type (type_exp1D) :: toroidal  ! /toroidal - Toroidal current induced in passive structures [A]. Vector (nelements); Time-dependent
  type (type_exp1D) :: poloidal  ! /poloidal - Poloidal current induced in passive structures [A]. Vector (nelements); Time-dependent
endtype
  
type type_pfpassive_current_mask  !    Current induced in passive structures.
  type (type_exp1D_mask) :: toroidal  ! /toroidal - Toroidal current induced in passive structures [A]. Vector (nelements); Time-dependent
  type (type_exp1D_mask) :: poloidal  ! /poloidal - Poloidal current induced in passive structures [A]. Vector (nelements); Time-dependent
endtype

  
type type_pfpageometry  !    
  integer,pointer  :: type(:) => null()      ! /pfpassive/pfpageometry/type - Type used to describe the shape (0 for 'rzcoordinates' or 1 for 'rzdrdz'); Vector of integers (nelem
  integer,pointer  :: npoints(:) => null()      ! /pfpassive/pfpageometry/npoints - Number of points describing an element (irregular outline rzcoordinates); Vector of integers (neleme
  type (type_rz2D) :: rzcoordinate  ! /pfpassive/pfpageometry/rzcoordinate - Irregular outline [m]; Matrix (nelements,max_npoints)
  real(EUITM_R8),pointer  :: rzdrdz(:,:) => null()     ! /pfpassive/pfpageometry/rzdrdz - 4-vector defining Centre R,Z and full extents dR, dZ [m]; Matrix (nelements,4)
endtype
  
type type_pfpageometry_mask  !    
  integer  :: type=0       ! /pfpassive/pfpageometry/type - Type used to describe the shape (0 for 'rzcoordinates' or 1 for 'rzdrdz'); Vector of integers (nelem
  integer  :: npoints=0       ! /pfpassive/pfpageometry/npoints - Number of points describing an element (irregular outline rzcoordinates); Vector of integers (neleme
  type (type_rz2D_mask) :: rzcoordinate  ! /pfpassive/pfpageometry/rzcoordinate - Irregular outline [m]; Matrix (nelements,max_npoints)
  integer  :: rzdrdz=0       ! /pfpassive/pfpageometry/rzdrdz - 4-vector defining Centre R,Z and full extents dR, dZ [m]; Matrix (nelements,4)
endtype

  
type type_pfpassive  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /pfpassive/name - Name of coil. Array of strings (nelements)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /pfpassive/area - Surface area of this passive element [m^2]; Vector (nelements)
  real(EUITM_R8),pointer  :: res(:) => null()     ! /pfpassive/res - Passive element resistance [Ohm]; Vector (nelements)
  real(EUITM_R8),pointer  :: eta(:) => null()     ! /pfpassive/eta - Passive element resistivity [Ohm.m]; Vector (nelements)
  type (type_pfpassive_current) :: current  ! /pfpassive/current - Current induced in passive structures.
  type (type_pfpageometry) :: pfpageometry  ! /pfpassive/pfpageometry - Geometry of the passive elements
endtype
  
type type_pfpassive_mask  !    
  integer  :: name=0       ! /pfpassive/name - Name of coil. Array of strings (nelements)
  integer  :: area=0       ! /pfpassive/area - Surface area of this passive element [m^2]; Vector (nelements)
  integer  :: res=0       ! /pfpassive/res - Passive element resistance [Ohm]; Vector (nelements)
  integer  :: eta=0       ! /pfpassive/eta - Passive element resistivity [Ohm.m]; Vector (nelements)
  type (type_pfpassive_current_mask) :: current  ! /pfpassive/current - Current induced in passive structures.
  type (type_pfpageometry_mask) :: pfpageometry  ! /pfpassive/pfpageometry - Geometry of the passive elements
endtype

! ***********  Include pfsupplies.xsd
  
type type_filter  !    
  real(EUITM_R8),pointer  :: num(:,:) => null()     ! /pfsupplies/desc_supply/filter/num - Coefficients of the numerator, in increasing order : a0 + a1*s + ... + an*s^n; Matrix (nsupplies,n)
  real(EUITM_R8),pointer  :: den(:,:) => null()     ! /pfsupplies/desc_supply/filter/den - Coefficients of the denominator, in increasing order : b0 + b1*s + ... + bm*s^m; Matrix (nsupplies,m
endtype
  
type type_filter_mask  !    
  integer  :: num=0       ! /pfsupplies/desc_supply/filter/num - Coefficients of the numerator, in increasing order : a0 + a1*s + ... + an*s^n; Matrix (nsupplies,n)
  integer  :: den=0       ! /pfsupplies/desc_supply/filter/den - Coefficients of the denominator, in increasing order : b0 + b1*s + ... + bm*s^m; Matrix (nsupplies,m
endtype

  
type type_desc_supply  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /pfsupplies/desc_supply/name - Name of the supply; Array of strings (nsupplies)
  character(len=132), dimension(:), pointer ::id => null()       ! /pfsupplies/desc_supply/id - ID of the supply; Array of strings (nsupplies)
  character(len=132), dimension(:), pointer ::type => null()       ! /pfsupplies/desc_supply/type - Type of supply; Array of strings (nsupplies)
  real(EUITM_R8),pointer  :: delay(:) => null()     ! /pfsupplies/desc_supply/delay - Pure delay in the supply [s]; Vector (nsupplies)
  type (type_filter) :: filter  ! /pfsupplies/desc_supply/filter - Laplace proper filter 
  real(EUITM_R8),pointer  :: imin(:) => null()     ! /pfsupplies/desc_supply/imin - Minimum current [A]; Vector (nsupplies)
  real(EUITM_R8),pointer  :: imax(:) => null()     ! /pfsupplies/desc_supply/imax - Maximum current [A]; Vector (nsupplies)
  real(EUITM_R8),pointer  :: res(:) => null()     ! /pfsupplies/desc_supply/res - Supply internal resistance [Ohm]; Vector (nsupplies)
  real(EUITM_R8),pointer  :: umin(:) => null()     ! /pfsupplies/desc_supply/umin - Minimum voltage [V]; Vector (nsupplies)
  real(EUITM_R8),pointer  :: umax(:) => null()     ! /pfsupplies/desc_supply/umax - Maximum voltage [V]; Vector (nsupplies)
  real(EUITM_R8),pointer  :: emax(:) => null()     ! /pfsupplies/desc_supply/emax - Maximum Energy to be dissipated in supply [J]; Vector (nsupplies)
endtype
  
type type_desc_supply_mask  !    
  integer  :: name=0       ! /pfsupplies/desc_supply/name - Name of the supply; Array of strings (nsupplies)
  integer  :: id=0       ! /pfsupplies/desc_supply/id - ID of the supply; Array of strings (nsupplies)
  integer  :: type=0       ! /pfsupplies/desc_supply/type - Type of supply; Array of strings (nsupplies)
  integer  :: delay=0       ! /pfsupplies/desc_supply/delay - Pure delay in the supply [s]; Vector (nsupplies)
  type (type_filter_mask) :: filter  ! /pfsupplies/desc_supply/filter - Laplace proper filter 
  integer  :: imin=0       ! /pfsupplies/desc_supply/imin - Minimum current [A]; Vector (nsupplies)
  integer  :: imax=0       ! /pfsupplies/desc_supply/imax - Maximum current [A]; Vector (nsupplies)
  integer  :: res=0       ! /pfsupplies/desc_supply/res - Supply internal resistance [Ohm]; Vector (nsupplies)
  integer  :: umin=0       ! /pfsupplies/desc_supply/umin - Minimum voltage [V]; Vector (nsupplies)
  integer  :: umax=0       ! /pfsupplies/desc_supply/umax - Maximum voltage [V]; Vector (nsupplies)
  integer  :: emax=0       ! /pfsupplies/desc_supply/emax - Maximum Energy to be dissipated in supply [J]; Vector (nsupplies)
endtype

  
type type_pfsupplies  !    
  type (type_desc_supply) :: desc_supply  ! /pfsupplies/desc_supply - Description of the power supplies
  type (type_exp1D) :: voltage  ! /pfsupplies/voltage - Voltage at the supply output [V]; Time-dependent; Vector  (nsupplies)
  type (type_exp1D) :: current  ! /pfsupplies/current - Current at the supply output, defined positive if it flows from point 1 to point 2 of the component 
endtype
  
type type_pfsupplies_mask  !    
  type (type_desc_supply_mask) :: desc_supply  ! /pfsupplies/desc_supply - Description of the power supplies
  type (type_exp1D_mask) :: voltage  ! /pfsupplies/voltage - Voltage at the supply output [V]; Time-dependent; Vector  (nsupplies)
  type (type_exp1D_mask) :: current  ! /pfsupplies/current - Current at the supply output, defined positive if it flows from point 1 to point 2 of the component 
endtype

! ***********  Include pfsystems.xsd
  
type type_pfsystems  !    
  type (type_datainfo) :: datainfo  ! /pfsystems/datainfo - 
  type (type_pfcoils) :: pfcoils  ! /pfsystems/pfcoils - 
  type (type_pfpassive) :: pfpassive  ! /pfsystems/pfpassive - 
  type (type_pfcircuits) :: pfcircuits  ! /pfsystems/pfcircuits - 
  type (type_pfsupplies) :: pfsupplies  ! /pfsystems/pfsupplies - 
  type (type_codeparam) :: codeparam  ! /pfsystems/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /pfsystems/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_pfsystems_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /pfsystems/datainfo - 
  type (type_pfcoils_mask) :: pfcoils  ! /pfsystems/pfcoils - 
  type (type_pfpassive_mask) :: pfpassive  ! /pfsystems/pfpassive - 
  type (type_pfcircuits_mask) :: pfcircuits  ! /pfsystems/pfcircuits - 
  type (type_pfsupplies_mask) :: pfsupplies  ! /pfsystems/pfsupplies - 
  type (type_codeparam_mask) :: codeparam  ! /pfsystems/codeparam - 
  integer  :: time=0       ! /pfsystems/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include power_conv.xsd
  
type type_power_conv_component  !    Description of the components of the power conversion system. Array of structure (ncomp).
  character(len=132), dimension(:), pointer ::name => null()       ! /name - name of the component
  real(EUITM_R8)  :: temp_in=-9.0E40_EUITM_R8       ! /temp_in - temperature of the input [K];Scalar
  real(EUITM_R8)  :: temp_out=-9.0E40_EUITM_R8       ! /temp_out - temperature of the output [K];Scalar
  real(EUITM_R8)  :: press_in=-9.0E40_EUITM_R8       ! /press_in - Pressure of the input[Pa];Scalar
  real(EUITM_R8)  :: press_out=-9.0E40_EUITM_R8       ! /press_out - Pressure of the output [Pa];Scalar
  real(EUITM_R8)  :: power=-9.0E40_EUITM_R8       ! /power - electric consumption  by the component; (consumption power)[W];Scalar
  real(EUITM_R8)  :: flow=-9.0E40_EUITM_R8       ! /flow - Flow through the component [kg/s]; Scalar
endtype
  
type type_power_conv_component_mask  !    Description of the components of the power conversion system. Array of structure (ncomp).
  integer  :: name=0       ! /name - name of the component
  integer  :: temp_in=0       ! /temp_in - temperature of the input [K];Scalar
  integer  :: temp_out=0       ! /temp_out - temperature of the output [K];Scalar
  integer  :: press_in=0       ! /press_in - Pressure of the input[Pa];Scalar
  integer  :: press_out=0       ! /press_out - Pressure of the output [Pa];Scalar
  integer  :: power=0       ! /power - electric consumption  by the component; (consumption power)[W];Scalar
  integer  :: flow=0       ! /flow - Flow through the component [kg/s]; Scalar
endtype

  
type type_circuits  !    
  type (type_power_conv_component),pointer :: component(:) => null()  ! /power_conv/circuits(i)/component(i) - Description of the components of the power conversion system. Array of structure (ncomp).
  real(EUITM_R8)  :: power_net=-9.0E40_EUITM_R8       ! /power_conv/circuits(i)/power_net - Net electric power generated [W]. Scalar
  real(EUITM_R8)  :: power_int=-9.0E40_EUITM_R8       ! /power_conv/circuits(i)/power_int - Total electric power consumption of the power conversion system.[W]. Scalar
  real(EUITM_R8)  :: efficiency=-9.0E40_EUITM_R8       ! /power_conv/circuits(i)/efficiency - Efficiency of the reactor (ratio of the alternator electrical power to the total power needed to ope
endtype
  
type type_circuits_mask  !    
  type (type_power_conv_component_mask),pointer :: component(:) => null()  ! /power_conv/circuits(i)/component(i) - Description of the components of the power conversion system. Array of structure (ncomp).
  integer  :: power_net=0       ! /power_conv/circuits(i)/power_net - Net electric power generated [W]. Scalar
  integer  :: power_int=0       ! /power_conv/circuits(i)/power_int - Total electric power consumption of the power conversion system.[W]. Scalar
  integer  :: efficiency=0       ! /power_conv/circuits(i)/efficiency - Efficiency of the reactor (ratio of the alternator electrical power to the total power needed to ope
endtype

  
type type_power_conv  !    
  type (type_datainfo) :: datainfo  ! /power_conv/datainfo - 
  character(len=132), dimension(:), pointer ::cycle_type => null()       ! /power_conv/cycle_type - Type of cycle. String
  type (type_circuits),pointer :: circuits(:) => null()  ! /power_conv/circuits(i) - Description of the circuit of the power conversion system. Array of structure. (ncircuits).
  real(EUITM_R8)  :: power_recirc=-9.0E40_EUITM_R8       ! /power_conv/power_recirc - Recirculated electric power (input to the power conversion actor). [W] Scalar
  real(EUITM_R8)  :: power_net=-9.0E40_EUITM_R8       ! /power_conv/power_net - Net electric power generated [W]. Scalar
  real(EUITM_R8)  :: power_int=-9.0E40_EUITM_R8       ! /power_conv/power_int - Total electric power consumption of the power conversion system.[W]. Scalar
  real(EUITM_R8)  :: efficiency=-9.0E40_EUITM_R8       ! /power_conv/efficiency - Efficiency of the reactor (ratio of the alternator electrical power to the total power needed to ope
  type (type_codeparam) :: codeparam  ! /power_conv/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /power_conv/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_power_conv_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /power_conv/datainfo - 
  integer  :: cycle_type=0       ! /power_conv/cycle_type - Type of cycle. String
  type (type_circuits_mask),pointer :: circuits(:) => null()  ! /power_conv/circuits(i) - Description of the circuit of the power conversion system. Array of structure. (ncircuits).
  integer  :: power_recirc=0       ! /power_conv/power_recirc - Recirculated electric power (input to the power conversion actor). [W] Scalar
  integer  :: power_net=0       ! /power_conv/power_net - Net electric power generated [W]. Scalar
  integer  :: power_int=0       ! /power_conv/power_int - Total electric power consumption of the power conversion system.[W]. Scalar
  integer  :: efficiency=0       ! /power_conv/efficiency - Efficiency of the reactor (ratio of the alternator electrical power to the total power needed to ope
  type (type_codeparam_mask) :: codeparam  ! /power_conv/codeparam - 
  integer  :: time=0       ! /power_conv/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include reflectometry.xsd
  
type type_origin  !    
  type (type_rzphi0D) :: refpos  ! /origin/refpos - Reference point of the local coordinate system; the position of either the last quasi-optical elemen
  real(EUITM_R8)  :: alpha=-9.0E40_EUITM_R8       ! /origin/alpha - Poloidal tilt angle [rad]; angle between local z axis and horizontal plane, 0 is facing outward, pi/
  real(EUITM_R8)  :: beta=-9.0E40_EUITM_R8       ! /origin/beta - Toroidal tilt angle [rad]; angle between local z axis and r-z plane
  real(EUITM_R8)  :: gamma=-9.0E40_EUITM_R8       ! /origin/gamma - Rotation angle about local z axis [rad]
endtype

  
type type_launchsignal  !    
  real(EUITM_R8),pointer  :: time_launch(:) => null()     ! /launchsignal/time_launch - Time stamp for particular event e.g. ramp of frequency sweep (but it should not be needed since it s
  real(EUITM_R8),pointer  :: freq(:) => null()     ! /launchsignal/freq - Frequency of the injected waves (should not be needed since it is already used in the injected signa
  real(EUITM_R8),pointer  :: amplitude(:) => null()     ! /launchsignal/amplitude - Amplitude of the injected waves (essential if using gaussian, already encoded in the Electric field 
  real(EUITM_R8),pointer  :: phase(:) => null()     ! /launchsignal/phase - Phase of the sinusoidal (e.g. voltage) signal injected in the antenna, typical data stored experimen
endtype
  
type type_origin_mask  !    
  type (type_rzphi0D_mask) :: refpos  ! /origin/refpos - Reference point of the local coordinate system; the position of either the last quasi-optical elemen
  integer  :: alpha=0       ! /origin/alpha - Poloidal tilt angle [rad]; angle between local z axis and horizontal plane, 0 is facing outward, pi/
  integer  :: beta=0       ! /origin/beta - Toroidal tilt angle [rad]; angle between local z axis and r-z plane
  integer  :: gamma=0       ! /origin/gamma - Rotation angle about local z axis [rad]
endtype
  
type type_launchsignal_mask  !    
  integer  :: time_launch=0       ! /launchsignal/time_launch - Time stamp for particular event e.g. ramp of frequency sweep (but it should not be needed since it s
  integer  :: freq=0       ! /launchsignal/freq - Frequency of the injected waves (should not be needed since it is already used in the injected signa
  integer  :: amplitude=0       ! /launchsignal/amplitude - Amplitude of the injected waves (essential if using gaussian, already encoded in the Electric field 
  integer  :: phase=0       ! /launchsignal/phase - Phase of the sinusoidal (e.g. voltage) signal injected in the antenna, typical data stored experimen
endtype

  
type type_t_series_real  !    Time series; Time-dependent
  real(EUITM_R8),pointer  :: time_wind(:) => null()     ! /time_wind - Time trace [s]; Time-dependent; Vector (n)
  real(EUITM_R8),pointer  :: values(:) => null()     ! /values - Values of the sigal; Time-dependent; Vector (n)
endtype

  
type type_t_series_cplx  !    Time series
  real(EUITM_R8),pointer  :: time_wind(:) => null()     ! /time_wind - Time trace [s]; Time-dependent; Vector (n)
  real(EUITM_R8),pointer  :: values_re(:) => null()     ! /values_re - Real part of data; Time-dependent; Vector (n)
  real(EUITM_R8),pointer  :: values_im(:) => null()     ! /values_im - Imaginary part of data; Time-dependent; Vector (n)
endtype

  
type type_simp_apert  !    Simple aperture specification: rectangular or elliptical
  type (type_identifier) :: type  ! /type - Shape identifier; 0: rectangular, 1: elliptical
  real(EUITM_R8),pointer  :: sizes(:) => null()     ! /sizes - Rectangular size a, b or diameters for elliptical shapes [m]; Time-dependent; Vector (2)
  real(EUITM_R8)  :: angle=-9.0E40_EUITM_R8       ! /angle - Rotation of aperture around its center [rad]
endtype

  
type type_reflectometry_radifield_efield  !    complex electric field at the aperture, given as a 2d grid in the local x and y directions (corresponding to dim1 and dim2); Time-
  type (type_reggrid) :: grid2d  ! /grid2d - Coordinate values for the grid for the electric field arrays. Vector(ndim1) and Vector(ndim2); Time-
  COMPLEX(EUITM_R8),pointer  :: e1(:,:) => null()     ! /e1 - Electric field component along local x direction [V/m]. Matrix(ndim1,ndim2); Time-dependent
  COMPLEX(EUITM_R8),pointer  :: e2(:,:) => null()     ! /e2 - Electric field component along local y direction [V/m]. Matrix(ndim1,ndim2); Time-dependent
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /frequency - Frequency for this occurrence of the gaussian/efield/wgmode CPO [Hz]; Scalar; can be zero of no freq
endtype

  
type type_reflectometry_radfield_gaussian  !    Parameters if radiation field is a pure Gaussian; major axes of the Gaussian are aligned with the x and y axis of the local coordi
  type (type_simp_apert) :: aperture  ! /aperture - Physical limits of the Gaussian wave field; any rotation here is at odds with the Gaussian geometry
  real(EUITM_R8),pointer  :: waistsize(:) => null()     ! /waistsize - Beam waist size [m]; Vector(2)
  real(EUITM_R8),pointer  :: waistzpos(:) => null()     ! /waistzpos - Beam waist position along local z axis [m]; Vector(2)
  real(EUITM_R8),pointer  :: tiltangle(:) => null()     ! /tiltangle - tilt angle relative to local z axis [rad]; Vector(2)
  real(EUITM_R8),pointer  :: polar_angle(:) => null()     ! /polar_angle - Polarisation angle around local z [rad]; 0 means along the local x axis, i.e. vertical if all angles
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /frequency - Frequency for this occurrence of the gaussian/efield/wgmode CPO [Hz]; Scalar; can be zero of no freq
endtype

  
type type_reflectometry_radfield  !    Complex valued radiation field for injection into grid; Can be a Gaussian, or a waveguide mode, or an arbitrary E field. The latte
  type (type_identifier) :: type  ! /type - Identify type of source: 0: Gaussian, 1: waveguide mode, 2: arbitrary E field; corresponding substru
  real(EUITM_R8),pointer  :: position(:) => null()     ! /position - Center position in local x-y-z coordinate system [m]; Vector(3)
  type (type_reflectometry_radfield_gaussian),pointer :: gaussian(:) => null()  ! /gaussian(i) - Parameters if radiation field is a pure Gaussian; major axes of the Gaussian are aligned with the x 
  type (type_reflectometry_radifield_efield),pointer :: efield(:) => null()  ! /efield(i) - complex electric field at the aperture, given as a 2d grid in the local x and y directions (correspo
endtype

  
type type_reflectometry_antennas  !    Vector of reflectometry antenna descriptions. These include radiation fields as well as material antenna structures (feeds, horns,
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Antenna name
  type (type_identifier) :: type  ! /type - Antenna type: 1: sending, 2: receiving, 3: both
  type (type_origin) :: origin  ! /origin - 
  type (type_reflectometry_radfield) :: radfield  ! /radfield - Complex valued radiation field for injection into grid; Can be a Gaussian, or a waveguide mode, or a
  real(EUITM_R8)  :: geometry=-9.0E40_EUITM_R8       ! /geometry - To be defined: annotation and type
  type (type_launchsignal) :: launchsignal  ! /launchsignal - 
endtype
  
type type_t_series_real_mask  !    Time series; Time-dependent
  integer  :: time_wind=0       ! /time_wind - Time trace [s]; Time-dependent; Vector (n)
  integer  :: values=0       ! /values - Values of the sigal; Time-dependent; Vector (n)
endtype
  
type type_t_series_cplx_mask  !    Time series
  integer  :: time_wind=0       ! /time_wind - Time trace [s]; Time-dependent; Vector (n)
  integer  :: values_re=0       ! /values_re - Real part of data; Time-dependent; Vector (n)
  integer  :: values_im=0       ! /values_im - Imaginary part of data; Time-dependent; Vector (n)
endtype
  
type type_simp_apert_mask  !    Simple aperture specification: rectangular or elliptical
  type (type_identifier_mask) :: type  ! /type - Shape identifier; 0: rectangular, 1: elliptical
  integer  :: sizes=0       ! /sizes - Rectangular size a, b or diameters for elliptical shapes [m]; Time-dependent; Vector (2)
  integer  :: angle=0       ! /angle - Rotation of aperture around its center [rad]
endtype
  
type type_reflectometry_radifield_efield_mask  !    complex electric field at the aperture, given as a 2d grid in the local x and y directions (corresponding to dim1 and dim2); Time-
  type (type_reggrid_mask) :: grid2d  ! /grid2d - Coordinate values for the grid for the electric field arrays. Vector(ndim1) and Vector(ndim2); Time-
  integer  :: e1=0       ! /e1 - Electric field component along local x direction [V/m]. Matrix(ndim1,ndim2); Time-dependent
  integer  :: e2=0       ! /e2 - Electric field component along local y direction [V/m]. Matrix(ndim1,ndim2); Time-dependent
  integer  :: frequency=0       ! /frequency - Frequency for this occurrence of the gaussian/efield/wgmode CPO [Hz]; Scalar; can be zero of no freq
endtype
  
type type_reflectometry_radfield_gaussian_mask  !    Parameters if radiation field is a pure Gaussian; major axes of the Gaussian are aligned with the x and y axis of the local coordi
  type (type_simp_apert_mask) :: aperture  ! /aperture - Physical limits of the Gaussian wave field; any rotation here is at odds with the Gaussian geometry
  integer  :: waistsize=0       ! /waistsize - Beam waist size [m]; Vector(2)
  integer  :: waistzpos=0       ! /waistzpos - Beam waist position along local z axis [m]; Vector(2)
  integer  :: tiltangle=0       ! /tiltangle - tilt angle relative to local z axis [rad]; Vector(2)
  integer  :: polar_angle=0       ! /polar_angle - Polarisation angle around local z [rad]; 0 means along the local x axis, i.e. vertical if all angles
  integer  :: frequency=0       ! /frequency - Frequency for this occurrence of the gaussian/efield/wgmode CPO [Hz]; Scalar; can be zero of no freq
endtype
  
type type_reflectometry_radfield_mask  !    Complex valued radiation field for injection into grid; Can be a Gaussian, or a waveguide mode, or an arbitrary E field. The latte
  type (type_identifier_mask) :: type  ! /type - Identify type of source: 0: Gaussian, 1: waveguide mode, 2: arbitrary E field; corresponding substru
  integer  :: position=0       ! /position - Center position in local x-y-z coordinate system [m]; Vector(3)
  type (type_reflectometry_radfield_gaussian_mask),pointer :: gaussian(:) => null()  ! /gaussian(i) - Parameters if radiation field is a pure Gaussian; major axes of the Gaussian are aligned with the x 
  type (type_reflectometry_radifield_efield_mask),pointer :: efield(:) => null()  ! /efield(i) - complex electric field at the aperture, given as a 2d grid in the local x and y directions (correspo
endtype
  
type type_reflectometry_antennas_mask  !    Vector of reflectometry antenna descriptions. These include radiation fields as well as material antenna structures (feeds, horns,
  integer  :: name=0       ! /name - Antenna name
  type (type_identifier_mask) :: type  ! /type - Antenna type: 1: sending, 2: receiving, 3: both
  type (type_origin_mask) :: origin  ! /origin - 
  type (type_reflectometry_radfield_mask) :: radfield  ! /radfield - Complex valued radiation field for injection into grid; Can be a Gaussian, or a waveguide mode, or a
  integer  :: geometry=0       ! /geometry - To be defined: annotation and type
  type (type_launchsignal_mask) :: launchsignal  ! /launchsignal - 
endtype

  
type type_refl_receive  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /reflectomet/refl_receive(i)/name - Signal name
  type (type_t_series_real) :: raw_signal  ! /reflectomet/refl_receive(i)/raw_signal - Raw antenna signal, possibly code dependent, may not always be available; usually without mixing of 
  type (type_t_series_real) :: io_signal  ! /reflectomet/refl_receive(i)/io_signal - Local oscillator signal, for mixing with raw signal; Time series; Vector (ntime_raw); Time-dependent
  type (type_t_series_cplx) :: iq_receiver  ! /reflectomet/refl_receive(i)/iq_receiver - I and Q signals from the receiver; already processed by code (or hardware); Time series; Vector (nti
  integer  :: antenna_ind=-999999999       ! /reflectomet/refl_receive(i)/antenna_ind - Index of the receiving antenna in the antennas vector, starting at 0
endtype
  
type type_refl_receive_mask  !    
  integer  :: name=0       ! /reflectomet/refl_receive(i)/name - Signal name
  type (type_t_series_real_mask) :: raw_signal  ! /reflectomet/refl_receive(i)/raw_signal - Raw antenna signal, possibly code dependent, may not always be available; usually without mixing of 
  type (type_t_series_real_mask) :: io_signal  ! /reflectomet/refl_receive(i)/io_signal - Local oscillator signal, for mixing with raw signal; Time series; Vector (ntime_raw); Time-dependent
  type (type_t_series_cplx_mask) :: iq_receiver  ! /reflectomet/refl_receive(i)/iq_receiver - I and Q signals from the receiver; already processed by code (or hardware); Time series; Vector (nti
  integer  :: antenna_ind=0       ! /reflectomet/refl_receive(i)/antenna_ind - Index of the receiving antenna in the antennas vector, starting at 0
endtype

  
type type_reflectomet  !    
  type (type_datainfo) :: datainfo  ! /reflectomet/datainfo - 
  type (type_refl_receive),pointer :: refl_receive(:) => null()  ! /reflectomet/refl_receive(i) - Reflectometry signal; experimental or code output. Time-dependent. Vector(nreceivers); If output fro
  type (type_reflectometry_antennas),pointer :: antennas(:) => null()  ! /reflectomet/antennas(i) - Vector of reflectometry antenna descriptions. These include radiation fields as well as material ant
  type (type_codeparam) :: codeparam  ! /reflectomet/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /reflectomet/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_reflectomet_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /reflectomet/datainfo - 
  type (type_refl_receive_mask),pointer :: refl_receive(:) => null()  ! /reflectomet/refl_receive(i) - Reflectometry signal; experimental or code output. Time-dependent. Vector(nreceivers); If output fro
  type (type_reflectometry_antennas_mask),pointer :: antennas(:) => null()  ! /reflectomet/antennas(i) - Vector of reflectometry antenna descriptions. These include radiation fields as well as material ant
  type (type_codeparam_mask) :: codeparam  ! /reflectomet/codeparam - 
  integer  :: time=0       ! /reflectomet/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include rfadiag.xsd
  
type type_rfasetup  !    diagnostic setup information
  type (type_rzphi1Dexp) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
endtype

  
type type_rfameasure  !    Measured values
  type (type_exp1D) :: ti  ! /ti - Ion temperature [eV]. Vector (nchannels)
endtype
  
type type_rfasetup_mask  !    diagnostic setup information
  type (type_rzphi1Dexp_mask) :: position  ! /position - Position of the measurement. Time-dependent. Vector (nchannels)
endtype
  
type type_rfameasure_mask  !    Measured values
  type (type_exp1D_mask) :: ti  ! /ti - Ion temperature [eV]. Vector (nchannels)
endtype

  
type type_rfadiag  !    
  type (type_datainfo) :: datainfo  ! /rfadiag/datainfo - 
  type (type_rfasetup) :: setup  ! /rfadiag/setup - diagnostic setup information
  type (type_rfameasure) :: measure  ! /rfadiag/measure - Measured values
  type (type_codeparam) :: codeparam  ! /rfadiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /rfadiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_rfadiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /rfadiag/datainfo - 
  type (type_rfasetup_mask) :: setup  ! /rfadiag/setup - diagnostic setup information
  type (type_rfameasure_mask) :: measure  ! /rfadiag/measure - Measured values
  type (type_codeparam_mask) :: codeparam  ! /rfadiag/codeparam - 
  integer  :: time=0       ! /rfadiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include sawteeth.xsd
  
type type_sawteeth_profiles1d  !    Core profiles after sawtooth crash
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Electron density [m^-3]. Time-dependent. Vector (nrho).
  real(EUITM_R8),pointer  :: ni(:,:) => null()     ! /ni - Ion density [m^-3]. Time-dependent. Matrix (nrho,nion).
  real(EUITM_R8),pointer  :: te(:) => null()     ! /te - Electron temperature [eV]. Time-dependent. Vector (nrho).
  real(EUITM_R8),pointer  :: ti(:,:) => null()     ! /ti - Ion temperature [eV]. Time-dependent. Matrix (nrho,nion).
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent. Vector (nrho)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Toroidal flux [Wb]. Time-dependent. Vector (nrho).
  real(EUITM_R8),pointer  :: psistar(:) => null()     ! /psistar - Psi* = psi - phi [Wb]. Time-dependent. Vector (nrho).
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed in the flux surface [m^3]. Required to ensure particle and energy conservation durin
  real(EUITM_R8),pointer  :: q(:) => null()     ! /q - Safety factor = dphi/dpsi [-]. Time-dependent. Vector (nrho).
endtype

  
type type_sawteeth_diags  !    Inversion and mixing radii
  real(EUITM_R8)  :: shear1=-9.0E40_EUITM_R8       ! /shear1 - Magnetic shear at q = 1 [-]. Time-dependent. Real scalar.
  real(EUITM_R8)  :: rhotorn_q1=-9.0E40_EUITM_R8       ! /rhotorn_q1 - Rho_tor_norm at q=1 radius [-]. Time-dependent. Real scalar.
  real(EUITM_R8)  :: rhotorn_inv=-9.0E40_EUITM_R8       ! /rhotorn_inv - Rho_tor_norm at inversion radius [-]. Time-dependent. Real scalar.
  real(EUITM_R8)  :: rhotorn_mix=-9.0E40_EUITM_R8       ! /rhotorn_mix - Rho_tor_norm at mixing radius [-]. Time-dependent. Real scalar.
endtype
  
type type_sawteeth_profiles1d_mask  !    Core profiles after sawtooth crash
  integer  :: ne=0       ! /ne - Electron density [m^-3]. Time-dependent. Vector (nrho).
  integer  :: ni=0       ! /ni - Ion density [m^-3]. Time-dependent. Matrix (nrho,nion).
  integer  :: te=0       ! /te - Electron temperature [eV]. Time-dependent. Vector (nrho).
  integer  :: ti=0       ! /ti - Ion temperature [eV]. Time-dependent. Matrix (nrho,nion).
  integer  :: psi=0       ! /psi - Poloidal flux [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-dependent. Vector (nrho)
  integer  :: phi=0       ! /phi - Toroidal flux [Wb]. Time-dependent. Vector (nrho).
  integer  :: psistar=0       ! /psistar - Psi* = psi - phi [Wb]. Time-dependent. Vector (nrho).
  integer  :: volume=0       ! /volume - Volume enclosed in the flux surface [m^3]. Required to ensure particle and energy conservation durin
  integer  :: q=0       ! /q - Safety factor = dphi/dpsi [-]. Time-dependent. Vector (nrho).
endtype
  
type type_sawteeth_diags_mask  !    Inversion and mixing radii
  integer  :: shear1=0       ! /shear1 - Magnetic shear at q = 1 [-]. Time-dependent. Real scalar.
  integer  :: rhotorn_q1=0       ! /rhotorn_q1 - Rho_tor_norm at q=1 radius [-]. Time-dependent. Real scalar.
  integer  :: rhotorn_inv=0       ! /rhotorn_inv - Rho_tor_norm at inversion radius [-]. Time-dependent. Real scalar.
  integer  :: rhotorn_mix=0       ! /rhotorn_mix - Rho_tor_norm at mixing radius [-]. Time-dependent. Real scalar.
endtype

  
type type_sawteeth  !    
  type (type_datainfo) :: datainfo  ! /sawteeth/datainfo - 
  integer  :: crash_trig=-999999999       ! /sawteeth/crash_trig - Flag indicating whether a crash condition has been satisfied : 0 = no crash. N(>0) = crash triggered
  type (type_composition) :: composition  ! /sawteeth/composition - 
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /sawteeth/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /sawteeth/rho_tor - Toroidal flux coordinate [m] given by sqrt(phi/B0/pi), where B0 = toroidfield%bvac_r%value / toroidf
  type (type_sawteeth_profiles1d) :: profiles1d  ! /sawteeth/profiles1d - Core profiles after sawtooth crash
  type (type_sawteeth_diags) :: diags  ! /sawteeth/diags - 
  type (type_codeparam) :: codeparam  ! /sawteeth/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /sawteeth/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_sawteeth_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /sawteeth/datainfo - 
  integer  :: crash_trig=0       ! /sawteeth/crash_trig - Flag indicating whether a crash condition has been satisfied : 0 = no crash. N(>0) = crash triggered
  type (type_composition_mask) :: composition  ! /sawteeth/composition - 
  integer  :: rho_tor_norm=0       ! /sawteeth/rho_tor_norm - Normalised toroidal flux coordinate values (= rho_tor normalised to the value at the last grid point
  integer  :: rho_tor=0       ! /sawteeth/rho_tor - Toroidal flux coordinate [m] given by sqrt(phi/B0/pi), where B0 = toroidfield%bvac_r%value / toroidf
  type (type_sawteeth_profiles1d_mask) :: profiles1d  ! /sawteeth/profiles1d - Core profiles after sawtooth crash
  type (type_sawteeth_diags_mask) :: diags  ! /sawteeth/diags - 
  type (type_codeparam_mask) :: codeparam  ! /sawteeth/codeparam - 
  integer  :: time=0       ! /sawteeth/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include scenario.xsd
  
type type_scenario_ref  !    Structure for scenario reference; Time-dependent
  real(EUITM_R8)  :: value=-9.0E40_EUITM_R8       ! /value - Signal value; Time-dependent; Scalar
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the signal (any comment describing the origin of the signal : code, path to diagnostic sig
endtype

  
type type_scenario_int  !    Structure for scenario integer flag; Time-dependent
  integer  :: value=-999999999       ! /value - Signal value; Time-dependent; Scalar Integer.
  character(len=132), dimension(:), pointer ::source => null()       ! /source - Source of the signal (any comment describing the origin of the signal : code, path to diagnostic sig
endtype

  
type type_scenario_reactor  !    reactor data (such as electricity cost ...)
  real(EUITM_R8)  :: pnetwork=-9.0E40_EUITM_R8       ! /pnetwork - reactor electric power provide to the network [W].
endtype

  
type type_scenario_vol_ave  !    volume averaged values
  type (type_scenario_ref) :: te_ave  ! /te_ave - volume averaged electron temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_ave  ! /ti_ave - volume averaged ion temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_ave  ! /ne_ave - volume averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: dne_ave_dt  ! /dne_ave_dt - time derivative of volume averaged electron density [m^-3/s]. Time-dependent.
  type (type_scenario_ref) :: ni_ave  ! /ni_ave - volume averaged ion density (<sum(n_k)>, k in species) [m^-3]. Time-dependent.
  type (type_scenario_ref) :: zeff_ave  ! /zeff_ave - volume averaged effective charge. Time-dependent.
  type (type_scenario_ref) :: ti_o_te_ave  ! /ti_o_te_ave - volume averaged ion temperature over electron temperature  (<Ti/Te>) []. Time-dependent.
  type (type_scenario_ref) :: meff_ave  ! /meff_ave - volume averaged effectice mass  (<sum(n_k * m_k)  > /  < sum(n_k)> ) []. Time-dependent.
  type (type_scenario_ref) :: pellet_flux  ! /pellet_flux - number of electrons fuelling  the plasma every second coming from pellet injection [s^-1]. Time-depe
  real(EUITM_R8),pointer  :: nions_ave(:) => null()     ! /nions_ave - volume averaged ions densities (vector, one element per ion species) [m^-3]. Time-dependent.
  type (type_scenario_ref) :: omega_ave  ! /omega_ave - bulk volume average toroidal rotation velocity (whole plasma) [rad/s]. Time-dependent.
endtype

  
type type_scenario_references  !    References
  type (type_scenario_ref) :: plh  ! /plh - Lower hybrid power [W]. Time-dependent.
  type (type_scenario_ref) :: picrh  ! /picrh - Ion cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref) :: pecrh  ! /pecrh - electron cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref) :: pnbi  ! /pnbi - neutral beam injection power [W]. Time-dependent.
  type (type_scenario_ref) :: ip  ! /ip - Plasma current [A]. Time-dependent.
  type (type_scenario_ref) :: bvac_r  ! /bvac_r - Vacuum field times radius in the toroidal field magnet [T.m]. Time-dependent.
  type (type_scenario_ref) :: zeffl  ! /zeffl - line averaged effective charge []. Time-dependent.
  type (type_scenario_ref) :: nbar  ! /nbar - line averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: xecrh  ! /xecrh - position of maximum  (normalized rho coordinate) of electron cyclotron resonnance heating power []. 
  type (type_scenario_ref) :: pol_flux  ! /pol_flux - separatrix poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: enhancement  ! /enhancement - energy enhancement factor []. Time-dependent.
  type (type_scenario_ref) :: isotopic  ! /isotopic - ratio between tritium  and deuterium density (for burning plasma)  []. Time-dependent.
  type (type_scenario_ref) :: nbi_td_ratio  ! /nbi_td_ratio - ratio between tritium  and deuterium power in neutral beam injection  []. Time-dependent.
  type (type_scenario_ref) :: gas_puff  ! /gas_puff - gas puff flux reference, in equivalent [electrons.s^-1]. Time-dependent.
endtype

  
type type_scenario_sol  !    SOL characteristic  (@ LCMS)
  type (type_scenario_ref) :: l_te_sol  ! /l_te_sol - electron temperature radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: l_ti_sol  ! /l_ti_sol - ion temperature  radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: l_ne_sol  ! /l_ne_sol - electron density radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: l_ni_sol  ! /l_ni_sol - ion density  radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: l_qe_sol  ! /l_qe_sol - electron heat flux radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: l_qi_sol  ! /l_qi_sol - ion  heat flux radial decay length [m]. Time-dependent.
  type (type_scenario_ref) :: p_rad_sol  ! /p_rad_sol - radiative power of the SOL [W]. Time-dependent.
  real(EUITM_R8)  :: p_neut=-9.0E40_EUITM_R8       ! /p_neut - Neutral pressure of the SOL [Pa]; Scalar
  type (type_scenario_ref) :: gas_puff  ! /gas_puff - gas puff flux for each ion species [s^-1]. Time-dependent.
  real(EUITM_R8)  :: delta_r_in=-9.0E40_EUITM_R8       ! /delta_r_in - Inner gap between the plasma and the first wall [m]; Scalar
  real(EUITM_R8)  :: delta_r_out=-9.0E40_EUITM_R8       ! /delta_r_out - Outer gap between the plasma and the first wall [m]; Scalar
  real(EUITM_R8)  :: r_in=-9.0E40_EUITM_R8       ! /r_in - Inner radius of the first wall [m]; Scalar
  real(EUITM_R8)  :: r_out=-9.0E40_EUITM_R8       ! /r_out - Outer radius of the first wall [m]; Scalar
  real(EUITM_R8)  :: sol_width=-9.0E40_EUITM_R8       ! /sol_width - Width of the SOL (the heat flux is assumed to fall off exponentially in the SOL according to the wid
endtype

  
type type_scenario_pedestal  !    Values at the top of the H-mode pedestal
  type (type_scenario_ref) :: te_ped  ! /te_ped - pedestal electron temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_ped  ! /ti_ped - pedestal ion temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_ped  ! /ne_ped - pedestal electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni_ped  ! /ni_ped - pedestal ion density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: psi_ped  ! /psi_ped - pedestal poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: phi_ped  ! /phi_ped - pedestal toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: rho_ped  ! /rho_ped - top pedestal value of internal simulator coordinate [m]. Time-dependent.
  type (type_scenario_ref) :: q_ped  ! /q_ped - top pedestal safety factor value []. Time-dependent.
  type (type_scenario_ref) :: pressure_ped  ! /pressure_ped - top pedestal thermal pressure (n_e * T_e  + n_i * T_i) [Pa]. Time-dependent.
  type (type_scenario_ref) :: vtor_ped  ! /vtor_ped - top pedestal value of rotation velocity of selected impurity [m/s]. Time-dependent.
endtype

  
type type_scenario_ninety_five  !    values at 95% of poloidal flux
  type (type_scenario_ref) :: q_95  ! /q_95 - safety factor value  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref) :: elong_95  ! /elong_95 - plasma elongation  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref) :: tria_95  ! /tria_95 - averaged plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref) :: tria_up_95  ! /tria_up_95 - upper plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref) :: tria_lo_95  ! /tria_lo_95 - lower plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref) :: te_95  ! /te_95 - electron temperature  @ 95 % of poloidal flux [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_95  ! /ti_95 - ion temperature  @ 95 % of poloidal flux [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_95  ! /ne_95 - electron density  @ 95 % of poloidal flux [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni_95  ! /ni_95 - ion density  @ 95 % of poloidal flux [m^-3]. Time-dependent.
  type (type_scenario_ref) :: phi_95  ! /phi_95 - toroidal flux  @ 95 % of poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: rho_95  ! /rho_95 -  value of internal simulator coordinate  @ 95 % of poloidal flux [m]. Time-dependent.
  type (type_scenario_ref) :: vtor_95  ! /vtor_95 - rotation velocity of selected impurity   @ 95 % of poloidal flux [m/s]. Time-dependent.
endtype

  
type type_scenario_neutron  !    neutron flux for DD and DT reactions
  type (type_scenario_ref) :: ndd_tot  ! /ndd_tot - total neutron flux coming  from DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref) :: ndd_th  ! /ndd_th - neutron flux coming  from thermal  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref) :: ndd_nbi_th  ! /ndd_nbi_th - neutron flux coming  from beam/plasma  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref) :: ndd_nbi_nbi  ! /ndd_nbi_nbi - neutron flux coming  from beam/beam  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref) :: ndt_tot  ! /ndt_tot - total neutron flux coming  from DT reactions [Hz]. Time-dependent.
  type (type_scenario_ref) :: ndt_th  ! /ndt_th - neutron flux coming  from thermal DT reactions [Hz]. Time-dependent.
endtype

  
type type_scenario_line_ave  !    line averaged value
  type (type_scenario_ref) :: ne_line  ! /ne_line - line averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: zeff_line  ! /zeff_line - line averaged effective charge. Time-dependent.
  type (type_scenario_ref) :: ne_zeff_line  ! /ne_zeff_line - line averaged electron density * Zeff . Time-dependent.
  type (type_scenario_ref) :: dne_line_dt  ! /dne_line_dt - time derivative of line averaged electron density [m^-3/s]. Time-dependent.
endtype

  
type type_scenario_lim_div_wall  !    values on the plate of divertor or on the limitor or on the wall (@ LCMS)
  type (type_scenario_ref) :: te_lim_div  ! /te_lim_div - limiter/divertor electron temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_lim_div  ! /ti_lim_div - limiter/divertor ion temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_lim_div  ! /ne_lim_div - limiter/divertor electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni_lim_div  ! /ni_lim_div - limiter/divertor ion density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: q_peak_div  ! /q_peak_div - Peak power flux on limiter or divertor plate [W.m^-2]. Time-dependent.
  type (type_scenario_ref) :: q_peak_wall  ! /q_peak_wall - Peak power flux on the wall [W.m^-2]. Time-dependent.
  type (type_scenario_ref) :: surf_temp  ! /surf_temp - limiter surface or divertor plate temperature [K]. Time-dependent.
  type (type_scenario_ref) :: p_lim_div  ! /p_lim_div - Total power on limiter or divertor plate [W]. Time-dependent.
  type (type_scenario_ref) :: p_rad_div  ! /p_rad_div - radiative power in the divertor zone [W]. Time-dependent.
  type (type_scenario_ref) :: p_neut_div  ! /p_neut_div - Neutral pressure in the divertor zone [Pa]; Time-dependent.
  type (type_scenario_ref) :: p_wall  ! /p_wall - Total power on the wall [W]. Time-dependent.
  type (type_scenario_ref) :: wall_temp  ! /wall_temp - wall temperature [K]. Time-dependent.
  type (type_scenario_ref) :: wall_state  ! /wall_state - saturation state of the wall (0 = completly pumping wall, 1 = competely saturate wall) []. Time-depe
  type (type_scenario_ref) :: detach_state  ! /detach_state - plasma detachement state (0= attach plasma, 1 = completely detach plasma) []. Time-dependent.
  type (type_scenario_ref) :: pump_flux  ! /pump_flux - flux pump out for each ion species [s^-1]. Time-dependent.
  type (type_scenario_ref) :: p_rad_fw  ! /p_rad_fw - Radiated power on the first wall [W]; Time-dependent
  type (type_scenario_ref) :: p_cond_fw  ! /p_cond_fw - Conducted/convected power  on the first wall [W]; Time-dependent
  type (type_scenario_ref) :: div_wetted  ! /div_wetted - Divertor wetted area [m^2]; Time-dependent
  type (type_scenario_ref) :: gas_puff  ! /gas_puff - Gas puff (D/T) in the divertor (PFR) [Pa.m^3.s^-1]; Time-dependent
  type (type_scenario_ref) :: ar_concentr  ! /ar_concentr - Argon concentration in the divertor; Time-dependent
  type (type_scenario_ref) :: part_exhaust  ! /part_exhaust - Assuming a pumping speed [Pa.m^3.s^-1]; Time-dependent
  type (type_scenario_ref) :: f_inner  ! /f_inner - Fraction of power to the inner divertor; Time-dependent
  type (type_scenario_ref) :: f_outer  ! /f_outer - Fraction of power to the outer divertor; Time-dependent
  type (type_scenario_ref) :: f_pfr  ! /f_pfr - Fraction of power flowing into the private flux region; Time-dependent
  type (type_scenario_ref) :: f_rad_fw  ! /f_rad_fw - Fraction of the divertor radiated power deposited in the main chamber; Time-dependent
  real(EUITM_R8),pointer  :: q_div(:) => null()     ! /q_div - Heat flux on divertor plate [W/m^2]; Vector(theta). Time-dependent
  type (type_scenario_ref) :: p_cond_div  ! /p_cond_div - Conducted/convected power on divertor plate  [W]; Time-dependent
  real(EUITM_R8)  :: pol_ext=-9.0E40_EUITM_R8       ! /pol_ext - Poloidal extension of the divertor or outer major radius of the divertor region (and inner major rad
  real(EUITM_R8)  :: flux_exp=-9.0E40_EUITM_R8       ! /flux_exp - Flux expansion at the divertor plate ((B_theta/B)midplane)/((B_theta/B)target); Scalar
  real(EUITM_R8)  :: tilt_angle=-9.0E40_EUITM_R8       ! /tilt_angle - Tilt angle between the field lines and the divertor plate in a poloidal plane [rad]; Scalar
  real(EUITM_R8)  :: n_div=-9.0E40_EUITM_R8       ! /n_div - Number of divertor, assuming symmetric configuration; Scalar
  real(EUITM_R8)  :: div_dz=-9.0E40_EUITM_R8       ! /div_dz - Divertor extension in z direction from the x-point [m]; Scalar
  real(EUITM_R8)  :: div_dro=-9.0E40_EUITM_R8       ! /div_dro - Divertor extension in r outward direction from the x-point [m]; Scalar
  real(EUITM_R8)  :: div_dri=-9.0E40_EUITM_R8       ! /div_dri - Divertor extension in r intward direction from the x-point [m]; Scalar
  type (type_scenario_ref) :: p_nh_div  ! /p_nh_div - Total nuclear heating in divertor [W]. Time-dependent.
endtype

  
type type_scenario_itb  !    Values characteristics of the Internal Transport Barrier
  type (type_scenario_ref) :: q_min  ! /q_min - minimal value of safety factor []. Time-dependent.
  type (type_scenario_ref) :: te_itb  ! /te_itb - electron temperature @ q = q_min [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_itb  ! /ti_itb - ion temperature @ q = q_min [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_itb  ! /ne_itb - electron density  @ q = q_min [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni_itb  ! /ni_itb - ion density  @ q = q_min [m^-3]. Time-dependent.
  type (type_scenario_ref) :: psi_itb  ! /psi_itb - poloidal flux @ q = q_min [Wb]. Time-dependent.
  type (type_scenario_ref) :: phi_itb  ! /phi_itb - toroidal flux @ q = q_min [Wb]. Time-dependent.
  type (type_scenario_ref) :: rho_itb  ! /rho_itb - value of internal simulator coordinate @ q = q_min [m]. Time-dependent.
  type (type_scenario_ref) :: h_itb  ! /h_itb - energy enhancement ITB factor [m]. Time-dependent.
  type (type_scenario_ref) :: width_itb  ! /width_itb - width of the high pressure gradient region (on scale of rho_itb) [m]. Time-dependent.
  type (type_scenario_ref) :: vtor_itb  ! /vtor_itb - rotation velocity of selected impurity @ rho_itb [m/s]. Time-dependent.
  type (type_scenario_int) :: itb_type  ! /itb_type - itb type []. Time-dependent. Any combinaison of :0 = none; 1 = on T_i; 2 = on T_e; 4  = on n_e; 8 = 
endtype

  
type type_scenario_heat_power  !    Power delivred to plasma (thermal an non thermal)
  type (type_scenario_ref) :: plh  ! /plh - Lower hybrid power [W]. Time-dependent.
  type (type_scenario_ref) :: pohmic  ! /pohmic - ohmic power (thermal species contribution only) [W]. Time-dependent.
  type (type_scenario_ref) :: picrh  ! /picrh - Ion cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref) :: pecrh  ! /pecrh - electron cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref) :: pnbi  ! /pnbi - neutral beam injection power [W]. Time-dependent.
  type (type_scenario_ref) :: pnbi_co_cur  ! /pnbi_co_cur - neutral beam injection power injeted in co-current direction [W]. Time-dependent.
  type (type_scenario_ref) :: pnbi_counter  ! /pnbi_counter - neutral beam injection power injeted in counter-current direction [W]. Time-dependent.
  type (type_scenario_ref) :: plh_th  ! /plh_th - lower hybrid power deposited on thermal electrons [W]. Time-dependent.
  type (type_scenario_ref) :: picrh_th  ! /picrh_th - ion cyclotron resonnance heating power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref) :: pecrh_th  ! /pecrh_th - electron cyclotron resonnance heating power deposited on thermal electrons [W]. Time-dependent.
  type (type_scenario_ref) :: pnbi_th  ! /pnbi_th - neutral beam injection power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref) :: ploss_icrh  ! /ploss_icrh - Ion cyclotron resonnance heating power losses [W]. Time-dependent.
  type (type_scenario_ref) :: ploss_nbi  ! /ploss_nbi - neutral beam injection power losses (including shine-through) [W]. Time-dependent.
  type (type_scenario_ref) :: pbrem  ! /pbrem - Bremsstrahlung radition losses [W]. Time-dependent.
  type (type_scenario_ref) :: pcyclo  ! /pcyclo - cyclotron radiation losses [W]. Time-dependent.
  type (type_scenario_ref) :: prad  ! /prad - impurity radition losses in core plamsa , without Bremsstrahlung [W]. Time-dependent.
  type (type_scenario_ref) :: pdd_fus  ! /pdd_fus - fusion power due to DD reactions [W]. Time-dependent.
  type (type_scenario_ref) :: pei  ! /pei - power exchange between eletron and ion (equipartition) [W]. Time-dependent.
  type (type_scenario_ref) :: pel_tot  ! /pel_tot - total thermal electron power deposition without equipartition [W]. Time-dependent.
  type (type_scenario_ref) :: pel_fus  ! /pel_fus - fusion electron power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pel_icrh  ! /pel_icrh - ICRH  electron power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pel_nbi  ! /pel_nbi - NBI electron power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pfus_dt  ! /pfus_dt - total D-T fusion power of alpha [W]. Time-dependent.
  type (type_scenario_ref) :: ploss_fus  ! /ploss_fus - D-T fusion power of alpha losses  [W]. Time-dependent.
  type (type_scenario_ref) :: pfus_nbi  ! /pfus_nbi - NBI induce D-T fusion power of alpha  [W]. Time-dependent.
  type (type_scenario_ref) :: pfus_th  ! /pfus_th - alpha (from DT fusion reaction)  power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref) :: padd_tot  ! /padd_tot - total additional power input including ohmic power  [W]. Time-dependent.
  type (type_scenario_ref) :: pion_tot  ! /pion_tot - total thermal ion power deposition without equipartition [W]. Time-dependent.
  type (type_scenario_ref) :: pion_fus  ! /pion_fus - fusion ion power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pion_icrh  ! /pion_icrh - ICRH  ion power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pion_nbi  ! /pion_nbi - NBI  ion power deposition [W]. Time-dependent.
  type (type_scenario_ref) :: pioniz  ! /pioniz - power losses due to cold neutral ionization [W]. Time-dependent.
  type (type_scenario_ref) :: ploss  ! /ploss - plasma losses power, as define in ITER basis [W]. Time-dependent.
  type (type_scenario_ref) :: p_wth  ! /p_wth - thermal power input, define as tau_E * P_th = Wth [W]. Time-dependent.
  type (type_scenario_ref) :: p_w  ! /p_w - effective power define as tau_E  * P_w = W_tot [W]. Time-dependent.
  type (type_scenario_ref) :: p_l2h_thr  ! /p_l2h_thr - additionnal power crossing the LCMS; must be compare to  L->H threshold power (Ryter PPCF 2002) [W].
  type (type_scenario_ref) :: p_l2h_sc  ! /p_l2h_sc - threshold power given by the choosen scaling law for transition from L-mode to H-mode  [W]. Time-dep
  type (type_scenario_ref) :: p_nbi_icrh  ! /p_nbi_icrh - beam power increase due to  ICRH effects  [W]. Time-dependent.
endtype

  
type type_scenario_global  !     global scalar value 
  type (type_scenario_ref) :: ip  ! /ip - Plasma current [A]. Time-dependent.
  type (type_scenario_ref) :: dip_dt  ! /dip_dt - time derivative of plasma current [A/s]. Time-dependent.
  type (type_scenario_ref) :: beta_pol  ! /beta_pol - poloidal beta []. Time-dependent.
  type (type_scenario_ref) :: beta_tor  ! /beta_tor - toroidal beta []. Time-dependent.
  type (type_scenario_ref) :: beta_normal  ! /beta_normal - normalised beta []. Time-dependent.
  type (type_scenario_ref) :: li  ! /li - internal inductance (definition 3). Time-dependent.
  type (type_scenario_ref) :: volume  ! /volume - total plasma volume [m^3]. Time-dependent.
  type (type_scenario_ref) :: area_pol  ! /area_pol - area poloidal cross section [m^2]. Time-dependent.
  type (type_scenario_ref) :: area_ext  ! /area_ext - external plasma surface [m^2]. Time-dependent.
  type (type_scenario_ref) :: len_sepa  ! /len_sepa - length of the separatrix [m]. Time-dependent.
  type (type_scenario_ref) :: beta_pol_th  ! /beta_pol_th - poloidal beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref) :: beta_tor_th  ! /beta_tor_th - toroidal beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref) :: beta_n_th  ! /beta_n_th - normalised beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref) :: disruption  ! /disruption - flag for disruption (set to 1 for disruption, oterwise equal 0) []. Time-dependent.
  type (type_scenario_ref) :: mode_h  ! /mode_h - confinement mode verus time:  0 = L-mode et 1 = H-mode []. Time-dependent.
  type (type_scenario_ref) :: s_alpha  ! /s_alpha - total number of alpha fusion  particules from D-T ractions  per second [s^-1]. Time-dependent.
endtype

  
type type_scenario_energy  !    plasma energy content
  type (type_scenario_ref) :: w_tot  ! /w_tot - total plasma energy [J]. Time-dependent.
  type (type_scenario_ref) :: w_b_pol  ! /w_b_pol - poloidal field energy of  the plasma [J]. Time-dependent.
  type (type_scenario_ref) :: w_dia  ! /w_dia - 3/2 perpendicular plasma energy [J]. Time-dependent.
  type (type_scenario_ref) :: dwdia_dt  ! /dwdia_dt - time derivative of Wdia [W]. Time-dependent.
  type (type_scenario_ref) :: w_b_tor_pla  ! /w_b_tor_pla - toroidal magnetic plasma energy  [J]. Time-dependent.
  type (type_scenario_ref) :: w_th  ! /w_th - thermal plasma energy [J]. Time-dependent.
  type (type_scenario_ref) :: dwtot_dt  ! /dwtot_dt - time derivative of total plasma energy [W]. Time-dependent.
  type (type_scenario_ref) :: dwbpol_dt  ! /dwbpol_dt - time derivative of plasma poloidal field energy [W]. Time-dependent.
  type (type_scenario_ref) :: dwbtorpla_dt  ! /dwbtorpla_dt - time derivative of toroidal magnetic plasma energy  [W]. Time-dependent.
  type (type_scenario_ref) :: dwth_dt  ! /dwth_dt - time derivative of thermal plasma energy [W]. Time-dependent.
  type (type_scenario_ref) :: esup_icrhtot  ! /esup_icrhtot - total suprathermal energy of fast ions accelerated  by ICRH [J]. Time-dependent.
  type (type_scenario_ref) :: esup_icrhper  ! /esup_icrhper - perpendicular part of suprathermal energy of fast ions accelerated  by ICRH [J]. Time-dependent.
  type (type_scenario_ref) :: esup_nbitot  ! /esup_nbitot - total suprathermal energy of fast ions from NBI ionisation [J]. Time-dependent.
  type (type_scenario_ref) :: esup_nbiperp  ! /esup_nbiperp - perpendicular part of suprathermal energy of fast ions from NBI ionisation [J]. Time-dependent.
  type (type_scenario_ref) :: esup_lhcd  ! /esup_lhcd - total suprathermal energy of fast electron from LHCD [J]. Time-dependent.
  type (type_scenario_ref) :: esup_alpha  ! /esup_alpha - total suprathermal energy of fast alpha particules [J]. Time-dependent.
endtype

  
type type_scenario_edge  !    edge value (@ LCMS)
  type (type_scenario_ref) :: te_edge  ! /te_edge - edge electron temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ti_edge  ! /ti_edge - edge ion temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ne_edge  ! /ne_edge - edge electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni_edge  ! /ni_edge - edge ion density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: psi_edge  ! /psi_edge - edge  poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: phi_edge  ! /phi_edge - edge  toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: rho_edge  ! /rho_edge - edge value of internal simulator coordinate [m]. Time-dependent.
  type (type_scenario_ref) :: drho_edge_dt  ! /drho_edge_dt - time derivative of edge value of internal simulator coordinate [m/s]. Time-dependent.
  type (type_scenario_ref) :: q_edge  ! /q_edge - edge or effective  safety factor value []. Time-dependent.
  type (type_scenario_ref) :: neutral_flux  ! /neutral_flux - number of cold neutral (in equivalent electron for Z >1) that input in  plasma at the edge every sec
  type (type_scenario_ref) :: phi_plasma  ! /phi_plasma - contribution of the plasma to the toroidal flux (used for toroidal coils heat load computation) [Wb]
  type (type_scenario_ref) :: vtor_edge  ! /vtor_edge - rotation velocity of selected impurity on the separatrix [m/s]. Time-dependent.
endtype

  
type type_scenario_currents  !    data related to current sources and current diffusion
  type (type_scenario_ref) :: RR  ! /RR - plasma resistivity [ohm]. Time-dependent.
  type (type_scenario_ref) :: i_align  ! /i_align - current drive alignment quality parameter (1 = good , 0 = bad). Time-dependent.
  type (type_scenario_ref) :: i_boot  ! /i_boot - bootstrap current [A]. Time-dependent.
  type (type_scenario_ref) :: i_cd_tot  ! /i_cd_tot - total current drive [A]. Time-dependent.
  type (type_scenario_ref) :: i_eccd  ! /i_eccd - Electron Cyclotron current drive [A]. Time-dependent.
  type (type_scenario_ref) :: i_fast_ion  ! /i_fast_ion - fast ions bootstrap like current drive  (i.e. fast alpha) [A]. Time-dependent.
  type (type_scenario_ref) :: i_fwcd  ! /i_fwcd - Fast Wave current drive [A]. Time-dependent.
  type (type_scenario_ref) :: i_lhcd  ! /i_lhcd - Lower Hybrid current drive [A]. Time-dependent.
  type (type_scenario_ref) :: i_nbicd  ! /i_nbicd - Neutral Beam Injection current drive  [A]. Time-dependent.
  type (type_scenario_ref) :: i_ni_tot  ! /i_ni_tot - total non inductive current  [A]. Time-dependent.
  type (type_scenario_ref) :: i_ohm  ! /i_ohm - ohmic current  [A]. Time-dependent.
  type (type_scenario_ref) :: i_par  ! /i_par - total plasma current (projected on B : <J.B>/B0)   [A]. Time-dependent.
  type (type_scenario_ref) :: i_runaway  ! /i_runaway - runaway current  [A]. Time-dependent.
  type (type_scenario_ref) :: v_loop  ! /v_loop - loop voltage @ LCMS / LFS , equatorial point  [V]. Time-dependent.
  type (type_scenario_ref) :: v_meas  ! /v_meas - loop voltage measured on a  coil   [V]. Time-dependent.
endtype

  
type type_scenario_confinement  !    characteristic confinement times
  type (type_scenario_ref) :: tau_e  ! /tau_e - thermal energy confinement time [s]. Time-dependent.
  type (type_scenario_ref) :: tau_l_sc  ! /tau_l_sc - confinement time given by the selected L-mode scaling law [s]. Time-dependent.
  type (type_scenario_ref) :: tau_h_sc  ! /tau_h_sc - confinement time given by the selected H-mode scaling law [s]. Time-dependent.
  type (type_scenario_ref) :: tau_he  ! /tau_he - Helium ashes confinement time [s]. Time-dependent.
  type (type_scenario_ref) :: tau_e_ee  ! /tau_e_ee - electron energy confimenent time [s]. Time-dependent.
  type (type_scenario_ref) :: tau_e_ii  ! /tau_e_ii - ion energy confinement time [s]. Time-dependent.
  type (type_scenario_ref) :: tau_e_ei  ! /tau_e_ei - energy equipartition characteristic time [s]. Time-dependent.
  type (type_scenario_ref) :: tau_cur_diff  ! /tau_cur_diff - characteristic time for current diffusion  [s]. Time-dependent.
  type (type_scenario_ref) :: tau_i_rol  ! /tau_i_rol - characteristic time for current decrease in tokamak equivalent R/L circuit [s]. Time-dependent.
endtype

  
type type_scenario_configuration  !    Strings describing the tokamak configuration
  type (type_scenario_int) :: config  ! /config - plasma configuration (limiter/divertor ...) []. Time-dependent. Possible values : 0 = undetermined; 
  character(len=132), dimension(:), pointer ::lmode_sc => null()       ! /lmode_sc - name of the L-mode scaling law. String.
  character(len=132), dimension(:), pointer ::hmode_sc => null()       ! /hmode_sc - name of the H-mode scaling law. String.
  character(len=132), dimension(:), pointer ::core_sc => null()       ! /core_sc - name of the core plasma  energy scaling law. String.
  character(len=132), dimension(:), pointer ::pedestal_sc => null()       ! /pedestal_sc - name of the  pedestal energy scaling law. String.
  character(len=132), dimension(:), pointer ::helium_sc => null()       ! /helium_sc - name of the  helium confinement time scaling law. String.
  character(len=132), dimension(:), pointer ::impurity_sc => null()       ! /impurity_sc - name of the impurities confinement time scaling law
  character(len=132), dimension(:), pointer ::l2h_sc => null()       ! /l2h_sc - name of the  L-mode to H-mode power threshold scaling law. String.
  character(len=132), dimension(:), pointer ::tor_rot_sc => null()       ! /tor_rot_sc - name of the toroidal spontaneous rotation  scaling law. String.
  character(len=132), dimension(:), pointer ::wall_mat => null()       ! /wall_mat - chemical compostion of the wall. String.
  character(len=132), dimension(:), pointer ::evap_mat => null()       ! /evap_mat - chemical compostion evaporated wall conditioning material. String.
  character(len=132), dimension(:), pointer ::lim_mat => null()       ! /lim_mat - chemical compostion of the limiter. String.
  character(len=132), dimension(:), pointer ::div_mat => null()       ! /div_mat - chemical compostion of the divertor
  character(len=132), dimension(:), pointer ::coordinate => null()       ! /coordinate - name/definition of the internal coordinate of the simulator that are given by the data named rho
  type (type_scenario_ref) :: ecrh_freq  ! /ecrh_freq - ECRH frequency [Hz]. Time-dependent.
  type (type_scenario_ref) :: ecrh_loc  ! /ecrh_loc - position of maximum ECRH deposition on scale of rho [rho]. Time-dependent.
  type (type_scenario_int) :: ecrh_mode  ! /ecrh_mode - polarisation of ecrh wave (0 = O mode, 1 = X mode) []. Time-dependent.
  type (type_scenario_ref) :: ecrh_tor_ang  ! /ecrh_tor_ang - toroidal angle of ECRH at resonance  [rad] Time-dependent.
  type (type_scenario_ref) :: ecrh_pol_ang  ! /ecrh_pol_ang - poloidal angle of ECRH resonance positon (0= LFS, pi/2 = top, -pi/2 = down, pi = HFS)  [rad]. Time-d
  type (type_scenario_int) :: ecrh_harm  ! /ecrh_harm - harmonic number of the apsorbed ecrh wave []. Time-dependent.
  type (type_scenario_ref) :: enbi  ! /enbi - energy of the neutral beam [eV]. Time-dependent.
  type (type_scenario_ref) :: r_nbi  ! /r_nbi - Major radius of tengance of NBI [m]. Time-dependent.
  type (type_scenario_int) :: grad_b_drift  ! /grad_b_drift - direction of ion grad-B drift (1= to lower divertor, -1 = from lower divertor)  []. Time-dependent.
  type (type_scenario_ref) :: icrh_freq  ! /icrh_freq - ICRH frequency [Hz]. Time-dependent.
  character(len=132), dimension(:), pointer ::icrh_scheme => null()       ! /icrh_scheme - icrh scheme either : H_min_1; He3_min; T_harm_2; FW; FW_CD; FW_CCD
  type (type_scenario_ref) :: icrh_phase  ! /icrh_phase - ICRH antenna phasing [rad]. Time-dependent.
  type (type_scenario_ref) :: LH_freq  ! /LH_freq - LHCD frequency [Hz]. Time-dependent.
  type (type_scenario_ref) :: LH_npar  ! /LH_npar - LHCD parallel indice []. Time-dependent.
  type (type_scenario_ref) :: pellet_ang  ! /pellet_ang - pellet injection positon (0= LFS, pi/2 = top, -pi/2 = down, pi = HFS)  [rad]. Time-dependent.
  type (type_scenario_ref) :: pellet_v  ! /pellet_v - pellet injection velocity [m/s]. Time-dependent.
  type (type_scenario_ref) :: pellet_nba  ! /pellet_nba - initial number of atoms in pellet  []. Time-dependent.
endtype

  
type type_scenario_composition  !    Plasma composition (description of ion species).
  real(EUITM_R8),pointer  :: amn(:) => null()     ! /amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zn(:) => null()     ! /zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zion(:) => null()     ! /zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer,pointer  :: imp_flag(:) => null()      ! /imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  integer,pointer  :: rot_imp_flag(:) => null()      ! /rot_imp_flag - set to 1 for the impurity corresponding at the given toroidal rotation, otherwise = 0
  real(EUITM_R8),pointer  :: pellet_amn(:) => null()     ! /pellet_amn - Atomic mass number (for pellet injector); Vector (nion)
  real(EUITM_R8),pointer  :: pellet_zn(:) => null()     ! /pellet_zn - Nuclear charge (pellet injector); Vector (nion)
  real(EUITM_R8),pointer  :: nbi_amn(:) => null()     ! /nbi_amn - Atomic mass number (for neutral beam injection); Vector (nion)
  real(EUITM_R8),pointer  :: nbi_zn(:) => null()     ! /nbi_zn - Nuclear charge (for neutral beam injection); Vector (nion)
endtype

  
type type_scenario_centre  !    central values of the profiles (at magnetic axis)
  type (type_scenario_ref) :: te0  ! /te0 - central electron temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ti0  ! /ti0 - central ion temperature [eV]. Time-dependent.
  type (type_scenario_ref) :: ne0  ! /ne0 - central electron density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: ni0  ! /ni0 - central ion density [m^-3]. Time-dependent.
  type (type_scenario_ref) :: shift0  ! /shift0 - central value of Shafranov shift [m]. Time-dependent.
  type (type_scenario_ref) :: psi0  ! /psi0 - pedestal poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: phi0  ! /phi0 - central toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref) :: q0  ! /q0 - central safety factor value []. Time-dependent.
  type (type_scenario_ref) :: Rmag  ! /Rmag - radius of magnetic axis [R]. Time-dependent.
  type (type_scenario_ref) :: Zmag  ! /Zmag - Z coordinate of magnetic axis [R]. Time-dependent.
  type (type_scenario_ref) :: vtor_0  ! /vtor_0 - central rotation velocity of selected impurity [m/s]. Time-dependent.
endtype
  
type type_scenario_ref_mask  !    Structure for scenario reference; Time-dependent
  integer  :: value=0       ! /value - Signal value; Time-dependent; Scalar
  integer  :: source=0       ! /source - Source of the signal (any comment describing the origin of the signal : code, path to diagnostic sig
endtype
  
type type_scenario_int_mask  !    Structure for scenario integer flag; Time-dependent
  integer  :: value=0       ! /value - Signal value; Time-dependent; Scalar Integer.
  integer  :: source=0       ! /source - Source of the signal (any comment describing the origin of the signal : code, path to diagnostic sig
endtype
  
type type_scenario_reactor_mask  !    reactor data (such as electricity cost ...)
  integer  :: pnetwork=0       ! /pnetwork - reactor electric power provide to the network [W].
endtype
  
type type_scenario_vol_ave_mask  !    volume averaged values
  type (type_scenario_ref_mask) :: te_ave  ! /te_ave - volume averaged electron temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_ave  ! /ti_ave - volume averaged ion temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_ave  ! /ne_ave - volume averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: dne_ave_dt  ! /dne_ave_dt - time derivative of volume averaged electron density [m^-3/s]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_ave  ! /ni_ave - volume averaged ion density (<sum(n_k)>, k in species) [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: zeff_ave  ! /zeff_ave - volume averaged effective charge. Time-dependent.
  type (type_scenario_ref_mask) :: ti_o_te_ave  ! /ti_o_te_ave - volume averaged ion temperature over electron temperature  (<Ti/Te>) []. Time-dependent.
  type (type_scenario_ref_mask) :: meff_ave  ! /meff_ave - volume averaged effectice mass  (<sum(n_k * m_k)  > /  < sum(n_k)> ) []. Time-dependent.
  type (type_scenario_ref_mask) :: pellet_flux  ! /pellet_flux - number of electrons fuelling  the plasma every second coming from pellet injection [s^-1]. Time-depe
  integer  :: nions_ave=0       ! /nions_ave - volume averaged ions densities (vector, one element per ion species) [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: omega_ave  ! /omega_ave - bulk volume average toroidal rotation velocity (whole plasma) [rad/s]. Time-dependent.
endtype
  
type type_scenario_references_mask  !    References
  type (type_scenario_ref_mask) :: plh  ! /plh - Lower hybrid power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: picrh  ! /picrh - Ion cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pecrh  ! /pecrh - electron cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pnbi  ! /pnbi - neutral beam injection power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: ip  ! /ip - Plasma current [A]. Time-dependent.
  type (type_scenario_ref_mask) :: bvac_r  ! /bvac_r - Vacuum field times radius in the toroidal field magnet [T.m]. Time-dependent.
  type (type_scenario_ref_mask) :: zeffl  ! /zeffl - line averaged effective charge []. Time-dependent.
  type (type_scenario_ref_mask) :: nbar  ! /nbar - line averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: xecrh  ! /xecrh - position of maximum  (normalized rho coordinate) of electron cyclotron resonnance heating power []. 
  type (type_scenario_ref_mask) :: pol_flux  ! /pol_flux - separatrix poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: enhancement  ! /enhancement - energy enhancement factor []. Time-dependent.
  type (type_scenario_ref_mask) :: isotopic  ! /isotopic - ratio between tritium  and deuterium density (for burning plasma)  []. Time-dependent.
  type (type_scenario_ref_mask) :: nbi_td_ratio  ! /nbi_td_ratio - ratio between tritium  and deuterium power in neutral beam injection  []. Time-dependent.
  type (type_scenario_ref_mask) :: gas_puff  ! /gas_puff - gas puff flux reference, in equivalent [electrons.s^-1]. Time-dependent.
endtype
  
type type_scenario_sol_mask  !    SOL characteristic  (@ LCMS)
  type (type_scenario_ref_mask) :: l_te_sol  ! /l_te_sol - electron temperature radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: l_ti_sol  ! /l_ti_sol - ion temperature  radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: l_ne_sol  ! /l_ne_sol - electron density radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: l_ni_sol  ! /l_ni_sol - ion density  radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: l_qe_sol  ! /l_qe_sol - electron heat flux radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: l_qi_sol  ! /l_qi_sol - ion  heat flux radial decay length [m]. Time-dependent.
  type (type_scenario_ref_mask) :: p_rad_sol  ! /p_rad_sol - radiative power of the SOL [W]. Time-dependent.
  integer  :: p_neut=0       ! /p_neut - Neutral pressure of the SOL [Pa]; Scalar
  type (type_scenario_ref_mask) :: gas_puff  ! /gas_puff - gas puff flux for each ion species [s^-1]. Time-dependent.
  integer  :: delta_r_in=0       ! /delta_r_in - Inner gap between the plasma and the first wall [m]; Scalar
  integer  :: delta_r_out=0       ! /delta_r_out - Outer gap between the plasma and the first wall [m]; Scalar
  integer  :: r_in=0       ! /r_in - Inner radius of the first wall [m]; Scalar
  integer  :: r_out=0       ! /r_out - Outer radius of the first wall [m]; Scalar
  integer  :: sol_width=0       ! /sol_width - Width of the SOL (the heat flux is assumed to fall off exponentially in the SOL according to the wid
endtype
  
type type_scenario_pedestal_mask  !    Values at the top of the H-mode pedestal
  type (type_scenario_ref_mask) :: te_ped  ! /te_ped - pedestal electron temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_ped  ! /ti_ped - pedestal ion temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_ped  ! /ne_ped - pedestal electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_ped  ! /ni_ped - pedestal ion density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: psi_ped  ! /psi_ped - pedestal poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: phi_ped  ! /phi_ped - pedestal toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: rho_ped  ! /rho_ped - top pedestal value of internal simulator coordinate [m]. Time-dependent.
  type (type_scenario_ref_mask) :: q_ped  ! /q_ped - top pedestal safety factor value []. Time-dependent.
  type (type_scenario_ref_mask) :: pressure_ped  ! /pressure_ped - top pedestal thermal pressure (n_e * T_e  + n_i * T_i) [Pa]. Time-dependent.
  type (type_scenario_ref_mask) :: vtor_ped  ! /vtor_ped - top pedestal value of rotation velocity of selected impurity [m/s]. Time-dependent.
endtype
  
type type_scenario_ninety_five_mask  !    values at 95% of poloidal flux
  type (type_scenario_ref_mask) :: q_95  ! /q_95 - safety factor value  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref_mask) :: elong_95  ! /elong_95 - plasma elongation  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref_mask) :: tria_95  ! /tria_95 - averaged plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref_mask) :: tria_up_95  ! /tria_up_95 - upper plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref_mask) :: tria_lo_95  ! /tria_lo_95 - lower plasma triangularity  @ 95 % of poloidal flux span []. Time-dependent.
  type (type_scenario_ref_mask) :: te_95  ! /te_95 - electron temperature  @ 95 % of poloidal flux [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_95  ! /ti_95 - ion temperature  @ 95 % of poloidal flux [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_95  ! /ne_95 - electron density  @ 95 % of poloidal flux [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_95  ! /ni_95 - ion density  @ 95 % of poloidal flux [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: phi_95  ! /phi_95 - toroidal flux  @ 95 % of poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: rho_95  ! /rho_95 -  value of internal simulator coordinate  @ 95 % of poloidal flux [m]. Time-dependent.
  type (type_scenario_ref_mask) :: vtor_95  ! /vtor_95 - rotation velocity of selected impurity   @ 95 % of poloidal flux [m/s]. Time-dependent.
endtype
  
type type_scenario_neutron_mask  !    neutron flux for DD and DT reactions
  type (type_scenario_ref_mask) :: ndd_tot  ! /ndd_tot - total neutron flux coming  from DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ndd_th  ! /ndd_th - neutron flux coming  from thermal  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ndd_nbi_th  ! /ndd_nbi_th - neutron flux coming  from beam/plasma  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ndd_nbi_nbi  ! /ndd_nbi_nbi - neutron flux coming  from beam/beam  DD reactions [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ndt_tot  ! /ndt_tot - total neutron flux coming  from DT reactions [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ndt_th  ! /ndt_th - neutron flux coming  from thermal DT reactions [Hz]. Time-dependent.
endtype
  
type type_scenario_line_ave_mask  !    line averaged value
  type (type_scenario_ref_mask) :: ne_line  ! /ne_line - line averaged electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: zeff_line  ! /zeff_line - line averaged effective charge. Time-dependent.
  type (type_scenario_ref_mask) :: ne_zeff_line  ! /ne_zeff_line - line averaged electron density * Zeff . Time-dependent.
  type (type_scenario_ref_mask) :: dne_line_dt  ! /dne_line_dt - time derivative of line averaged electron density [m^-3/s]. Time-dependent.
endtype
  
type type_scenario_lim_div_wall_mask  !    values on the plate of divertor or on the limitor or on the wall (@ LCMS)
  type (type_scenario_ref_mask) :: te_lim_div  ! /te_lim_div - limiter/divertor electron temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_lim_div  ! /ti_lim_div - limiter/divertor ion temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_lim_div  ! /ne_lim_div - limiter/divertor electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_lim_div  ! /ni_lim_div - limiter/divertor ion density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: q_peak_div  ! /q_peak_div - Peak power flux on limiter or divertor plate [W.m^-2]. Time-dependent.
  type (type_scenario_ref_mask) :: q_peak_wall  ! /q_peak_wall - Peak power flux on the wall [W.m^-2]. Time-dependent.
  type (type_scenario_ref_mask) :: surf_temp  ! /surf_temp - limiter surface or divertor plate temperature [K]. Time-dependent.
  type (type_scenario_ref_mask) :: p_lim_div  ! /p_lim_div - Total power on limiter or divertor plate [W]. Time-dependent.
  type (type_scenario_ref_mask) :: p_rad_div  ! /p_rad_div - radiative power in the divertor zone [W]. Time-dependent.
  type (type_scenario_ref_mask) :: p_neut_div  ! /p_neut_div - Neutral pressure in the divertor zone [Pa]; Time-dependent.
  type (type_scenario_ref_mask) :: p_wall  ! /p_wall - Total power on the wall [W]. Time-dependent.
  type (type_scenario_ref_mask) :: wall_temp  ! /wall_temp - wall temperature [K]. Time-dependent.
  type (type_scenario_ref_mask) :: wall_state  ! /wall_state - saturation state of the wall (0 = completly pumping wall, 1 = competely saturate wall) []. Time-depe
  type (type_scenario_ref_mask) :: detach_state  ! /detach_state - plasma detachement state (0= attach plasma, 1 = completely detach plasma) []. Time-dependent.
  type (type_scenario_ref_mask) :: pump_flux  ! /pump_flux - flux pump out for each ion species [s^-1]. Time-dependent.
  type (type_scenario_ref_mask) :: p_rad_fw  ! /p_rad_fw - Radiated power on the first wall [W]; Time-dependent
  type (type_scenario_ref_mask) :: p_cond_fw  ! /p_cond_fw - Conducted/convected power  on the first wall [W]; Time-dependent
  type (type_scenario_ref_mask) :: div_wetted  ! /div_wetted - Divertor wetted area [m^2]; Time-dependent
  type (type_scenario_ref_mask) :: gas_puff  ! /gas_puff - Gas puff (D/T) in the divertor (PFR) [Pa.m^3.s^-1]; Time-dependent
  type (type_scenario_ref_mask) :: ar_concentr  ! /ar_concentr - Argon concentration in the divertor; Time-dependent
  type (type_scenario_ref_mask) :: part_exhaust  ! /part_exhaust - Assuming a pumping speed [Pa.m^3.s^-1]; Time-dependent
  type (type_scenario_ref_mask) :: f_inner  ! /f_inner - Fraction of power to the inner divertor; Time-dependent
  type (type_scenario_ref_mask) :: f_outer  ! /f_outer - Fraction of power to the outer divertor; Time-dependent
  type (type_scenario_ref_mask) :: f_pfr  ! /f_pfr - Fraction of power flowing into the private flux region; Time-dependent
  type (type_scenario_ref_mask) :: f_rad_fw  ! /f_rad_fw - Fraction of the divertor radiated power deposited in the main chamber; Time-dependent
  integer  :: q_div=0       ! /q_div - Heat flux on divertor plate [W/m^2]; Vector(theta). Time-dependent
  type (type_scenario_ref_mask) :: p_cond_div  ! /p_cond_div - Conducted/convected power on divertor plate  [W]; Time-dependent
  integer  :: pol_ext=0       ! /pol_ext - Poloidal extension of the divertor or outer major radius of the divertor region (and inner major rad
  integer  :: flux_exp=0       ! /flux_exp - Flux expansion at the divertor plate ((B_theta/B)midplane)/((B_theta/B)target); Scalar
  integer  :: tilt_angle=0       ! /tilt_angle - Tilt angle between the field lines and the divertor plate in a poloidal plane [rad]; Scalar
  integer  :: n_div=0       ! /n_div - Number of divertor, assuming symmetric configuration; Scalar
  integer  :: div_dz=0       ! /div_dz - Divertor extension in z direction from the x-point [m]; Scalar
  integer  :: div_dro=0       ! /div_dro - Divertor extension in r outward direction from the x-point [m]; Scalar
  integer  :: div_dri=0       ! /div_dri - Divertor extension in r intward direction from the x-point [m]; Scalar
  type (type_scenario_ref_mask) :: p_nh_div  ! /p_nh_div - Total nuclear heating in divertor [W]. Time-dependent.
endtype
  
type type_scenario_itb_mask  !    Values characteristics of the Internal Transport Barrier
  type (type_scenario_ref_mask) :: q_min  ! /q_min - minimal value of safety factor []. Time-dependent.
  type (type_scenario_ref_mask) :: te_itb  ! /te_itb - electron temperature @ q = q_min [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_itb  ! /ti_itb - ion temperature @ q = q_min [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_itb  ! /ne_itb - electron density  @ q = q_min [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_itb  ! /ni_itb - ion density  @ q = q_min [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: psi_itb  ! /psi_itb - poloidal flux @ q = q_min [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: phi_itb  ! /phi_itb - toroidal flux @ q = q_min [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: rho_itb  ! /rho_itb - value of internal simulator coordinate @ q = q_min [m]. Time-dependent.
  type (type_scenario_ref_mask) :: h_itb  ! /h_itb - energy enhancement ITB factor [m]. Time-dependent.
  type (type_scenario_ref_mask) :: width_itb  ! /width_itb - width of the high pressure gradient region (on scale of rho_itb) [m]. Time-dependent.
  type (type_scenario_ref_mask) :: vtor_itb  ! /vtor_itb - rotation velocity of selected impurity @ rho_itb [m/s]. Time-dependent.
  type (type_scenario_int_mask) :: itb_type  ! /itb_type - itb type []. Time-dependent. Any combinaison of :0 = none; 1 = on T_i; 2 = on T_e; 4  = on n_e; 8 = 
endtype
  
type type_scenario_heat_power_mask  !    Power delivred to plasma (thermal an non thermal)
  type (type_scenario_ref_mask) :: plh  ! /plh - Lower hybrid power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pohmic  ! /pohmic - ohmic power (thermal species contribution only) [W]. Time-dependent.
  type (type_scenario_ref_mask) :: picrh  ! /picrh - Ion cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pecrh  ! /pecrh - electron cyclotron resonnance heating power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pnbi  ! /pnbi - neutral beam injection power [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pnbi_co_cur  ! /pnbi_co_cur - neutral beam injection power injeted in co-current direction [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pnbi_counter  ! /pnbi_counter - neutral beam injection power injeted in counter-current direction [W]. Time-dependent.
  type (type_scenario_ref_mask) :: plh_th  ! /plh_th - lower hybrid power deposited on thermal electrons [W]. Time-dependent.
  type (type_scenario_ref_mask) :: picrh_th  ! /picrh_th - ion cyclotron resonnance heating power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pecrh_th  ! /pecrh_th - electron cyclotron resonnance heating power deposited on thermal electrons [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pnbi_th  ! /pnbi_th - neutral beam injection power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref_mask) :: ploss_icrh  ! /ploss_icrh - Ion cyclotron resonnance heating power losses [W]. Time-dependent.
  type (type_scenario_ref_mask) :: ploss_nbi  ! /ploss_nbi - neutral beam injection power losses (including shine-through) [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pbrem  ! /pbrem - Bremsstrahlung radition losses [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pcyclo  ! /pcyclo - cyclotron radiation losses [W]. Time-dependent.
  type (type_scenario_ref_mask) :: prad  ! /prad - impurity radition losses in core plamsa , without Bremsstrahlung [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pdd_fus  ! /pdd_fus - fusion power due to DD reactions [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pei  ! /pei - power exchange between eletron and ion (equipartition) [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pel_tot  ! /pel_tot - total thermal electron power deposition without equipartition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pel_fus  ! /pel_fus - fusion electron power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pel_icrh  ! /pel_icrh - ICRH  electron power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pel_nbi  ! /pel_nbi - NBI electron power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pfus_dt  ! /pfus_dt - total D-T fusion power of alpha [W]. Time-dependent.
  type (type_scenario_ref_mask) :: ploss_fus  ! /ploss_fus - D-T fusion power of alpha losses  [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pfus_nbi  ! /pfus_nbi - NBI induce D-T fusion power of alpha  [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pfus_th  ! /pfus_th - alpha (from DT fusion reaction)  power deposited on thermal species [W]. Time-dependent.
  type (type_scenario_ref_mask) :: padd_tot  ! /padd_tot - total additional power input including ohmic power  [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pion_tot  ! /pion_tot - total thermal ion power deposition without equipartition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pion_fus  ! /pion_fus - fusion ion power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pion_icrh  ! /pion_icrh - ICRH  ion power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pion_nbi  ! /pion_nbi - NBI  ion power deposition [W]. Time-dependent.
  type (type_scenario_ref_mask) :: pioniz  ! /pioniz - power losses due to cold neutral ionization [W]. Time-dependent.
  type (type_scenario_ref_mask) :: ploss  ! /ploss - plasma losses power, as define in ITER basis [W]. Time-dependent.
  type (type_scenario_ref_mask) :: p_wth  ! /p_wth - thermal power input, define as tau_E * P_th = Wth [W]. Time-dependent.
  type (type_scenario_ref_mask) :: p_w  ! /p_w - effective power define as tau_E  * P_w = W_tot [W]. Time-dependent.
  type (type_scenario_ref_mask) :: p_l2h_thr  ! /p_l2h_thr - additionnal power crossing the LCMS; must be compare to  L->H threshold power (Ryter PPCF 2002) [W].
  type (type_scenario_ref_mask) :: p_l2h_sc  ! /p_l2h_sc - threshold power given by the choosen scaling law for transition from L-mode to H-mode  [W]. Time-dep
  type (type_scenario_ref_mask) :: p_nbi_icrh  ! /p_nbi_icrh - beam power increase due to  ICRH effects  [W]. Time-dependent.
endtype
  
type type_scenario_global_mask  !     global scalar value 
  type (type_scenario_ref_mask) :: ip  ! /ip - Plasma current [A]. Time-dependent.
  type (type_scenario_ref_mask) :: dip_dt  ! /dip_dt - time derivative of plasma current [A/s]. Time-dependent.
  type (type_scenario_ref_mask) :: beta_pol  ! /beta_pol - poloidal beta []. Time-dependent.
  type (type_scenario_ref_mask) :: beta_tor  ! /beta_tor - toroidal beta []. Time-dependent.
  type (type_scenario_ref_mask) :: beta_normal  ! /beta_normal - normalised beta []. Time-dependent.
  type (type_scenario_ref_mask) :: li  ! /li - internal inductance (definition 3). Time-dependent.
  type (type_scenario_ref_mask) :: volume  ! /volume - total plasma volume [m^3]. Time-dependent.
  type (type_scenario_ref_mask) :: area_pol  ! /area_pol - area poloidal cross section [m^2]. Time-dependent.
  type (type_scenario_ref_mask) :: area_ext  ! /area_ext - external plasma surface [m^2]. Time-dependent.
  type (type_scenario_ref_mask) :: len_sepa  ! /len_sepa - length of the separatrix [m]. Time-dependent.
  type (type_scenario_ref_mask) :: beta_pol_th  ! /beta_pol_th - poloidal beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref_mask) :: beta_tor_th  ! /beta_tor_th - toroidal beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref_mask) :: beta_n_th  ! /beta_n_th - normalised beta, thermal contribution []. Time-dependent.
  type (type_scenario_ref_mask) :: disruption  ! /disruption - flag for disruption (set to 1 for disruption, oterwise equal 0) []. Time-dependent.
  type (type_scenario_ref_mask) :: mode_h  ! /mode_h - confinement mode verus time:  0 = L-mode et 1 = H-mode []. Time-dependent.
  type (type_scenario_ref_mask) :: s_alpha  ! /s_alpha - total number of alpha fusion  particules from D-T ractions  per second [s^-1]. Time-dependent.
endtype
  
type type_scenario_energy_mask  !    plasma energy content
  type (type_scenario_ref_mask) :: w_tot  ! /w_tot - total plasma energy [J]. Time-dependent.
  type (type_scenario_ref_mask) :: w_b_pol  ! /w_b_pol - poloidal field energy of  the plasma [J]. Time-dependent.
  type (type_scenario_ref_mask) :: w_dia  ! /w_dia - 3/2 perpendicular plasma energy [J]. Time-dependent.
  type (type_scenario_ref_mask) :: dwdia_dt  ! /dwdia_dt - time derivative of Wdia [W]. Time-dependent.
  type (type_scenario_ref_mask) :: w_b_tor_pla  ! /w_b_tor_pla - toroidal magnetic plasma energy  [J]. Time-dependent.
  type (type_scenario_ref_mask) :: w_th  ! /w_th - thermal plasma energy [J]. Time-dependent.
  type (type_scenario_ref_mask) :: dwtot_dt  ! /dwtot_dt - time derivative of total plasma energy [W]. Time-dependent.
  type (type_scenario_ref_mask) :: dwbpol_dt  ! /dwbpol_dt - time derivative of plasma poloidal field energy [W]. Time-dependent.
  type (type_scenario_ref_mask) :: dwbtorpla_dt  ! /dwbtorpla_dt - time derivative of toroidal magnetic plasma energy  [W]. Time-dependent.
  type (type_scenario_ref_mask) :: dwth_dt  ! /dwth_dt - time derivative of thermal plasma energy [W]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_icrhtot  ! /esup_icrhtot - total suprathermal energy of fast ions accelerated  by ICRH [J]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_icrhper  ! /esup_icrhper - perpendicular part of suprathermal energy of fast ions accelerated  by ICRH [J]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_nbitot  ! /esup_nbitot - total suprathermal energy of fast ions from NBI ionisation [J]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_nbiperp  ! /esup_nbiperp - perpendicular part of suprathermal energy of fast ions from NBI ionisation [J]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_lhcd  ! /esup_lhcd - total suprathermal energy of fast electron from LHCD [J]. Time-dependent.
  type (type_scenario_ref_mask) :: esup_alpha  ! /esup_alpha - total suprathermal energy of fast alpha particules [J]. Time-dependent.
endtype
  
type type_scenario_edge_mask  !    edge value (@ LCMS)
  type (type_scenario_ref_mask) :: te_edge  ! /te_edge - edge electron temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti_edge  ! /ti_edge - edge ion temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne_edge  ! /ne_edge - edge electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni_edge  ! /ni_edge - edge ion density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: psi_edge  ! /psi_edge - edge  poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: phi_edge  ! /phi_edge - edge  toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: rho_edge  ! /rho_edge - edge value of internal simulator coordinate [m]. Time-dependent.
  type (type_scenario_ref_mask) :: drho_edge_dt  ! /drho_edge_dt - time derivative of edge value of internal simulator coordinate [m/s]. Time-dependent.
  type (type_scenario_ref_mask) :: q_edge  ! /q_edge - edge or effective  safety factor value []. Time-dependent.
  type (type_scenario_ref_mask) :: neutral_flux  ! /neutral_flux - number of cold neutral (in equivalent electron for Z >1) that input in  plasma at the edge every sec
  type (type_scenario_ref_mask) :: phi_plasma  ! /phi_plasma - contribution of the plasma to the toroidal flux (used for toroidal coils heat load computation) [Wb]
  type (type_scenario_ref_mask) :: vtor_edge  ! /vtor_edge - rotation velocity of selected impurity on the separatrix [m/s]. Time-dependent.
endtype
  
type type_scenario_currents_mask  !    data related to current sources and current diffusion
  type (type_scenario_ref_mask) :: RR  ! /RR - plasma resistivity [ohm]. Time-dependent.
  type (type_scenario_ref_mask) :: i_align  ! /i_align - current drive alignment quality parameter (1 = good , 0 = bad). Time-dependent.
  type (type_scenario_ref_mask) :: i_boot  ! /i_boot - bootstrap current [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_cd_tot  ! /i_cd_tot - total current drive [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_eccd  ! /i_eccd - Electron Cyclotron current drive [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_fast_ion  ! /i_fast_ion - fast ions bootstrap like current drive  (i.e. fast alpha) [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_fwcd  ! /i_fwcd - Fast Wave current drive [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_lhcd  ! /i_lhcd - Lower Hybrid current drive [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_nbicd  ! /i_nbicd - Neutral Beam Injection current drive  [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_ni_tot  ! /i_ni_tot - total non inductive current  [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_ohm  ! /i_ohm - ohmic current  [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_par  ! /i_par - total plasma current (projected on B : <J.B>/B0)   [A]. Time-dependent.
  type (type_scenario_ref_mask) :: i_runaway  ! /i_runaway - runaway current  [A]. Time-dependent.
  type (type_scenario_ref_mask) :: v_loop  ! /v_loop - loop voltage @ LCMS / LFS , equatorial point  [V]. Time-dependent.
  type (type_scenario_ref_mask) :: v_meas  ! /v_meas - loop voltage measured on a  coil   [V]. Time-dependent.
endtype
  
type type_scenario_confinement_mask  !    characteristic confinement times
  type (type_scenario_ref_mask) :: tau_e  ! /tau_e - thermal energy confinement time [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_l_sc  ! /tau_l_sc - confinement time given by the selected L-mode scaling law [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_h_sc  ! /tau_h_sc - confinement time given by the selected H-mode scaling law [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_he  ! /tau_he - Helium ashes confinement time [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_e_ee  ! /tau_e_ee - electron energy confimenent time [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_e_ii  ! /tau_e_ii - ion energy confinement time [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_e_ei  ! /tau_e_ei - energy equipartition characteristic time [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_cur_diff  ! /tau_cur_diff - characteristic time for current diffusion  [s]. Time-dependent.
  type (type_scenario_ref_mask) :: tau_i_rol  ! /tau_i_rol - characteristic time for current decrease in tokamak equivalent R/L circuit [s]. Time-dependent.
endtype
  
type type_scenario_configuration_mask  !    Strings describing the tokamak configuration
  type (type_scenario_int_mask) :: config  ! /config - plasma configuration (limiter/divertor ...) []. Time-dependent. Possible values : 0 = undetermined; 
  integer  :: lmode_sc=0       ! /lmode_sc - name of the L-mode scaling law. String.
  integer  :: hmode_sc=0       ! /hmode_sc - name of the H-mode scaling law. String.
  integer  :: core_sc=0       ! /core_sc - name of the core plasma  energy scaling law. String.
  integer  :: pedestal_sc=0       ! /pedestal_sc - name of the  pedestal energy scaling law. String.
  integer  :: helium_sc=0       ! /helium_sc - name of the  helium confinement time scaling law. String.
  integer  :: impurity_sc=0       ! /impurity_sc - name of the impurities confinement time scaling law
  integer  :: l2h_sc=0       ! /l2h_sc - name of the  L-mode to H-mode power threshold scaling law. String.
  integer  :: tor_rot_sc=0       ! /tor_rot_sc - name of the toroidal spontaneous rotation  scaling law. String.
  integer  :: wall_mat=0       ! /wall_mat - chemical compostion of the wall. String.
  integer  :: evap_mat=0       ! /evap_mat - chemical compostion evaporated wall conditioning material. String.
  integer  :: lim_mat=0       ! /lim_mat - chemical compostion of the limiter. String.
  integer  :: div_mat=0       ! /div_mat - chemical compostion of the divertor
  integer  :: coordinate=0       ! /coordinate - name/definition of the internal coordinate of the simulator that are given by the data named rho
  type (type_scenario_ref_mask) :: ecrh_freq  ! /ecrh_freq - ECRH frequency [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: ecrh_loc  ! /ecrh_loc - position of maximum ECRH deposition on scale of rho [rho]. Time-dependent.
  type (type_scenario_int_mask) :: ecrh_mode  ! /ecrh_mode - polarisation of ecrh wave (0 = O mode, 1 = X mode) []. Time-dependent.
  type (type_scenario_ref_mask) :: ecrh_tor_ang  ! /ecrh_tor_ang - toroidal angle of ECRH at resonance  [rad] Time-dependent.
  type (type_scenario_ref_mask) :: ecrh_pol_ang  ! /ecrh_pol_ang - poloidal angle of ECRH resonance positon (0= LFS, pi/2 = top, -pi/2 = down, pi = HFS)  [rad]. Time-d
  type (type_scenario_int_mask) :: ecrh_harm  ! /ecrh_harm - harmonic number of the apsorbed ecrh wave []. Time-dependent.
  type (type_scenario_ref_mask) :: enbi  ! /enbi - energy of the neutral beam [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: r_nbi  ! /r_nbi - Major radius of tengance of NBI [m]. Time-dependent.
  type (type_scenario_int_mask) :: grad_b_drift  ! /grad_b_drift - direction of ion grad-B drift (1= to lower divertor, -1 = from lower divertor)  []. Time-dependent.
  type (type_scenario_ref_mask) :: icrh_freq  ! /icrh_freq - ICRH frequency [Hz]. Time-dependent.
  integer  :: icrh_scheme=0       ! /icrh_scheme - icrh scheme either : H_min_1; He3_min; T_harm_2; FW; FW_CD; FW_CCD
  type (type_scenario_ref_mask) :: icrh_phase  ! /icrh_phase - ICRH antenna phasing [rad]. Time-dependent.
  type (type_scenario_ref_mask) :: LH_freq  ! /LH_freq - LHCD frequency [Hz]. Time-dependent.
  type (type_scenario_ref_mask) :: LH_npar  ! /LH_npar - LHCD parallel indice []. Time-dependent.
  type (type_scenario_ref_mask) :: pellet_ang  ! /pellet_ang - pellet injection positon (0= LFS, pi/2 = top, -pi/2 = down, pi = HFS)  [rad]. Time-dependent.
  type (type_scenario_ref_mask) :: pellet_v  ! /pellet_v - pellet injection velocity [m/s]. Time-dependent.
  type (type_scenario_ref_mask) :: pellet_nba  ! /pellet_nba - initial number of atoms in pellet  []. Time-dependent.
endtype
  
type type_scenario_composition_mask  !    Plasma composition (description of ion species).
  integer  :: amn=0       ! /amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  integer  :: zn=0       ! /zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  integer  :: zion=0       ! /zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer  :: imp_flag=0       ! /imp_flag - Multiple charge state calculation flag : 0-Only one charge state is considered; 1-Multiple charge st
  integer  :: rot_imp_flag=0       ! /rot_imp_flag - set to 1 for the impurity corresponding at the given toroidal rotation, otherwise = 0
  integer  :: pellet_amn=0       ! /pellet_amn - Atomic mass number (for pellet injector); Vector (nion)
  integer  :: pellet_zn=0       ! /pellet_zn - Nuclear charge (pellet injector); Vector (nion)
  integer  :: nbi_amn=0       ! /nbi_amn - Atomic mass number (for neutral beam injection); Vector (nion)
  integer  :: nbi_zn=0       ! /nbi_zn - Nuclear charge (for neutral beam injection); Vector (nion)
endtype
  
type type_scenario_centre_mask  !    central values of the profiles (at magnetic axis)
  type (type_scenario_ref_mask) :: te0  ! /te0 - central electron temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ti0  ! /ti0 - central ion temperature [eV]. Time-dependent.
  type (type_scenario_ref_mask) :: ne0  ! /ne0 - central electron density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: ni0  ! /ni0 - central ion density [m^-3]. Time-dependent.
  type (type_scenario_ref_mask) :: shift0  ! /shift0 - central value of Shafranov shift [m]. Time-dependent.
  type (type_scenario_ref_mask) :: psi0  ! /psi0 - pedestal poloidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: phi0  ! /phi0 - central toroidal flux [Wb]. Time-dependent.
  type (type_scenario_ref_mask) :: q0  ! /q0 - central safety factor value []. Time-dependent.
  type (type_scenario_ref_mask) :: Rmag  ! /Rmag - radius of magnetic axis [R]. Time-dependent.
  type (type_scenario_ref_mask) :: Zmag  ! /Zmag - Z coordinate of magnetic axis [R]. Time-dependent.
  type (type_scenario_ref_mask) :: vtor_0  ! /vtor_0 - central rotation velocity of selected impurity [m/s]. Time-dependent.
endtype

  
type type_scenario  !    
  type (type_datainfo) :: datainfo  ! /scenario/datainfo - 
  type (type_scenario_centre) :: centre  ! /scenario/centre - central values of the profiles (at magnetic axis)
  type (type_scenario_composition) :: composition  ! /scenario/composition - Plasma composition (description of ion species).
  type (type_scenario_configuration) :: configs  ! /scenario/configs - Strings describing the tokamak configuration
  type (type_scenario_confinement) :: confinement  ! /scenario/confinement - characteristic confinement times
  type (type_scenario_currents) :: currents  ! /scenario/currents - data related to current sources and current diffusion
  type (type_scenario_edge) :: edge  ! /scenario/edge - edge value (@ LCMS)
  type (type_scenario_energy) :: energy  ! /scenario/energy - plasma energy content
  type (type_eqgeometry) :: eqgeometry  ! /scenario/eqgeometry - 
  type (type_scenario_global) :: global_param  ! /scenario/global_param - Global scalar values
  type (type_scenario_heat_power) :: heat_power  ! /scenario/heat_power - Power delivred to plasma (thermal and non thermal)
  type (type_scenario_itb) :: itb  ! /scenario/itb - Values characteristics of the Internal Transport Barrier
  type (type_scenario_lim_div_wall) :: lim_div_wall  ! /scenario/lim_div_wall - values on the plate of divertor or on the limitor or on the wall (@ LCMS)
  type (type_scenario_line_ave) :: line_ave  ! /scenario/line_ave - line averaged value
  type (type_scenario_neutron) :: neutron  ! /scenario/neutron - neutron flux for DD and DT reactions
  type (type_scenario_ninety_five) :: ninety_five  ! /scenario/ninety_five - values at 95% of poloidal flux
  type (type_scenario_pedestal) :: pedestal  ! /scenario/pedestal - Values at the top of the H-mode pedestal
  type (type_scenario_references) :: references  ! /scenario/references - References
  type (type_scenario_reactor) :: reactor  ! /scenario/reactor - reactor data (such as electricity cost ...)
  type (type_scenario_sol) :: sol  ! /scenario/sol - SOL characteristic  (@ LCMS)
  type (type_scenario_vol_ave) :: vol_ave  ! /scenario/vol_ave - volume averaged value
  type (type_codeparam) :: codeparam  ! /scenario/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /scenario/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_scenario_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /scenario/datainfo - 
  type (type_scenario_centre_mask) :: centre  ! /scenario/centre - central values of the profiles (at magnetic axis)
  type (type_scenario_composition_mask) :: composition  ! /scenario/composition - Plasma composition (description of ion species).
  type (type_scenario_configuration_mask) :: configs  ! /scenario/configs - Strings describing the tokamak configuration
  type (type_scenario_confinement_mask) :: confinement  ! /scenario/confinement - characteristic confinement times
  type (type_scenario_currents_mask) :: currents  ! /scenario/currents - data related to current sources and current diffusion
  type (type_scenario_edge_mask) :: edge  ! /scenario/edge - edge value (@ LCMS)
  type (type_scenario_energy_mask) :: energy  ! /scenario/energy - plasma energy content
  type (type_eqgeometry_mask) :: eqgeometry  ! /scenario/eqgeometry - 
  type (type_scenario_global_mask) :: global_param  ! /scenario/global_param - Global scalar values
  type (type_scenario_heat_power_mask) :: heat_power  ! /scenario/heat_power - Power delivred to plasma (thermal and non thermal)
  type (type_scenario_itb_mask) :: itb  ! /scenario/itb - Values characteristics of the Internal Transport Barrier
  type (type_scenario_lim_div_wall_mask) :: lim_div_wall  ! /scenario/lim_div_wall - values on the plate of divertor or on the limitor or on the wall (@ LCMS)
  type (type_scenario_line_ave_mask) :: line_ave  ! /scenario/line_ave - line averaged value
  type (type_scenario_neutron_mask) :: neutron  ! /scenario/neutron - neutron flux for DD and DT reactions
  type (type_scenario_ninety_five_mask) :: ninety_five  ! /scenario/ninety_five - values at 95% of poloidal flux
  type (type_scenario_pedestal_mask) :: pedestal  ! /scenario/pedestal - Values at the top of the H-mode pedestal
  type (type_scenario_references_mask) :: references  ! /scenario/references - References
  type (type_scenario_reactor_mask) :: reactor  ! /scenario/reactor - reactor data (such as electricity cost ...)
  type (type_scenario_sol_mask) :: sol  ! /scenario/sol - SOL characteristic  (@ LCMS)
  type (type_scenario_vol_ave_mask) :: vol_ave  ! /scenario/vol_ave - volume averaged value
  type (type_codeparam_mask) :: codeparam  ! /scenario/codeparam - 
  integer  :: time=0       ! /scenario/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include solcurdiag.xsd
  
type type_solcurdiag_sol_current_setup  !    diagnostic setup information
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name of the toroidally distributed tile set.  String.
  integer  :: id=-999999999       ! /id - ID of the tile set as a scalar, to be used in connectivity.  Integer.
  type (type_rz1D) :: position  ! /position - RZ points defining the shape of the toroidal tile set [m]; Vector (npoints)
  integer  :: tiles_turn=-999999999       ! /tiles_turn - Number of tiles used to get the full toroidal coverage; Scalar
endtype

  
type type_solcurdiag_sol_current  !    Vector of toroidal rings of divertor tiles.  Structure array(nrings). Time-dependent
  type (type_solcurdiag_sol_current_setup) :: setup  ! /setup - diagnostic setup information
  type (type_exp0D) :: measure  ! /measure - Measured value for the current through the toroidal ring of tiles [A]; Time-dependent; Scalar
endtype
  
type type_solcurdiag_sol_current_setup_mask  !    diagnostic setup information
  integer  :: name=0       ! /name - Name of the toroidally distributed tile set.  String.
  integer  :: id=0       ! /id - ID of the tile set as a scalar, to be used in connectivity.  Integer.
  type (type_rz1D_mask) :: position  ! /position - RZ points defining the shape of the toroidal tile set [m]; Vector (npoints)
  integer  :: tiles_turn=0       ! /tiles_turn - Number of tiles used to get the full toroidal coverage; Scalar
endtype
  
type type_solcurdiag_sol_current_mask  !    Vector of toroidal rings of divertor tiles.  Structure array(nrings). Time-dependent
  type (type_solcurdiag_sol_current_setup_mask) :: setup  ! /setup - diagnostic setup information
  type (type_exp0D_mask) :: measure  ! /measure - Measured value for the current through the toroidal ring of tiles [A]; Time-dependent; Scalar
endtype

  
type type_clusters  !    
  character(len=132), dimension(:), pointer ::name => null()       ! /solcurdiag/clusters(i)/name - Name of the toroidally distributed tile set.  String.
  integer  :: start=-999999999       ! /solcurdiag/clusters(i)/start - ID of the tile set as a scalar where this superset starts.  Integer.
  integer  :: finish=-999999999       ! /solcurdiag/clusters(i)/finish - ID of the tile set as a scalar where this superset finishes.  Integer.
endtype
  
type type_clusters_mask  !    
  integer  :: name=0       ! /solcurdiag/clusters(i)/name - Name of the toroidally distributed tile set.  String.
  integer  :: start=0       ! /solcurdiag/clusters(i)/start - ID of the tile set as a scalar where this superset starts.  Integer.
  integer  :: finish=0       ! /solcurdiag/clusters(i)/finish - ID of the tile set as a scalar where this superset finishes.  Integer.
endtype

  
type type_solcurdiag  !    
  type (type_datainfo) :: datainfo  ! /solcurdiag/datainfo - 
  type (type_solcurdiag_sol_current),pointer :: sol_current(:) => null()  ! /solcurdiag/sol_current(i) - Vector of toroidal rings of divertor tiles.  Structure array(nrings). Time-dependent
  type (type_clusters),pointer :: clusters(:) => null()  ! /solcurdiag/clusters(i) - Cluster of tile rings to define and reference superset structures using the individual tile rings. A
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /solcurdiag/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam) :: codeparam  ! /solcurdiag/codeparam - 
endtype
  
type type_solcurdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /solcurdiag/datainfo - 
  type (type_solcurdiag_sol_current_mask),pointer :: sol_current(:) => null()  ! /solcurdiag/sol_current(i) - Vector of toroidal rings of divertor tiles.  Structure array(nrings). Time-dependent
  type (type_clusters_mask),pointer :: clusters(:) => null()  ! /solcurdiag/clusters(i) - Cluster of tile rings to define and reference superset structures using the individual tile rings. A
  integer  :: time=0       ! /solcurdiag/time - Time [s]; Time-dependent; Scalar
  type (type_codeparam_mask) :: codeparam  ! /solcurdiag/codeparam - 
endtype

! ***********  Include temporary.xsd
  
type type_temporary_nt_0dr  !    a non-timed temporary quantity of real type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8)  :: value=-9.0E40_EUITM_R8       ! /value - Value. Real scalar.
endtype

  
type type_temporary_nt_0dc  !    a non-timed temporary quantity of complex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8) :: value=(-9.0D40, -9.0D40)       ! /value - Value. Complex scalar.
endtype

  
type type_temporary_nt_0di  !    a non-timed temporary quantity of integer type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer  :: value=-999999999       ! /value - Value. integer scalar
endtype

  
type type_temporary_nt_0ds  !    a non-timed temporary quantity of string type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  character(len=132), dimension(:), pointer ::value => null()       ! /value - Value. String.
endtype

  
type type_temporary_nt_1dr  !    a non-timed temporary quantity of vecflt type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value. Vector of float.
endtype

  
type type_temporary_nt_1dc  !    a non-timed temporary quantity of veccomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value. Vector of complex numbers
endtype

  
type type_temporary_nt_1ds  !    a non-timed temporary quantity of vecstring type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  character(len=132), dimension(:), pointer ::value => null()       ! /value - Value. Vector of strings.
endtype

  
type type_temporary_nt_1di  !    a non-timed temporary quantity of vecint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:) => null()      ! /value - Value. Vector of integers
endtype

  
type type_temporary_nt_2dr  !    a non-timed temporary quantity of matflt type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value. Matrix of float.
endtype

  
type type_temporary_nt_2dc  !    a non-timed temporary quantity of matcomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value. Matrix of complex numbers
endtype

  
type type_temporary_nt_2di  !    a non-timed temporary quantity of matint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:,:) => null()     ! /value - Value. Matrix of integers
endtype

  
type type_temporary_nt_3dc  !    a non-timed temporary quantity of array3dcomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:,:,:) => null()     ! /value - Value. array 3D of complex numbers
endtype

  
type type_temporary_nt_3dr  !    a non-timed temporary quantity of array3dfloat type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:,:) => null()     ! /value - Value. array 3D of floats
endtype

  
type type_temporary_nt_3di  !    a non-timed temporary quantity of array3dint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:,:,:) => null()     ! /value - Value. array 3D of integers
endtype

  
type type_temporary_nt_4dr  !    a non-timed temporary quantity of array4dfloat type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:,:,:) => null()     ! /value - Value. array 4D of floats
endtype

  
type type_temporary_nt  !    set of non-timed temporary quantities
  type (type_temporary_nt_0dr),pointer :: float0d(:) => null()  ! /float0d(i) - Constant 0D float
  type (type_temporary_nt_0di),pointer :: integer0d(:) => null()  ! /integer0d(i) - Constant 0D integer
  type (type_temporary_nt_0dc),pointer :: complex0d(:) => null()  ! /complex0d(i) - Constant 0D complex
  type (type_temporary_nt_0ds),pointer :: string0d(:) => null()  ! /string0d(i) - Constant 0D string
  type (type_temporary_nt_1dr),pointer :: float1d(:) => null()  ! /float1d(i) - Constant 1D float
  type (type_temporary_nt_1di),pointer :: integer1d(:) => null()  ! /integer1d(i) - Constant 1D integer
  type (type_temporary_nt_1dr),pointer :: string1d(:) => null()  ! /string1d(i) - Constant 1D string
  type (type_temporary_nt_1dc),pointer :: complex1d(:) => null()  ! /complex1d(i) - Constant 1D complex
  type (type_temporary_nt_2dr),pointer :: float2d(:) => null()  ! /float2d(i) - Constant 2D float
  type (type_temporary_nt_2di),pointer :: integer2d(:) => null()  ! /integer2d(i) - Constant 2D integer
  type (type_temporary_nt_2dc),pointer :: complex2d(:) => null()  ! /complex2d(i) - Constant 2D complex
  type (type_temporary_nt_3dr),pointer :: float3d(:) => null()  ! /float3d(i) - Constant 3D float
  type (type_temporary_nt_3di),pointer :: integer3d(:) => null()  ! /integer3d(i) - Constant 3D integer
  type (type_temporary_nt_3dc),pointer :: complex3d(:) => null()  ! /complex3d(i) - Constant 3D complex
  type (type_temporary_nt_4dr),pointer :: float4d(:) => null()  ! /float4d(i) - Constant 4D float
endtype

  
type type_temporary_t_0dr  !    a timed temporary quantity of real type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8)  :: value=-9.0E40_EUITM_R8       ! /value - Value. Time-dependent. Real scalar.
endtype

  
type type_temporary_t_0dc  !    a timed temporary quantity of complex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8) :: value=(-9.0D40, -9.0D40)       ! /value - Value. Time-dependent. Complex scalar.
endtype

  
type type_temporary_t_0di  !    a timed temporary quantity of integer type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer  :: value=-999999999       ! /value - Value. Time-dependent. integer scalar
endtype

  
type type_temporary_t_0ds  !    a timed temporary quantity of string type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  character(len=132), dimension(:), pointer ::value => null()       ! /value - Value. Time-dependent. String.
endtype

  
type type_temporary_t_1dr  !    a timed temporary quantity of vecflt type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value. Time-dependent. Vector of float.
endtype

  
type type_temporary_t_1dc  !    a timed temporary quantity of veccomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:) => null()     ! /value - Value. Time-dependent. Vector of complex numbers
endtype

  
type type_temporary_t_1di  !    a timed temporary quantity of vecint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:) => null()      ! /value - Value. Time-dependent. Vector of integers
endtype

  
type type_temporary_t_2dr  !    a timed temporary quantity of matflt type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value. Time-dependent. Matrix of float.
endtype

  
type type_temporary_t_2dc  !    a timed temporary quantity of matcomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:,:) => null()     ! /value - Value. Time-dependent. Matrix of complex numbers
endtype

  
type type_temporary_t_2di  !    a timed temporary quantity of matint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:,:) => null()     ! /value - Value. Time-dependent. Matrix of integers
endtype

  
type type_temporary_t_3dc  !    a timed temporary quantity of array3dcomplex type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  COMPLEX(EUITM_R8),pointer  :: value(:,:,:) => null()     ! /value - Value. Time-dependent. array 3D of complex numbers
endtype

  
type type_temporary_t_3dr  !    a timed temporary quantity of array3dfloat type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:,:) => null()     ! /value - Value. Time-dependent. array 3D of floats
endtype

  
type type_temporary_t_3di  !    a timed temporary quantity of array3dint type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  integer,pointer  :: value(:,:,:) => null()     ! /value - Value. Time-dependent. array 3D of integers
endtype

  
type type_temporary_t_4dr  !    a timed temporary quantity of array4dfloat type
  type (type_identifier) :: identifier  ! /identifier - Identifier.
  real(EUITM_R8),pointer  :: value(:,:,:,:) => null()     ! /value - Value. Time-dependent. array 4D of floats
endtype

  
type type_temporary_t  !    set of timed temporary quantities
  type (type_temporary_t_0dr),pointer :: float0d(:) => null()  ! /float0d(i) - Time-dependent 0D float
  type (type_temporary_t_0di),pointer :: integer0d(:) => null()  ! /integer0d(i) - Time-dependent 0D integer. 
  type (type_temporary_t_0dc),pointer :: complex0d(:) => null()  ! /complex0d(i) - Time-dependent 0D complex.
  type (type_temporary_t_0ds),pointer :: string0d(:) => null()  ! /string0d(i) - Time-dependent 0D string.
  type (type_temporary_t_1dr),pointer :: float1d(:) => null()  ! /float1d(i) - Time-dependent 1D float.
  type (type_temporary_t_1di),pointer :: integer1d(:) => null()  ! /integer1d(i) - Time-dependent 1D integer.
  type (type_temporary_t_1dc),pointer :: complex1d(:) => null()  ! /complex1d(i) - Time-dependent 1D complex
  type (type_temporary_t_2dr),pointer :: float2d(:) => null()  ! /float2d(i) - Time-dependent 2D float
  type (type_temporary_t_2di),pointer :: integer2d(:) => null()  ! /integer2d(i) - Time-dependent 2D integer
  type (type_temporary_t_2dc),pointer :: complex2d(:) => null()  ! /complex2d(i) - Time-dependent 2D complex
  type (type_temporary_t_3dr),pointer :: float3d(:) => null()  ! /float3d(i) - Time-dependent 3D float
  type (type_temporary_t_3di),pointer :: integer3d(:) => null()  ! /integer3d(i) - Time-dependent 3D integer
  type (type_temporary_t_3dc),pointer :: complex3d(:) => null()  ! /complex3d(i) - Time-dependent 3D complex
  type (type_temporary_t_4dr),pointer :: float4d(:) => null()  ! /float4d(i) - Time-dependent 4D float
endtype
  
type type_temporary_nt_0dr_mask  !    a non-timed temporary quantity of real type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Real scalar.
endtype
  
type type_temporary_nt_0dc_mask  !    a non-timed temporary quantity of complex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Complex scalar.
endtype
  
type type_temporary_nt_0di_mask  !    a non-timed temporary quantity of integer type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. integer scalar
endtype
  
type type_temporary_nt_0ds_mask  !    a non-timed temporary quantity of string type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. String.
endtype
  
type type_temporary_nt_1dr_mask  !    a non-timed temporary quantity of vecflt type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Vector of float.
endtype
  
type type_temporary_nt_1dc_mask  !    a non-timed temporary quantity of veccomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Vector of complex numbers
endtype
  
type type_temporary_nt_1ds_mask  !    a non-timed temporary quantity of vecstring type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Vector of strings.
endtype
  
type type_temporary_nt_1di_mask  !    a non-timed temporary quantity of vecint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Vector of integers
endtype
  
type type_temporary_nt_2dr_mask  !    a non-timed temporary quantity of matflt type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Matrix of float.
endtype
  
type type_temporary_nt_2dc_mask  !    a non-timed temporary quantity of matcomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Matrix of complex numbers
endtype
  
type type_temporary_nt_2di_mask  !    a non-timed temporary quantity of matint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Matrix of integers
endtype
  
type type_temporary_nt_3dc_mask  !    a non-timed temporary quantity of array3dcomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. array 3D of complex numbers
endtype
  
type type_temporary_nt_3dr_mask  !    a non-timed temporary quantity of array3dfloat type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. array 3D of floats
endtype
  
type type_temporary_nt_3di_mask  !    a non-timed temporary quantity of array3dint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. array 3D of integers
endtype
  
type type_temporary_nt_4dr_mask  !    a non-timed temporary quantity of array4dfloat type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. array 4D of floats
endtype
  
type type_temporary_nt_mask  !    set of non-timed temporary quantities
  type (type_temporary_nt_0dr_mask),pointer :: float0d(:) => null()  ! /float0d(i) - Constant 0D float
  type (type_temporary_nt_0di_mask),pointer :: integer0d(:) => null()  ! /integer0d(i) - Constant 0D integer
  type (type_temporary_nt_0dc_mask),pointer :: complex0d(:) => null()  ! /complex0d(i) - Constant 0D complex
  type (type_temporary_nt_0ds_mask),pointer :: string0d(:) => null()  ! /string0d(i) - Constant 0D string
  type (type_temporary_nt_1dr_mask),pointer :: float1d(:) => null()  ! /float1d(i) - Constant 1D float
  type (type_temporary_nt_1di_mask),pointer :: integer1d(:) => null()  ! /integer1d(i) - Constant 1D integer
  type (type_temporary_nt_1dr_mask),pointer :: string1d(:) => null()  ! /string1d(i) - Constant 1D string
  type (type_temporary_nt_1dc_mask),pointer :: complex1d(:) => null()  ! /complex1d(i) - Constant 1D complex
  type (type_temporary_nt_2dr_mask),pointer :: float2d(:) => null()  ! /float2d(i) - Constant 2D float
  type (type_temporary_nt_2di_mask),pointer :: integer2d(:) => null()  ! /integer2d(i) - Constant 2D integer
  type (type_temporary_nt_2dc_mask),pointer :: complex2d(:) => null()  ! /complex2d(i) - Constant 2D complex
  type (type_temporary_nt_3dr_mask),pointer :: float3d(:) => null()  ! /float3d(i) - Constant 3D float
  type (type_temporary_nt_3di_mask),pointer :: integer3d(:) => null()  ! /integer3d(i) - Constant 3D integer
  type (type_temporary_nt_3dc_mask),pointer :: complex3d(:) => null()  ! /complex3d(i) - Constant 3D complex
  type (type_temporary_nt_4dr_mask),pointer :: float4d(:) => null()  ! /float4d(i) - Constant 4D float
endtype
  
type type_temporary_t_0dr_mask  !    a timed temporary quantity of real type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Real scalar.
endtype
  
type type_temporary_t_0dc_mask  !    a timed temporary quantity of complex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Complex scalar.
endtype
  
type type_temporary_t_0di_mask  !    a timed temporary quantity of integer type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. integer scalar
endtype
  
type type_temporary_t_0ds_mask  !    a timed temporary quantity of string type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. String.
endtype
  
type type_temporary_t_1dr_mask  !    a timed temporary quantity of vecflt type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Vector of float.
endtype
  
type type_temporary_t_1dc_mask  !    a timed temporary quantity of veccomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Vector of complex numbers
endtype
  
type type_temporary_t_1di_mask  !    a timed temporary quantity of vecint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Vector of integers
endtype
  
type type_temporary_t_2dr_mask  !    a timed temporary quantity of matflt type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Matrix of float.
endtype
  
type type_temporary_t_2dc_mask  !    a timed temporary quantity of matcomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Matrix of complex numbers
endtype
  
type type_temporary_t_2di_mask  !    a timed temporary quantity of matint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. Matrix of integers
endtype
  
type type_temporary_t_3dc_mask  !    a timed temporary quantity of array3dcomplex type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. array 3D of complex numbers
endtype
  
type type_temporary_t_3dr_mask  !    a timed temporary quantity of array3dfloat type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. array 3D of floats
endtype
  
type type_temporary_t_3di_mask  !    a timed temporary quantity of array3dint type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. array 3D of integers
endtype
  
type type_temporary_t_4dr_mask  !    a timed temporary quantity of array4dfloat type
  type (type_identifier_mask) :: identifier  ! /identifier - Identifier.
  integer  :: value=0       ! /value - Value. Time-dependent. array 4D of floats
endtype
  
type type_temporary_t_mask  !    set of timed temporary quantities
  type (type_temporary_t_0dr_mask),pointer :: float0d(:) => null()  ! /float0d(i) - Time-dependent 0D float
  type (type_temporary_t_0di_mask),pointer :: integer0d(:) => null()  ! /integer0d(i) - Time-dependent 0D integer. 
  type (type_temporary_t_0dc_mask),pointer :: complex0d(:) => null()  ! /complex0d(i) - Time-dependent 0D complex.
  type (type_temporary_t_0ds_mask),pointer :: string0d(:) => null()  ! /string0d(i) - Time-dependent 0D string.
  type (type_temporary_t_1dr_mask),pointer :: float1d(:) => null()  ! /float1d(i) - Time-dependent 1D float.
  type (type_temporary_t_1di_mask),pointer :: integer1d(:) => null()  ! /integer1d(i) - Time-dependent 1D integer.
  type (type_temporary_t_1dc_mask),pointer :: complex1d(:) => null()  ! /complex1d(i) - Time-dependent 1D complex
  type (type_temporary_t_2dr_mask),pointer :: float2d(:) => null()  ! /float2d(i) - Time-dependent 2D float
  type (type_temporary_t_2di_mask),pointer :: integer2d(:) => null()  ! /integer2d(i) - Time-dependent 2D integer
  type (type_temporary_t_2dc_mask),pointer :: complex2d(:) => null()  ! /complex2d(i) - Time-dependent 2D complex
  type (type_temporary_t_3dr_mask),pointer :: float3d(:) => null()  ! /float3d(i) - Time-dependent 3D float
  type (type_temporary_t_3di_mask),pointer :: integer3d(:) => null()  ! /integer3d(i) - Time-dependent 3D integer
  type (type_temporary_t_3dc_mask),pointer :: complex3d(:) => null()  ! /complex3d(i) - Time-dependent 3D complex
  type (type_temporary_t_4dr_mask),pointer :: float4d(:) => null()  ! /float4d(i) - Time-dependent 4D float
endtype

  
type type_temporary  !    
  type (type_datainfo) :: datainfo  ! /temporary/datainfo - 
  type (type_temporary_nt) :: non_timed  ! /temporary/non_timed - Time-independent quantities (parameters)
  type (type_temporary_t) :: timed  ! /temporary/timed - Time-dependent quantities
  type (type_codeparam) :: codeparam  ! /temporary/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /temporary/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_temporary_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /temporary/datainfo - 
  type (type_temporary_nt_mask) :: non_timed  ! /temporary/non_timed - Time-independent quantities (parameters)
  type (type_temporary_t_mask) :: timed  ! /temporary/timed - Time-dependent quantities
  type (type_codeparam_mask) :: codeparam  ! /temporary/codeparam - 
  integer  :: time=0       ! /temporary/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include turbulence.xsd
  
type type_turbcomposition  !    Plasma composition (description of ion species).
  real(EUITM_R8),pointer  :: amn(:) => null()     ! /amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zn(:) => null()     ! /zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: zion(:) => null()     ! /zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  real(EUITM_R8),pointer  :: ie_mass(:) => null()     ! /ie_mass - Ion to electron mass ratio as used in the code for each species. To be used only by models which kee
endtype

  
type type_turbgrid  !    Generic structure for a turbulence grid.
  real(EUITM_R8),pointer  :: dim1(:) => null()     ! /dim1 - First dimension values; Vector (ndim1).
  real(EUITM_R8),pointer  :: dim2(:) => null()     ! /dim2 - Second dimension values; Vector (ndim2).
  real(EUITM_R8),pointer  :: dim3(:) => null()     ! /dim3 - Third dimension values; Vector (ndim3).
  real(EUITM_R8),pointer  :: dim_v1(:) => null()     ! /dim_v1 - First v-space dimension values; Vector (ndim_v1).
  real(EUITM_R8),pointer  :: dim_v2(:) => null()     ! /dim_v2 - Second v-space dimension values; Vector (ndim_v2).
endtype

  
type type_turbcoordsys  !    Decription of the coordinates and metric.
  character(len=132), dimension(:), pointer ::grid_type => null()       ! /grid_type - Type of coordinate system.
  type (type_turbgrid) :: turbgrid  ! /turbgrid - Turbulence grid used by the codes; Time-dependent.
  real(EUITM_R8),pointer  :: jacobian(:,:) => null()     ! /jacobian - Jacobian of the coordinate system; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_11(:,:) => null()     ! /g_11 - metric coefficients g_11; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_12(:,:) => null()     ! /g_12 - metric coefficients g_12; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_13(:,:) => null()     ! /g_13 - metric coefficients g_13; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_22(:,:) => null()     ! /g_22 - metric coefficients g_22; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_23(:,:) => null()     ! /g_23 - metric coefficients g_23; Time-dependent; Matrix (ndim1, ndim2).
  real(EUITM_R8),pointer  :: g_33(:,:) => null()     ! /g_33 - metric coefficients g_33; Time-dependent; Matrix (ndim1, ndim2).
  type (type_rzphi3D) :: position  ! /position - R Z phi positions of grid points; Time-dependent; Array3D (ndim1, ndim2, ndim3).
endtype

  
type type_turbvar0d  !    Time traces.
  character(len=132), dimension(:), pointer ::dtime_type => null()       ! /dtime_type - Description of time trace e.g. last ndtime points.
  real(EUITM_R8),pointer  :: dtime(:) => null()     ! /dtime - Fast diagnostic time [s]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: en_exb(:) => null()     ! /en_exb - ExB energy [J/m^3]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: en_mag(:) => null()     ! /en_mag - Magnetic energy [J/m^3]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: en_el_th(:) => null()     ! /en_el_th - electron thermal energy or free energy [J/m^3]; Time-dependent.
  real(EUITM_R8),pointer  :: en_ion_th(:,:) => null()     ! /en_ion_th - Ion thermal energy or free energy [J/m^3]; Time-dependent; Matrix (ndtime, nion).
  real(EUITM_R8),pointer  :: en_el_par(:) => null()     ! /en_el_par - Electron parallel energy [J/m^3]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: en_ion_par(:,:) => null()     ! /en_ion_par - Ion parallel energy [J/m^3]; Time-dependent; Matrix (ndtime,nion).
  real(EUITM_R8),pointer  :: en_tot(:) => null()     ! /en_tot - Total energy or free energy [J/m^3]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: fl_el(:) => null()     ! /fl_el - Electron flux [m^-2 s^-1]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: fl_heatel(:) => null()     ! /fl_heatel - Conductive electron heat flux [W.m^-2]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: fl_ion(:,:) => null()     ! /fl_ion - Ion flux [m^-2 s^-1]; Time-dependent; Matrix (ndtime, nion).
  real(EUITM_R8),pointer  :: fl_heation(:,:) => null()     ! /fl_heation - Conductive ion heat flux [W.m^-2]; Time-dependent; Matrix (ndtime, nion).
  real(EUITM_R8),pointer  :: fl_magel(:) => null()     ! /fl_magel - Electron flux [m^-2 s^-1]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: fl_magheatel(:) => null()     ! /fl_magheatel - Conductive electron heat flux [W.m^-2]; Time-dependent; Vector (ndtime).
  real(EUITM_R8),pointer  :: fl_magion(:,:) => null()     ! /fl_magion - Ion flux [m^-2 s^-1]; Time-dependent; Matrix (ndtime, nion).
  real(EUITM_R8),pointer  :: flmagheation(:,:) => null()     ! /flmagheation - Conductive ion heat flux [W.m^-2]; Time-dependent; Matrix (ndtime, nion).
endtype

  
type type_turbvar1d  !    Dependent variable zonal average radial profile.
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux  coordinate. Vector(nrho1d)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Electrostatic potential [V]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: er(:) => null()     ! /er - Radial electric field [V/m]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: vor(:) => null()     ! /vor - Vorticity [s^-1]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: apl(:) => null()     ! /apl - Parallel magnetic potential divided by B [m]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: jpl(:) => null()     ! /jpl - Parallel current divided by B [A/m^2 per T]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Electron density [m^-3]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: te(:) => null()     ! /te - Electron temperature [eV]; Time-dependent; Vector (nrho1d).
  real(EUITM_R8),pointer  :: ni(:,:) => null()     ! /ni - Ion density [m^-3]; Time-dependent; Matrix (nrho1d,nion).
  real(EUITM_R8),pointer  :: ti(:,:) => null()     ! /ti - Ion temperature [eV]; Time-dependent; Matrix (nrho1d,nion).
  real(EUITM_R8),pointer  :: ui(:,:) => null()     ! /ui - Ion parallel velocity divided by B [m/s per T]; Time-dependent; Matrix (nrho1d,nion).
endtype

  
type type_turbvar2d  !    Dependent variable axisymmetric component.
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - Normalised toroidal flux  coordinate. Vector(nrho2d)
  real(EUITM_R8),pointer  :: theta(:) => null()     ! /theta - Straight field line poloidal angle angle [rad]. Vector(ntheta2d)
  real(EUITM_R8),pointer  :: phi(:,:) => null()     ! /phi - Electrostatic potential [V]; Time-dependent; Matrix (nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: apl(:,:) => null()     ! /apl - Parallel magnetic potential divided by B [m]; Time-dependent; Matrix(nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: jpl(:,:) => null()     ! /jpl - Parallel current divided by B [A/m^2 per T]; Time-dependent; Matrix (nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: vor(:,:) => null()     ! /vor - Vorticity [s^-1]; Time-dependent; Matrix(nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: ne(:,:) => null()     ! /ne - Electron density [m^-3]; Time-dependent; Matrix (nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: te(:,:) => null()     ! /te - Electron temperature [eV]; Time-dependent; Matrix (nrho2d,ntheta2d).
  real(EUITM_R8),pointer  :: ni(:,:,:) => null()     ! /ni - Ion density [m^-3]; Time-dependent; Array3D (nrho2d,ntheta2d,nion).
  real(EUITM_R8),pointer  :: ti(:,:,:) => null()     ! /ti - Ion temperature [eV]; Time-dependent; Array3D (nrho2d,ntheta2d,nion).
  real(EUITM_R8),pointer  :: ui(:,:,:) => null()     ! /ui - Ion parallel velocity divided by B [m/s per T]; Time-dependent; Array3D(nrho2d,ntheta2d,nion).
endtype

  
type type_turbvar3d  !    Dependent variable morphology (on the internal grid code coord_sys/turbgrid).
  real(EUITM_R8),pointer  :: phi(:,:,:) => null()     ! /phi - Electrostatic potential [V]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  real(EUITM_R8),pointer  :: vor(:,:,:) => null()     ! /vor - Vorticity [s^-1]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  real(EUITM_R8),pointer  :: jpl(:,:,:) => null()     ! /jpl - Parallel current [A/m^2]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  real(EUITM_R8),pointer  :: ne(:,:,:) => null()     ! /ne - Electron density [m^-3]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
endtype

  
type type_turbvar4d  !    Gyrokinetic distribution function, axisymmetric component. Grid is defined in coord_sys/turbgrid.
  real(EUITM_R8),pointer  :: fe(:,:,:,:) => null()     ! /fe - Electron distribution function times V-space volume element, axisymmetric component [m^-3]; Time-dep
  real(EUITM_R8),pointer  :: fi(:,:,:,:,:) => null()     ! /fi - Ion distribution function times V-space volume element, axisymmetric component [m^-3]; Time-dependen
endtype

  
type type_turbvar5d  !    Gyrokinetic distribution function. Grid is defined in coord_sys/turbgrid.
  real(EUITM_R8),pointer  :: fe(:,:,:,:,:) => null()     ! /fe - Electron distribution function times V-space volume element [m^-3]; Time-dependent; Array5D(ndim1,nd
  real(EUITM_R8),pointer  :: fi(:,:,:,:,:,:) => null()     ! /fi - Ion distribution function times V-space volume element [m^-3]; Time-dependent; Array6D(ndim1,ndim2,n
endtype

  
type type_turbspec1d  !    Perpendicular wavenumber spectra.
  real(EUITM_R8),pointer  :: kperp(:) => null()     ! /kperp - Perpendicular wavenumber [m^-1]; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Electrostatic potential [V^2 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: vor(:) => null()     ! /vor - Vorticity [s^-2 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: b(:) => null()     ! /b - Magnetic energy [T^2 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: jpl(:) => null()     ! /jpl - Current [A^2/m^4 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Electron density [m^-6 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: te(:) => null()     ! /te - Electron temperature [eV^2 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: ti(:,:) => null()     ! /ti - Ion temperature [eV^2 per mode]; Time-dependent; Matrix (ndim_spec,nion).
  real(EUITM_R8),pointer  :: fe(:) => null()     ! /fe - Electron particle flux [m^-2/s per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: qe(:) => null()     ! /qe - Electron conductive heat flux [W.m^-2 per mode]; Time-dependent; Vector (ndim_spec).
  real(EUITM_R8),pointer  :: qi(:,:) => null()     ! /qi - Ion conductive heat flux [W.m^-2 per mode]; Time-dependent; Matrix(ndim_spec,nion).
  real(EUITM_R8),pointer  :: me(:) => null()     ! /me - Magnetic electron heat flux [W.m^-2 per mode]; Time-dependent; Matrix (ndim_spec).
  real(EUITM_R8),pointer  :: mi(:,:) => null()     ! /mi - Magnetic ion heat flux [W.m^-2 per mode]; Time-dependent; Matrix (ndim_spec,nion).
endtype

  
type type_turbenv1d  !    Parallel fluctuation envelope.
  real(EUITM_R8),pointer  :: theta(:) => null()     ! /theta - Straight field line poloidal angle [rad]; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Electrostatic potential [V^2]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: vor(:) => null()     ! /vor - Vorticity [coulomb^2/m^6]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: jpl(:) => null()     ! /jpl - Parallel current [A^2/m^4]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: ne(:) => null()     ! /ne - Electron density [m^-6]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: he(:) => null()     ! /he - Nonadiabatic electron density [m^-6]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: te(:) => null()     ! /te - Electron temperature [eV^2]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: ni(:,:) => null()     ! /ni - Ion density [m^-6]; Time-dependent; Matrix(ntheta_env,nion).
  real(EUITM_R8),pointer  :: ti(:,:) => null()     ! /ti - Ion temperature [eV^2]; Time-dependent; Matrix(ntheta_env,nion).
  real(EUITM_R8),pointer  :: ui(:,:) => null()     ! /ui - Ion parallel velocity [m^2/s^2]; Time-dependent; Matrix (ntheta_env,nion).
  real(EUITM_R8),pointer  :: fe(:) => null()     ! /fe - Electron particle flux [m^-2/s per mode]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: qe(:) => null()     ! /qe - Electron conductive heat flux [W.m^-2 per mode]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: qi(:,:) => null()     ! /qi - Ion conductive heat flux [W. m^-2 per mode]; Time-dependent; Matrix(ntheta_env,nion).
  real(EUITM_R8),pointer  :: me(:) => null()     ! /me - Magnetic electron heat flux [W.m^-2 per mode]; Time-dependent; Vector (ntheta_env).
  real(EUITM_R8),pointer  :: mi(:,:) => null()     ! /mi - Magnetic ion heat flux [W. m^-2 per mode]; Time-dependent; Matrix(ntheta_env,nion).
endtype
  
type type_turbcomposition_mask  !    Plasma composition (description of ion species).
  integer  :: amn=0       ! /amn - Atomic mass number (lumped ions are allowed); Vector (nion)
  integer  :: zn=0       ! /zn - Nuclear charge (lumped ions are allowed); Vector (nion)
  integer  :: zion=0       ! /zion - Ion charge (of the dominant ionisation state; lumped ions are allowed); Vector (nion)
  integer  :: ie_mass=0       ! /ie_mass - Ion to electron mass ratio as used in the code for each species. To be used only by models which kee
endtype
  
type type_turbgrid_mask  !    Generic structure for a turbulence grid.
  integer  :: dim1=0       ! /dim1 - First dimension values; Vector (ndim1).
  integer  :: dim2=0       ! /dim2 - Second dimension values; Vector (ndim2).
  integer  :: dim3=0       ! /dim3 - Third dimension values; Vector (ndim3).
  integer  :: dim_v1=0       ! /dim_v1 - First v-space dimension values; Vector (ndim_v1).
  integer  :: dim_v2=0       ! /dim_v2 - Second v-space dimension values; Vector (ndim_v2).
endtype
  
type type_turbcoordsys_mask  !    Decription of the coordinates and metric.
  integer  :: grid_type=0       ! /grid_type - Type of coordinate system.
  type (type_turbgrid_mask) :: turbgrid  ! /turbgrid - Turbulence grid used by the codes; Time-dependent.
  integer  :: jacobian=0       ! /jacobian - Jacobian of the coordinate system; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_11=0       ! /g_11 - metric coefficients g_11; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_12=0       ! /g_12 - metric coefficients g_12; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_13=0       ! /g_13 - metric coefficients g_13; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_22=0       ! /g_22 - metric coefficients g_22; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_23=0       ! /g_23 - metric coefficients g_23; Time-dependent; Matrix (ndim1, ndim2).
  integer  :: g_33=0       ! /g_33 - metric coefficients g_33; Time-dependent; Matrix (ndim1, ndim2).
  type (type_rzphi3D_mask) :: position  ! /position - R Z phi positions of grid points; Time-dependent; Array3D (ndim1, ndim2, ndim3).
endtype
  
type type_turbvar0d_mask  !    Time traces.
  integer  :: dtime_type=0       ! /dtime_type - Description of time trace e.g. last ndtime points.
  integer  :: dtime=0       ! /dtime - Fast diagnostic time [s]; Time-dependent; Vector (ndtime).
  integer  :: en_exb=0       ! /en_exb - ExB energy [J/m^3]; Time-dependent; Vector (ndtime).
  integer  :: en_mag=0       ! /en_mag - Magnetic energy [J/m^3]; Time-dependent; Vector (ndtime).
  integer  :: en_el_th=0       ! /en_el_th - electron thermal energy or free energy [J/m^3]; Time-dependent.
  integer  :: en_ion_th=0       ! /en_ion_th - Ion thermal energy or free energy [J/m^3]; Time-dependent; Matrix (ndtime, nion).
  integer  :: en_el_par=0       ! /en_el_par - Electron parallel energy [J/m^3]; Time-dependent; Vector (ndtime).
  integer  :: en_ion_par=0       ! /en_ion_par - Ion parallel energy [J/m^3]; Time-dependent; Matrix (ndtime,nion).
  integer  :: en_tot=0       ! /en_tot - Total energy or free energy [J/m^3]; Time-dependent; Vector (ndtime).
  integer  :: fl_el=0       ! /fl_el - Electron flux [m^-2 s^-1]; Time-dependent; Vector (ndtime).
  integer  :: fl_heatel=0       ! /fl_heatel - Conductive electron heat flux [W.m^-2]; Time-dependent; Vector (ndtime).
  integer  :: fl_ion=0       ! /fl_ion - Ion flux [m^-2 s^-1]; Time-dependent; Matrix (ndtime, nion).
  integer  :: fl_heation=0       ! /fl_heation - Conductive ion heat flux [W.m^-2]; Time-dependent; Matrix (ndtime, nion).
  integer  :: fl_magel=0       ! /fl_magel - Electron flux [m^-2 s^-1]; Time-dependent; Vector (ndtime).
  integer  :: fl_magheatel=0       ! /fl_magheatel - Conductive electron heat flux [W.m^-2]; Time-dependent; Vector (ndtime).
  integer  :: fl_magion=0       ! /fl_magion - Ion flux [m^-2 s^-1]; Time-dependent; Matrix (ndtime, nion).
  integer  :: flmagheation=0       ! /flmagheation - Conductive ion heat flux [W.m^-2]; Time-dependent; Matrix (ndtime, nion).
endtype
  
type type_turbvar1d_mask  !    Dependent variable zonal average radial profile.
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux  coordinate. Vector(nrho1d)
  integer  :: phi=0       ! /phi - Electrostatic potential [V]; Time-dependent; Vector (nrho1d).
  integer  :: er=0       ! /er - Radial electric field [V/m]; Time-dependent; Vector (nrho1d).
  integer  :: vor=0       ! /vor - Vorticity [s^-1]; Time-dependent; Vector (nrho1d).
  integer  :: apl=0       ! /apl - Parallel magnetic potential divided by B [m]; Time-dependent; Vector (nrho1d).
  integer  :: jpl=0       ! /jpl - Parallel current divided by B [A/m^2 per T]; Time-dependent; Vector (nrho1d).
  integer  :: ne=0       ! /ne - Electron density [m^-3]; Time-dependent; Vector (nrho1d).
  integer  :: te=0       ! /te - Electron temperature [eV]; Time-dependent; Vector (nrho1d).
  integer  :: ni=0       ! /ni - Ion density [m^-3]; Time-dependent; Matrix (nrho1d,nion).
  integer  :: ti=0       ! /ti - Ion temperature [eV]; Time-dependent; Matrix (nrho1d,nion).
  integer  :: ui=0       ! /ui - Ion parallel velocity divided by B [m/s per T]; Time-dependent; Matrix (nrho1d,nion).
endtype
  
type type_turbvar2d_mask  !    Dependent variable axisymmetric component.
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - Normalised toroidal flux  coordinate. Vector(nrho2d)
  integer  :: theta=0       ! /theta - Straight field line poloidal angle angle [rad]. Vector(ntheta2d)
  integer  :: phi=0       ! /phi - Electrostatic potential [V]; Time-dependent; Matrix (nrho2d,ntheta2d).
  integer  :: apl=0       ! /apl - Parallel magnetic potential divided by B [m]; Time-dependent; Matrix(nrho2d,ntheta2d).
  integer  :: jpl=0       ! /jpl - Parallel current divided by B [A/m^2 per T]; Time-dependent; Matrix (nrho2d,ntheta2d).
  integer  :: vor=0       ! /vor - Vorticity [s^-1]; Time-dependent; Matrix(nrho2d,ntheta2d).
  integer  :: ne=0       ! /ne - Electron density [m^-3]; Time-dependent; Matrix (nrho2d,ntheta2d).
  integer  :: te=0       ! /te - Electron temperature [eV]; Time-dependent; Matrix (nrho2d,ntheta2d).
  integer  :: ni=0       ! /ni - Ion density [m^-3]; Time-dependent; Array3D (nrho2d,ntheta2d,nion).
  integer  :: ti=0       ! /ti - Ion temperature [eV]; Time-dependent; Array3D (nrho2d,ntheta2d,nion).
  integer  :: ui=0       ! /ui - Ion parallel velocity divided by B [m/s per T]; Time-dependent; Array3D(nrho2d,ntheta2d,nion).
endtype
  
type type_turbvar3d_mask  !    Dependent variable morphology (on the internal grid code coord_sys/turbgrid).
  integer  :: phi=0       ! /phi - Electrostatic potential [V]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  integer  :: vor=0       ! /vor - Vorticity [s^-1]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  integer  :: jpl=0       ! /jpl - Parallel current [A/m^2]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
  integer  :: ne=0       ! /ne - Electron density [m^-3]; Time-dependent; Array3D(ndim1,ndim2,ndim3).
endtype
  
type type_turbvar4d_mask  !    Gyrokinetic distribution function, axisymmetric component. Grid is defined in coord_sys/turbgrid.
  integer  :: fe=0       ! /fe - Electron distribution function times V-space volume element, axisymmetric component [m^-3]; Time-dep
  integer  :: fi=0       ! /fi - Ion distribution function times V-space volume element, axisymmetric component [m^-3]; Time-dependen
endtype
  
type type_turbvar5d_mask  !    Gyrokinetic distribution function. Grid is defined in coord_sys/turbgrid.
  integer  :: fe=0       ! /fe - Electron distribution function times V-space volume element [m^-3]; Time-dependent; Array5D(ndim1,nd
  integer  :: fi=0       ! /fi - Ion distribution function times V-space volume element [m^-3]; Time-dependent; Array6D(ndim1,ndim2,n
endtype
  
type type_turbspec1d_mask  !    Perpendicular wavenumber spectra.
  integer  :: kperp=0       ! /kperp - Perpendicular wavenumber [m^-1]; Vector (ndim_spec).
  integer  :: phi=0       ! /phi - Electrostatic potential [V^2 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: vor=0       ! /vor - Vorticity [s^-2 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: b=0       ! /b - Magnetic energy [T^2 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: jpl=0       ! /jpl - Current [A^2/m^4 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: ne=0       ! /ne - Electron density [m^-6 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: te=0       ! /te - Electron temperature [eV^2 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: ti=0       ! /ti - Ion temperature [eV^2 per mode]; Time-dependent; Matrix (ndim_spec,nion).
  integer  :: fe=0       ! /fe - Electron particle flux [m^-2/s per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: qe=0       ! /qe - Electron conductive heat flux [W.m^-2 per mode]; Time-dependent; Vector (ndim_spec).
  integer  :: qi=0       ! /qi - Ion conductive heat flux [W.m^-2 per mode]; Time-dependent; Matrix(ndim_spec,nion).
  integer  :: me=0       ! /me - Magnetic electron heat flux [W.m^-2 per mode]; Time-dependent; Matrix (ndim_spec).
  integer  :: mi=0       ! /mi - Magnetic ion heat flux [W.m^-2 per mode]; Time-dependent; Matrix (ndim_spec,nion).
endtype
  
type type_turbenv1d_mask  !    Parallel fluctuation envelope.
  integer  :: theta=0       ! /theta - Straight field line poloidal angle [rad]; Vector (ntheta_env).
  integer  :: phi=0       ! /phi - Electrostatic potential [V^2]; Time-dependent; Vector (ntheta_env).
  integer  :: vor=0       ! /vor - Vorticity [coulomb^2/m^6]; Time-dependent; Vector (ntheta_env).
  integer  :: jpl=0       ! /jpl - Parallel current [A^2/m^4]; Time-dependent; Vector (ntheta_env).
  integer  :: ne=0       ! /ne - Electron density [m^-6]; Time-dependent; Vector (ntheta_env).
  integer  :: he=0       ! /he - Nonadiabatic electron density [m^-6]; Time-dependent; Vector (ntheta_env).
  integer  :: te=0       ! /te - Electron temperature [eV^2]; Time-dependent; Vector (ntheta_env).
  integer  :: ni=0       ! /ni - Ion density [m^-6]; Time-dependent; Matrix(ntheta_env,nion).
  integer  :: ti=0       ! /ti - Ion temperature [eV^2]; Time-dependent; Matrix(ntheta_env,nion).
  integer  :: ui=0       ! /ui - Ion parallel velocity [m^2/s^2]; Time-dependent; Matrix (ntheta_env,nion).
  integer  :: fe=0       ! /fe - Electron particle flux [m^-2/s per mode]; Time-dependent; Vector (ntheta_env).
  integer  :: qe=0       ! /qe - Electron conductive heat flux [W.m^-2 per mode]; Time-dependent; Vector (ntheta_env).
  integer  :: qi=0       ! /qi - Ion conductive heat flux [W. m^-2 per mode]; Time-dependent; Matrix(ntheta_env,nion).
  integer  :: me=0       ! /me - Magnetic electron heat flux [W.m^-2 per mode]; Time-dependent; Vector (ntheta_env).
  integer  :: mi=0       ! /mi - Magnetic ion heat flux [W. m^-2 per mode]; Time-dependent; Matrix(ntheta_env,nion).
endtype

  
type type_turbulence  !    
  type (type_datainfo) :: datainfo  ! /turbulence/datainfo - 
  type (type_turbcomposition) :: composition  ! /turbulence/composition - Plasma composition (description of ion species).
  type (type_turbcoordsys) :: coordsys  ! /turbulence/coordsys - Decription of the coordinates and metric used by the codes.
  type (type_turbvar0d) :: var0d  ! /turbulence/var0d - Diagnostic fast time traces.
  type (type_turbvar1d) :: var1d  ! /turbulence/var1d - Dependent variable radial profile.
  type (type_turbvar2d) :: var2d  ! /turbulence/var2d - Dependent variable axisymmetric.
  type (type_turbvar3d) :: var3d  ! /turbulence/var3d - Dependent variable morphology. Grid is defined in coord_sys/turbgrid.
  type (type_turbvar4d) :: var4d  ! /turbulence/var4d - Gyrokinetic distribution function, axisymmetric component. Grid is defined in coord_sys/turbgrid.
  type (type_turbvar5d) :: var5d  ! /turbulence/var5d - Gyrokinetic distribution function. Grid is defined in coord_sys/turbgrid.
  type (type_turbspec1d) :: spec1d  ! /turbulence/spec1d - Toroidal mode number spectra.
  type (type_turbenv1d) :: env1d  ! /turbulence/env1d - Parallel fluctuation envelope.
  type (type_codeparam) :: codeparam  ! /turbulence/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /turbulence/time - Time [s]; Time-dependent; Scalar.
endtype
  
type type_turbulence_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /turbulence/datainfo - 
  type (type_turbcomposition_mask) :: composition  ! /turbulence/composition - Plasma composition (description of ion species).
  type (type_turbcoordsys_mask) :: coordsys  ! /turbulence/coordsys - Decription of the coordinates and metric used by the codes.
  type (type_turbvar0d_mask) :: var0d  ! /turbulence/var0d - Diagnostic fast time traces.
  type (type_turbvar1d_mask) :: var1d  ! /turbulence/var1d - Dependent variable radial profile.
  type (type_turbvar2d_mask) :: var2d  ! /turbulence/var2d - Dependent variable axisymmetric.
  type (type_turbvar3d_mask) :: var3d  ! /turbulence/var3d - Dependent variable morphology. Grid is defined in coord_sys/turbgrid.
  type (type_turbvar4d_mask) :: var4d  ! /turbulence/var4d - Gyrokinetic distribution function, axisymmetric component. Grid is defined in coord_sys/turbgrid.
  type (type_turbvar5d_mask) :: var5d  ! /turbulence/var5d - Gyrokinetic distribution function. Grid is defined in coord_sys/turbgrid.
  type (type_turbspec1d_mask) :: spec1d  ! /turbulence/spec1d - Toroidal mode number spectra.
  type (type_turbenv1d_mask) :: env1d  ! /turbulence/env1d - Parallel fluctuation envelope.
  type (type_codeparam_mask) :: codeparam  ! /turbulence/codeparam - 
  integer  :: time=0       ! /turbulence/time - Time [s]; Time-dependent; Scalar.
endtype

! ***********  Include tsdiag.xsd
  
type type_tssetup  !    diagnostic setup information
  type (type_rzphi1D) :: position  ! /position - Position of intersection between laser and line of sight; Vector (nchords)
endtype

  
type type_tsmeasure  !    Measured values (Thomson scattering)
  type (type_exp1D) :: te  ! /te - Electron temperature [eV]. Vector (nchords)
  type (type_exp1D) :: ne  ! /ne - Electron density [m^-3]. Vector (nchords)
endtype
  
type type_tssetup_mask  !    diagnostic setup information
  type (type_rzphi1D_mask) :: position  ! /position - Position of intersection between laser and line of sight; Vector (nchords)
endtype
  
type type_tsmeasure_mask  !    Measured values (Thomson scattering)
  type (type_exp1D_mask) :: te  ! /te - Electron temperature [eV]. Vector (nchords)
  type (type_exp1D_mask) :: ne  ! /ne - Electron density [m^-3]. Vector (nchords)
endtype

  
type type_tsdiag  !    
  type (type_datainfo) :: datainfo  ! /tsdiag/datainfo - 
  type (type_tssetup) :: setup  ! /tsdiag/setup - diagnostic setup information
  type (type_tsmeasure) :: measure  ! /tsdiag/measure - Measured values
  type (type_codeparam) :: codeparam  ! /tsdiag/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /tsdiag/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_tsdiag_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /tsdiag/datainfo - 
  type (type_tssetup_mask) :: setup  ! /tsdiag/setup - diagnostic setup information
  type (type_tsmeasure_mask) :: measure  ! /tsdiag/measure - Measured values
  type (type_codeparam_mask) :: codeparam  ! /tsdiag/codeparam - 
  integer  :: time=0       ! /tsdiag/time - Time [s]; Time-dependent; Scalar
endtype

! ***********  Include toroidalfield.xsd
  
type type_circularcoil  !    
  type (type_rz0D) :: centre  ! /circularcoil/centre - Circular coil centre
  real(EUITM_R8)  :: hlength=-9.0E40_EUITM_R8       ! /circularcoil/hlength - Half length along coil axis [m]
  real(EUITM_R8)  :: radialhwidth=-9.0E40_EUITM_R8       ! /circularcoil/radialhwidth - Half width, (outer radius-inner radius)/2 [m]
endtype

  
type type_planecoil  !    
  type (type_rz1D) :: coordinates  ! /planecoil/coordinates - Coordinate points of centre of conductor; vectors(nelements)
  real(EUITM_R8),pointer  :: hlength(:) => null()     ! /planecoil/hlength - Half length perpendicular to plane where coil is defined; vector(nelements) [m].
  real(EUITM_R8),pointer  :: radialhwidth(:) => null()     ! /planecoil/radialhwidth - Half width, (outer contour-inner contour)/2; vector(nelements) [m].
endtype
  
type type_circularcoil_mask  !    
  type (type_rz0D_mask) :: centre  ! /circularcoil/centre - Circular coil centre
  integer  :: hlength=0       ! /circularcoil/hlength - Half length along coil axis [m]
  integer  :: radialhwidth=0       ! /circularcoil/radialhwidth - Half width, (outer radius-inner radius)/2 [m]
endtype
  
type type_planecoil_mask  !    
  type (type_rz1D_mask) :: coordinates  ! /planecoil/coordinates - Coordinate points of centre of conductor; vectors(nelements)
  integer  :: hlength=0       ! /planecoil/hlength - Half length perpendicular to plane where coil is defined; vector(nelements) [m].
  integer  :: radialhwidth=0       ! /planecoil/radialhwidth - Half width, (outer contour-inner contour)/2; vector(nelements) [m].
endtype

  
type type_tf_structure  !    Inner TF coil structure
  real(EUITM_R8)  :: jcable=-9.0E40_EUITM_R8       ! /jcable - CICS cable in current density [A/m²]; Scalar
  real(EUITM_R8)  :: tisotf=-9.0E40_EUITM_R8       ! /tisotf - Insulation thickness of TF conductor [m]; Scalar
  real(EUITM_R8)  :: efcasing=-9.0E40_EUITM_R8       ! /efcasing - Thickness front casing [m]; Scalar
  real(EUITM_R8)  :: escasing=-9.0E40_EUITM_R8       ! /escasing - Thickness side casing [m]; Scalar
  real(EUITM_R8)  :: sigjackettf=-9.0E40_EUITM_R8       ! /sigjackettf - Jacket stress limit [Pa]; Scalar
  real(EUITM_R8)  :: sigvaulttf=-9.0E40_EUITM_R8       ! /sigvaulttf - Vault stress limit  [Pa]; Scalar
  real(EUITM_R8)  :: ktf=-9.0E40_EUITM_R8       ! /ktf - Amplification factor for magnetic field
  real(EUITM_R8)  :: ritf=-9.0E40_EUITM_R8       ! /ritf - Internal TF coil radius [m]; Scalar
  real(EUITM_R8)  :: riitf=-9.0E40_EUITM_R8       ! /riitf - Internal vault TF coil radius [m]; Scalar
  real(EUITM_R8)  :: retf=-9.0E40_EUITM_R8       ! /retf - External TF coil radius [m]; Scalar
  real(EUITM_R8)  :: he_fraction=-9.0E40_EUITM_R8       ! /he_fraction - Helium fraction (percentage) in TF structure infront of winding package  [-]; Scalar
  real(EUITM_R8)  :: ss_fraction=-9.0E40_EUITM_R8       ! /ss_fraction - Stainless steel 316 fraction (percentage) in TF structure infront of winding package  [-]; Scalar
  real(EUITM_R8)  :: pow_dens_wp=-9.0E40_EUITM_R8       ! /pow_dens_wp - Peak energy depostion in winding pack [W.m^-3]; Scalar
endtype

  
type type_tf_desc_tfcoils_board  !    Description of TF inboard/outboard properties
  type (type_tf_structure) :: structure  ! /structure - TF coil structure
endtype

  
type type_tf_desc_tfcoils  !    Description of the toroidal field coils
  integer  :: type=-999999999       ! /type - Type of coil, 0=circular coil, 1=plane coil with arbitrary shape.
  real(EUITM_R8)  :: phi=-9.0E40_EUITM_R8       ! /phi - Toroidal angle of centre of coil 1, assuming all coils are identical and evenly distributed around t
  type (type_circularcoil) :: circularcoil  ! /circularcoil - Circular coil description
  type (type_planecoil) :: planecoil  ! /planecoil - Plane coil description
  type (type_tf_structure) :: inboard  ! /inboard - Description of TF inboard structure
  type (type_tf_structure) :: outboard  ! /outboard - Description of TF outboard structure
endtype
  
type type_tf_structure_mask  !    Inner TF coil structure
  integer  :: jcable=0       ! /jcable - CICS cable in current density [A/m²]; Scalar
  integer  :: tisotf=0       ! /tisotf - Insulation thickness of TF conductor [m]; Scalar
  integer  :: efcasing=0       ! /efcasing - Thickness front casing [m]; Scalar
  integer  :: escasing=0       ! /escasing - Thickness side casing [m]; Scalar
  integer  :: sigjackettf=0       ! /sigjackettf - Jacket stress limit [Pa]; Scalar
  integer  :: sigvaulttf=0       ! /sigvaulttf - Vault stress limit  [Pa]; Scalar
  integer  :: ktf=0       ! /ktf - Amplification factor for magnetic field
  integer  :: ritf=0       ! /ritf - Internal TF coil radius [m]; Scalar
  integer  :: riitf=0       ! /riitf - Internal vault TF coil radius [m]; Scalar
  integer  :: retf=0       ! /retf - External TF coil radius [m]; Scalar
  integer  :: he_fraction=0       ! /he_fraction - Helium fraction (percentage) in TF structure infront of winding package  [-]; Scalar
  integer  :: ss_fraction=0       ! /ss_fraction - Stainless steel 316 fraction (percentage) in TF structure infront of winding package  [-]; Scalar
  integer  :: pow_dens_wp=0       ! /pow_dens_wp - Peak energy depostion in winding pack [W.m^-3]; Scalar
endtype
  
type type_tf_desc_tfcoils_board_mask  !    Description of TF inboard/outboard properties
  type (type_tf_structure_mask) :: structure  ! /structure - TF coil structure
endtype
  
type type_tf_desc_tfcoils_mask  !    Description of the toroidal field coils
  integer  :: type=0       ! /type - Type of coil, 0=circular coil, 1=plane coil with arbitrary shape.
  integer  :: phi=0       ! /phi - Toroidal angle of centre of coil 1, assuming all coils are identical and evenly distributed around t
  type (type_circularcoil_mask) :: circularcoil  ! /circularcoil - Circular coil description
  type (type_planecoil_mask) :: planecoil  ! /planecoil - Plane coil description
  type (type_tf_structure_mask) :: inboard  ! /inboard - Description of TF inboard structure
  type (type_tf_structure_mask) :: outboard  ! /outboard - Description of TF outboard structure
endtype

  
type type_toroidfield  !    
  type (type_datainfo) :: datainfo  ! /toroidfield/datainfo - 
  type (type_tf_desc_tfcoils) :: desc_tfcoils  ! /toroidfield/desc_tfcoils - Description of the toroidal field coils
  integer  :: nturns=-999999999       ! /toroidfield/nturns - Number of total turns in the toroidal field coil
  integer  :: ncoils=-999999999       ! /toroidfield/ncoils - Number of packets of coils
  type (type_exp0D) :: current  ! /toroidfield/current - Current in the toroidal field coils [A]; Time-dependent. Scalar.
  type (type_exp0D) :: bvac_r  ! /toroidfield/bvac_r - Vacuum field times radius in the toroidal field magnet [T.m]. Positive sign means anti-clockwise whe
  real(EUITM_R8)  :: r0=-9.0E40_EUITM_R8       ! /toroidfield/r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  real(EUITM_R8)  :: p_cryo=-9.0E40_EUITM_R8       ! /toroidfield/p_cryo - Total electric power consumed by the cryoplant system [W]; Time-dependent. Scalar.
  real(EUITM_R8)  :: wp_nh_max=-9.0E40_EUITM_R8       ! /toroidfield/wp_nh_max - Peak nuclear heating in winding pack [W*m^-3]. Time-dependent. Scalar
  real(EUITM_R8)  :: tfc_nh=-9.0E40_EUITM_R8       ! /toroidfield/tfc_nh - Nuclear heating on the toroidal field coils [W]; Time-dependent. Scalar
  real(EUITM_R8)  :: neut_flux_inb=-9.0E40_EUITM_R8       ! /toroidfield/neut_flux_inb - Neutron flux arriving at the inboard surface of the coil (on the plasma side) [neutron.s^-1.m^-2]; T
  real(EUITM_R8)  :: neut_flux_outb=-9.0E40_EUITM_R8       ! /toroidfield/neut_flux_outb - Neutron flux arriving at the ouboard surface of the coil (on the plasma side) [neutron.s^-1.m^-2]; T
  type (type_codeparam) :: codeparam  ! /toroidfield/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /toroidfield/time - Time [s]; Time-dependent. Scalar.
endtype
  
type type_toroidfield_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /toroidfield/datainfo - 
  type (type_tf_desc_tfcoils_mask) :: desc_tfcoils  ! /toroidfield/desc_tfcoils - Description of the toroidal field coils
  integer  :: nturns=0       ! /toroidfield/nturns - Number of total turns in the toroidal field coil
  integer  :: ncoils=0       ! /toroidfield/ncoils - Number of packets of coils
  type (type_exp0D_mask) :: current  ! /toroidfield/current - Current in the toroidal field coils [A]; Time-dependent. Scalar.
  type (type_exp0D_mask) :: bvac_r  ! /toroidfield/bvac_r - Vacuum field times radius in the toroidal field magnet [T.m]. Positive sign means anti-clockwise whe
  integer  :: r0=0       ! /toroidfield/r0 - Characteristic major radius of the device (used in publications, usually middle of the vessel at the
  integer  :: p_cryo=0       ! /toroidfield/p_cryo - Total electric power consumed by the cryoplant system [W]; Time-dependent. Scalar.
  integer  :: wp_nh_max=0       ! /toroidfield/wp_nh_max - Peak nuclear heating in winding pack [W*m^-3]. Time-dependent. Scalar
  integer  :: tfc_nh=0       ! /toroidfield/tfc_nh - Nuclear heating on the toroidal field coils [W]; Time-dependent. Scalar
  integer  :: neut_flux_inb=0       ! /toroidfield/neut_flux_inb - Neutron flux arriving at the inboard surface of the coil (on the plasma side) [neutron.s^-1.m^-2]; T
  integer  :: neut_flux_outb=0       ! /toroidfield/neut_flux_outb - Neutron flux arriving at the ouboard surface of the coil (on the plasma side) [neutron.s^-1.m^-2]; T
  type (type_codeparam_mask) :: codeparam  ! /toroidfield/codeparam - 
  integer  :: time=0       ! /toroidfield/time - Time [s]; Time-dependent. Scalar.
endtype

! ***********  Include wall.xsd
  
type type_coordinates  !    
  real(EUITM_R8),pointer  :: theta(:) => null()     ! /holes/coordinates/theta - Theta coordinate of holes center; Vector (n_holes)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /holes/coordinates/phi - Toroidal coordinate of holes center; Vector (n_holes)
endtype

  
type type_width  !    
  real(EUITM_R8),pointer  :: dtheta(:) => null()     ! /holes/width/dtheta - Angular poloidal width of holes; Vector (n_holes)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /holes/width/phi - Angular toroidal width of holes; Vector (n_holes)
endtype
  
type type_coordinates_mask  !    
  integer  :: theta=0       ! /holes/coordinates/theta - Theta coordinate of holes center; Vector (n_holes)
  integer  :: phi=0       ! /holes/coordinates/phi - Toroidal coordinate of holes center; Vector (n_holes)
endtype
  
type type_width_mask  !    
  integer  :: dtheta=0       ! /holes/width/dtheta - Angular poloidal width of holes; Vector (n_holes)
  integer  :: phi=0       ! /holes/width/phi - Angular toroidal width of holes; Vector (n_holes)
endtype

  
type type_trap_type  !    
  type (type_identifier) :: trap_id  ! /trap_type(i)/trap_id - Identifier for the trap type
  integer  :: compound=-999999999       ! /trap_type(i)/compound - Index of the compound doing the trapping. Refers to (local) ../compounds.
  integer  :: gas_species=-999999999       ! /trap_type(i)/gas_species - Index of the gas species being trapped. Refers to (local) ../gases.
  real(EUITM_R8)  :: energy=-9.0E40_EUITM_R8       ! /trap_type(i)/energy - Energy depth of the trap [eV]
  real(EUITM_R8),pointer  :: fill_factor(:,:) => null()     ! /trap_type(i)/fill_factor - Discretized filling fraction of traps in this layer (0...1) [-]. Dimensions: 1. index: cell index of
  real(EUITM_R8),pointer  :: density(:,:) => null()     ! /trap_type(i)/density - Discretized density of traps in this layer [1/m^3]. Dimensions: 1. index: cell index of depth discre
endtype

  
type type_holes  !    
  integer  :: n_holes=-999999999       ! /holes/n_holes - Number of holes on each wall;
  type (type_coordinates) :: coordinates  ! /holes/coordinates - Poloidal and Toroidal coordinates of the center of each hole;
  type (type_width) :: width  ! /holes/width - Angular width of each in the poloidal and toroidal direction;
  real(EUITM_R8),pointer  :: eta(:) => null()     ! /holes/eta - Resistivity  of each hole [ohm.m]; Vector (n_holes)
endtype
  
type type_trap_type_mask  !    
  type (type_identifier_mask) :: trap_id  ! /trap_type(i)/trap_id - Identifier for the trap type
  integer  :: compound=0       ! /trap_type(i)/compound - Index of the compound doing the trapping. Refers to (local) ../compounds.
  integer  :: gas_species=0       ! /trap_type(i)/gas_species - Index of the gas species being trapped. Refers to (local) ../gases.
  integer  :: energy=0       ! /trap_type(i)/energy - Energy depth of the trap [eV]
  integer  :: fill_factor=0       ! /trap_type(i)/fill_factor - Discretized filling fraction of traps in this layer (0...1) [-]. Dimensions: 1. index: cell index of
  integer  :: density=0       ! /trap_type(i)/density - Discretized density of traps in this layer [1/m^3]. Dimensions: 1. index: cell index of depth discre
endtype
  
type type_holes_mask  !    
  integer  :: n_holes=0       ! /holes/n_holes - Number of holes on each wall;
  type (type_coordinates_mask) :: coordinates  ! /holes/coordinates - Poloidal and Toroidal coordinates of the center of each hole;
  type (type_width_mask) :: width  ! /holes/width - Angular width of each in the poloidal and toroidal direction;
  integer  :: eta=0       ! /holes/eta - Resistivity  of each hole [ohm.m]; Vector (n_holes)
endtype

  
type type_wall_wall0d_plasma  !    
  integer,pointer  :: species_index(:,:) => null()     ! /species_index - Index of species into wall/compositions;  matrix(nspecies,3); 1st element indicates {1: main ions; 2
  real(EUITM_R8),pointer  :: flux(:) => null()     ! /flux - flux of species indicated by species_index; array of nspecies; positive implies incoming onto wall; 
  real(EUITM_R8),pointer  :: energy(:) => null()     ! /energy - energy flux of species indicated by species_index; array of nspecies; positive implies incoming onto
endtype

  
type type_wall_wall0d  !    Simple 0D description of plasma-wall interaction
  real(EUITM_R8),pointer  :: pumping_speed(:) => null()     ! /pumping_speed - pumping speed; Time-dependent. vector(nneut); [particles/s]
  real(EUITM_R8),pointer  :: gas_puff(:) => null()     ! /gas_puff - gas puff; vector(nneut); Time-dependent.  [particles/s]
  real(EUITM_R8),pointer  :: wall_inventory(:) => null()     ! /wall_inventory - wall inventory; vector(nneut); Time-dependent. [particles]
  real(EUITM_R8),pointer  :: recycling_coefficient(:) => null()     ! /recycling_coefficient - Recycling coefficient. Vector(nneut) Time-dependent.
  real(EUITM_R8)  :: wall_temperature=-9.0E40_EUITM_R8       ! /wall_temperature - Wall temperature [K]. Time-dependent. Scalar
  real(EUITM_R8)  :: power_from_plasma=-9.0E40_EUITM_R8       ! /power_from_plasma - Power flowing from the plasma to the wall [W]. Time-dependent. Scalar
  real(EUITM_R8)  :: power_to_cooling=-9.0E40_EUITM_R8       ! /power_to_cooling - Power to cooling systems [W]. Time-dependent. Scalar
  type (type_wall_wall0d_plasma) :: plasma  ! /plasma - 
endtype

  
type type_wall_unitsComplexType_layers  !    Data on wall element layers; Array of structures (number of engineering layers + number of deposited layers); Layers can possibly 
  integer,pointer  :: elements(:) => null()      ! /elements - List of elements present in the solid phase in this layer. Vector (number of elements). Holds indice
  integer,pointer  :: gases(:) => null()      ! /gases - List of gases present in this layer. Vector (number of gases). Holds indices pointing to wall/elemen
  integer,pointer  :: compounds(:) => null()      ! /compounds - List of compounds present in the solid phase in this layer. Vector (number of compounds). Holds indi
  real(EUITM_R8),pointer  :: density(:,:) => null()     ! /density - Discretized density distribution in the layer of the discrete wall elements in the subgrid [kg/m^3];
  real(EUITM_R8),pointer  :: dx(:,:) => null()     ! /dx - Size of the vertical cells in the layer of the discrete wall elements in the subgrid [kg/m^3]; Time-
  real(EUITM_R8),pointer  :: thickness(:) => null()     ! /thickness - Total size of the layer [m] (i.e. sum of dx over the number of vertical cells in the layer); Time-de
  real(EUITM_R8),pointer  :: roughness(:,:,:) => null()     ! /roughness - Interface roughness description between the discrete elements and their top neighbour (i.e. towards 
  real(EUITM_R8),pointer  :: porosity(:,:,:) => null()     ! /porosity - Discrete description of porosity of the layer. Time-dependent; Float 3d array (number of vertical ce
  real(EUITM_R8),pointer  :: dpa(:,:) => null()     ! /dpa - Discretized number of displacements per atom in the layer of the discrete wall elements in the subgr
  real(EUITM_R8),pointer  :: temperature(:,:) => null()     ! /temperature - Discretized temperature distribution in the layer of the discrete wall elements in the subgrid [eV];
  real(EUITM_R8),pointer  :: element_frac(:,:,:) => null()     ! /element_frac - Fractional abundance of elements in the layer of the discrete wall elements in the subgrid [-]; Time
  real(EUITM_R8),pointer  :: chem_comp(:,:,:) => null()     ! /chem_comp - Fractional abundance of chemical compounds in the layer of the discrete wall elements in the subgrid
  real(EUITM_R8),pointer  :: bulk_D(:,:,:,:) => null()     ! /bulk_D - Diffusivity of gas species in bulks of different compounds [m^2/s]; Time-dependent; 4d float array. 
  real(EUITM_R8),pointer  :: surface_D(:,:,:,:) => null()     ! /surface_D - Diffusivity of hydrogen species of surface of different compounds [m^2/s]; Time-dependent; Dimension
  real(EUITM_R8),pointer  :: bulk_solute(:,:,:,:) => null()     ! /bulk_solute - Bulk mobile (solute) concentration [atoms/m^3]; Time-dependent; Dimensions: see bulk_D
  real(EUITM_R8),pointer  :: surf_solute(:,:,:,:) => null()     ! /surf_solute - Surface mobile (solute) concentration [atoms/m^2]; Time-dependent; Dimensions: see bulk_D
  real(EUITM_R8),pointer  :: pore_content(:,:,:) => null()     ! /pore_content - Amount of gas species trapped in pores per cubic meter [1/m^3]; Time-dependent; 3d float array. Dime
  type (type_trap_type),pointer :: trap_type(:) => null()  ! /trap_type(i) - Definition of trap types. Array of structures (number of trap types)
endtype

  
type type_wall_unitsComplexType  !    Data for individual wall elements; Time-dependent
  integer  :: wall_type=-999999999       ! /wall_type - Definition of reference wall composition for every subgrid of the wall discretization. Vector of int
  integer  :: n_depo_layer=-999999999       ! /n_depo_layer - Number of deposited layers (in addition to the engineering layers)
  type (type_wall_unitsComplexType_layers),pointer :: layers(:) => null()  ! /layers(i) - Data on wall element layers; Array of structures (number of engineering layers + number of deposited
  type (type_complexgrid_scalar) :: eta  ! /eta - Resitivity of wall element described by grid geometry [Ohm.m]
  type (type_complexgrid_scalar) :: permeability  ! /permeability - Relative permeability of wall element described by grid geometry [-]
  type (type_complexgrid_vector) :: j  ! /j - Current density vector in the element specified by the grid representation. [A/m^2]
endtype

  
type type_plasmaComplexType  !    Description of incoming plasma
  integer,pointer  :: species(:) => null()      ! /species - Definition of plasma species. Index into wall/compositions/edgespecies. Integer vector (number of pl
  real(EUITM_R8),pointer  :: flux(:,:) => null()     ! /flux - Plasma particle flux density from/to plasma facing wall surfaces [1/(m^2 s)]. Positive means incomin
  real(EUITM_R8),pointer  :: b(:,:) => null()     ! /b - Magnetic field vector at the surface [T]; Time-dependent; Float matrix (number of space dimensions, 
  real(EUITM_R8),pointer  :: energy(:,:) => null()     ! /energy - Total energy flux density of incoming particles of given species [W/m^2]; Positive means incoming on
endtype

  
type type_wall_wall2d_vessel_radial_build  !    Simple description of this vessel unit for the radial_build in system codes
  real(EUITM_R8)  :: r1_inb=-9.0E40_EUITM_R8       ! /r1_inb - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the vv measured at 
  real(EUITM_R8)  :: r2_inb=-9.0E40_EUITM_R8       ! /r2_inb - Outer radius (farest from the plasma), in the global tokamak coordinate system of the vv measured at
  real(EUITM_R8)  :: r1_outb=-9.0E40_EUITM_R8       ! /r1_outb - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the vv measured at 
  real(EUITM_R8)  :: r2_outb=-9.0E40_EUITM_R8       ! /r2_outb - Outer radius (farest from the plasma), in the global tokamak coordinate system of the vv measured at
  real(EUITM_R8)  :: raddim=-9.0E40_EUITM_R8       ! /raddim - Radial thickness of the vacuum vessel; Scalar
  real(EUITM_R8)  :: nmat=-9.0E40_EUITM_R8       ! /nmat - Number of materials; Scalar
  real(EUITM_R8),pointer  :: composition(:) => null()     ! /composition - Inboard shield radial build giving the percentage of each material respectively (Meaning of the mate
  real(EUITM_R8)  :: pow_dens_inb=-9.0E40_EUITM_R8       ! /pow_dens_inb - Peak energy depostion in vaccum vessel inboard [W.m^-3]; Scalar
  real(EUITM_R8)  :: pow_dens_outb=-9.0E40_EUITM_R8       ! /pow_dens_outb - Peak energy depostion in vaccum vessel outboard [W.m^-3]; Scalar
  real(EUITM_R8)  :: fn_flux_inb=-9.0E40_EUITM_R8       ! /fn_flux_inb - Fast neutron flux in vaccum vessel inboard [m^2.s^-1]; Scalar
  real(EUITM_R8)  :: fn_flux_outb=-9.0E40_EUITM_R8       ! /fn_flux_outb - Fast neutron flux in vaccum vessel outboard [m^2.s^-1]; Scalar
endtype

  
type type_wall_blocks_unit  !    Vector of blocks that build of the vessel layer. Replicate this element nblocks times. Each unit contains a building block of the 
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name or description of the blocks_unit
  type (type_rz1D) :: position  ! /position - Position (R,Z coordinates) of a vessel segment. No need to repeat first point for closed contours [m
  real(EUITM_R8)  :: eta=-9.0E40_EUITM_R8       ! /eta - Resistivity of the vessel segment [ohm.m]; Scalar
  real(EUITM_R8)  :: permeability=-9.0E40_EUITM_R8       ! /permeability - Vessel relative permeability; Scalar
  real(EUITM_R8)  :: j_phi=-9.0E40_EUITM_R8       ! /j_phi - induced currents inside the vessel; time dependent; [A]

  real(EUITM_R8)  :: resistance=-9.0E40_EUITM_R8       ! /resistance - resistance of block; [Ohm]
endtype

  
type type_wall_blocks  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  type (type_wall_blocks_unit),pointer :: blocks_unit(:) => null()  ! /blocks_unit(i) - Vector of blocks that build of the vessel layer. Replicate this element nblocks times. Each unit con
endtype

  
type type_wall_vessel_annular  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Name or description of the vessel_unit
  type (type_rz1D) :: inside  ! /inside - Inner Vessel wall outline (list of R,Z co-ordinates) [m]; Vector (npoints_inner)
  type (type_rz1D) :: outside  ! /outside - Outer Vessel wall outline (list of R,Z co-ordinates) [m]; Vector (npoints_outer)
  real(EUITM_R8)  :: eta=-9.0E40_EUITM_R8       ! /eta - Vessel resistivity [ohm.m]; Scalar
  real(EUITM_R8)  :: permeability=-9.0E40_EUITM_R8       ! /permeability - Vessel relative permeability; Scalar
endtype

  
type type_wall_vessel_unit  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  type (type_wall_vessel_annular) :: annular  ! /annular - Annular representation of a vessel layer by two free-hand contours.
  type (type_wall_blocks) :: blocks  ! /blocks - Block element representation of vessel units. Each vessel unit is decomposed in elementary small uni
  type (type_wall_wall2d_vessel_radial_build) :: radial_build  ! /radial_build - Simple description of this vessel unit for the radial_build in system codes
endtype

  
type type_wall_vessel  !    Mechanical structure of the vacuum vessel. Vessel assumed as set of nested layers with given physics properties; Two representatio
  type (type_identifier) :: vessel_id  ! /vessel_id - Use this identifier to tag the type of vessel you are using. Use flag=0 for the official single/mult
  type (type_wall_vessel_unit),pointer :: vessel_unit(:) => null()  ! /vessel_unit(i) - Array of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contai
endtype

  
type type_wall_limiter  !    Description of the immobile limiting surface(s) or plasma facing components for defining the Last Closed Flux Surface. Two represe
  type (type_identifier) :: limiter_id  ! /limiter_id - Use this identifier to tag the type of limiter you are using. Use flag=0 for the official single con
  type (type_limiter_unit),pointer :: limiter_unit(:) => null()  ! /limiter_unit(i) - Array of ncomponents limiting surfaces making up the limiter type (single contour or disjoint PFC). 
endtype

  
type type_element_desc  !    Element description (equivalent to wall/compositions/nuclei, can link there using nucindex).
  integer  :: nucindex=-999999999       ! /nucindex - Index into list of nuclei in wall/compositions/nuclei if the element is present there. Otherwise it 
  character(len=132), dimension(:), pointer ::label => null()       ! /label - Element name/label
  real(EUITM_R8)  :: zn=-9.0E40_EUITM_R8       ! /zn - Nuclear charge [units of elementary charge];
  real(EUITM_R8)  :: amn=-9.0E40_EUITM_R8       ! /amn - Mass of atom [amu]
endtype

  
type type_mhd_ideal_wall2d  !    Ideal wall
  type (type_identifier) :: walltype  ! /walltype - Tag the type of wall to be used, 0 (conformal) or 1 (free)
  type (type_rz1D) :: position  ! /position - RZ description of the wall;
endtype

  
type type_mhd_res_wall2d  !    Resistive wall
  type (type_identifier) :: walltype  ! /walltype - Tag the type of wall to be used, 0 (conformal) or 1 (free)
  real(EUITM_R8)  :: delta=-9.0E40_EUITM_R8       ! /delta - Wall thickness [m]; Scalar
  real(EUITM_R8)  :: eta=-9.0E40_EUITM_R8       ! /eta - Wall resistivity [ohm.m]; Scalar
  integer  :: npoloidal=-999999999       ! /npoloidal - Number of poloidal coordinates for each wall (dimension of R and Z);
  type (type_rz1D) :: position  ! /position - RZ description of the wall; wall coordinates are defined at a middle line (line passing through the 
  type (type_holes) :: holes  ! /holes - Structure to describe the placing and properties of the holes
endtype

  
type type_compound_desc  !    
  character(len=132), dimension(:), pointer ::label => null()       ! /label - Compound name/label
  real(EUITM_R8),pointer  :: stochiometry(:) => null()     ! /stochiometry - Fractional composition of the compound. Float vector, dimensions: 1. element number (numbering as in
  real(EUITM_R8)  :: density=-9.0E40_EUITM_R8       ! /density - Compound density (molecules/m^3)
  real(EUITM_R8)  :: heat_cap=-9.0E40_EUITM_R8       ! /heat_cap - Specific heat capacity [J/(eV kg)]
  real(EUITM_R8),pointer  :: heat_cond(:) => null()     ! /heat_cond - Thermal conductivity [W/(m eV)]
  real(EUITM_R8),pointer  :: surf_recrate(:,:) => null()     ! /surf_recrate - Recombination rate on surface (only for pure elements, not compounds) [molecules*m^2/s]; Dimensions:
endtype

  
type type_wall_types_layers  !    Engineering layers composing the wall element; array of structures (number of engineering layers). First layer is facing the plasm
  real(EUITM_R8)  :: thickness=-9.0E40_EUITM_R8       ! /thickness - Thickness of layer [m]
  real(EUITM_R8),pointer  :: chem_comp(:) => null()     ! /chem_comp - Chemical composition of the layer in terms of the chemical compounds defined in wall/design_comp/com
endtype
  
type type_wall_wall0d_plasma_mask  !    
  integer  :: species_index=0       ! /species_index - Index of species into wall/compositions;  matrix(nspecies,3); 1st element indicates {1: main ions; 2
  integer  :: flux=0       ! /flux - flux of species indicated by species_index; array of nspecies; positive implies incoming onto wall; 
  integer  :: energy=0       ! /energy - energy flux of species indicated by species_index; array of nspecies; positive implies incoming onto
endtype
  
type type_wall_wall0d_mask  !    Simple 0D description of plasma-wall interaction
  integer  :: pumping_speed=0       ! /pumping_speed - pumping speed; Time-dependent. vector(nneut); [particles/s]
  integer  :: gas_puff=0       ! /gas_puff - gas puff; vector(nneut); Time-dependent.  [particles/s]
  integer  :: wall_inventory=0       ! /wall_inventory - wall inventory; vector(nneut); Time-dependent. [particles]
  integer  :: recycling_coefficient=0       ! /recycling_coefficient - Recycling coefficient. Vector(nneut) Time-dependent.
  integer  :: wall_temperature=0       ! /wall_temperature - Wall temperature [K]. Time-dependent. Scalar
  integer  :: power_from_plasma=0       ! /power_from_plasma - Power flowing from the plasma to the wall [W]. Time-dependent. Scalar
  integer  :: power_to_cooling=0       ! /power_to_cooling - Power to cooling systems [W]. Time-dependent. Scalar
  type (type_wall_wall0d_plasma_mask) :: plasma  ! /plasma - 
endtype
  
type type_wall_unitsComplexType_layers_mask  !    Data on wall element layers; Array of structures (number of engineering layers + number of deposited layers); Layers can possibly 
  integer  :: elements=0       ! /elements - List of elements present in the solid phase in this layer. Vector (number of elements). Holds indice
  integer  :: gases=0       ! /gases - List of gases present in this layer. Vector (number of gases). Holds indices pointing to wall/elemen
  integer  :: compounds=0       ! /compounds - List of compounds present in the solid phase in this layer. Vector (number of compounds). Holds indi
  integer  :: density=0       ! /density - Discretized density distribution in the layer of the discrete wall elements in the subgrid [kg/m^3];
  integer  :: dx=0       ! /dx - Size of the vertical cells in the layer of the discrete wall elements in the subgrid [kg/m^3]; Time-
  integer  :: thickness=0       ! /thickness - Total size of the layer [m] (i.e. sum of dx over the number of vertical cells in the layer); Time-de
  integer  :: roughness=0       ! /roughness - Interface roughness description between the discrete elements and their top neighbour (i.e. towards 
  integer  :: porosity=0       ! /porosity - Discrete description of porosity of the layer. Time-dependent; Float 3d array (number of vertical ce
  integer  :: dpa=0       ! /dpa - Discretized number of displacements per atom in the layer of the discrete wall elements in the subgr
  integer  :: temperature=0       ! /temperature - Discretized temperature distribution in the layer of the discrete wall elements in the subgrid [eV];
  integer  :: element_frac=0       ! /element_frac - Fractional abundance of elements in the layer of the discrete wall elements in the subgrid [-]; Time
  integer  :: chem_comp=0       ! /chem_comp - Fractional abundance of chemical compounds in the layer of the discrete wall elements in the subgrid
  integer  :: bulk_D=0       ! /bulk_D - Diffusivity of gas species in bulks of different compounds [m^2/s]; Time-dependent; 4d float array. 
  integer  :: surface_D=0       ! /surface_D - Diffusivity of hydrogen species of surface of different compounds [m^2/s]; Time-dependent; Dimension
  integer  :: bulk_solute=0       ! /bulk_solute - Bulk mobile (solute) concentration [atoms/m^3]; Time-dependent; Dimensions: see bulk_D
  integer  :: surf_solute=0       ! /surf_solute - Surface mobile (solute) concentration [atoms/m^2]; Time-dependent; Dimensions: see bulk_D
  integer  :: pore_content=0       ! /pore_content - Amount of gas species trapped in pores per cubic meter [1/m^3]; Time-dependent; 3d float array. Dime
  type (type_trap_type_mask),pointer :: trap_type(:) => null()  ! /trap_type(i) - Definition of trap types. Array of structures (number of trap types)
endtype
  
type type_wall_unitsComplexType_mask  !    Data for individual wall elements; Time-dependent
  integer  :: wall_type=0       ! /wall_type - Definition of reference wall composition for every subgrid of the wall discretization. Vector of int
  integer  :: n_depo_layer=0       ! /n_depo_layer - Number of deposited layers (in addition to the engineering layers)
  type (type_wall_unitsComplexType_layers_mask),pointer :: layers(:) => null()  ! /layers(i) - Data on wall element layers; Array of structures (number of engineering layers + number of deposited
  type (type_complexgrid_scalar_mask) :: eta  ! /eta - Resitivity of wall element described by grid geometry [Ohm.m]
  type (type_complexgrid_scalar_mask) :: permeability  ! /permeability - Relative permeability of wall element described by grid geometry [-]
  type (type_complexgrid_vector_mask) :: j  ! /j - Current density vector in the element specified by the grid representation. [A/m^2]
endtype
  
type type_plasmaComplexType_mask  !    Description of incoming plasma
  integer  :: species=0       ! /species - Definition of plasma species. Index into wall/compositions/edgespecies. Integer vector (number of pl
  integer  :: flux=0       ! /flux - Plasma particle flux density from/to plasma facing wall surfaces [1/(m^2 s)]. Positive means incomin
  integer  :: b=0       ! /b - Magnetic field vector at the surface [T]; Time-dependent; Float matrix (number of space dimensions, 
  integer  :: energy=0       ! /energy - Total energy flux density of incoming particles of given species [W/m^2]; Positive means incoming on
endtype
  
type type_wall_wall2d_vessel_radial_build_mask  !    Simple description of this vessel unit for the radial_build in system codes
  integer  :: r1_inb=0       ! /r1_inb - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the vv measured at 
  integer  :: r2_inb=0       ! /r2_inb - Outer radius (farest from the plasma), in the global tokamak coordinate system of the vv measured at
  integer  :: r1_outb=0       ! /r1_outb - Inner radius (nearest to the plasma), in the global tokamak coordinate system of the vv measured at 
  integer  :: r2_outb=0       ! /r2_outb - Outer radius (farest from the plasma), in the global tokamak coordinate system of the vv measured at
  integer  :: raddim=0       ! /raddim - Radial thickness of the vacuum vessel; Scalar
  integer  :: nmat=0       ! /nmat - Number of materials; Scalar
  integer  :: composition=0       ! /composition - Inboard shield radial build giving the percentage of each material respectively (Meaning of the mate
  integer  :: pow_dens_inb=0       ! /pow_dens_inb - Peak energy depostion in vaccum vessel inboard [W.m^-3]; Scalar
  integer  :: pow_dens_outb=0       ! /pow_dens_outb - Peak energy depostion in vaccum vessel outboard [W.m^-3]; Scalar
  integer  :: fn_flux_inb=0       ! /fn_flux_inb - Fast neutron flux in vaccum vessel inboard [m^2.s^-1]; Scalar
  integer  :: fn_flux_outb=0       ! /fn_flux_outb - Fast neutron flux in vaccum vessel outboard [m^2.s^-1]; Scalar
endtype
  
type type_wall_blocks_unit_mask  !    Vector of blocks that build of the vessel layer. Replicate this element nblocks times. Each unit contains a building block of the 
  integer  :: name=0       ! /name - Name or description of the blocks_unit
  type (type_rz1D_mask) :: position  ! /position - Position (R,Z coordinates) of a vessel segment. No need to repeat first point for closed contours [m
  integer  :: eta=0       ! /eta - Resistivity of the vessel segment [ohm.m]; Scalar
  integer  :: permeability=0       ! /permeability - Vessel relative permeability; Scalar
  integer  :: j_phi=0       ! /j_phi - induced currents inside the vessel; time dependent; [A]

  integer  :: resistance=0       ! /resistance - resistance of block; [Ohm]
endtype
  
type type_wall_blocks_mask  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  type (type_wall_blocks_unit_mask),pointer :: blocks_unit(:) => null()  ! /blocks_unit(i) - Vector of blocks that build of the vessel layer. Replicate this element nblocks times. Each unit con
endtype
  
type type_wall_vessel_annular_mask  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  integer  :: name=0       ! /name - Name or description of the vessel_unit
  type (type_rz1D_mask) :: inside  ! /inside - Inner Vessel wall outline (list of R,Z co-ordinates) [m]; Vector (npoints_inner)
  type (type_rz1D_mask) :: outside  ! /outside - Outer Vessel wall outline (list of R,Z co-ordinates) [m]; Vector (npoints_outer)
  integer  :: eta=0       ! /eta - Vessel resistivity [ohm.m]; Scalar
  integer  :: permeability=0       ! /permeability - Vessel relative permeability; Scalar
endtype
  
type type_wall_vessel_unit_mask  !    Vector of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contains a mechanical structure of 
  type (type_wall_vessel_annular_mask) :: annular  ! /annular - Annular representation of a vessel layer by two free-hand contours.
  type (type_wall_blocks_mask) :: blocks  ! /blocks - Block element representation of vessel units. Each vessel unit is decomposed in elementary small uni
  type (type_wall_wall2d_vessel_radial_build_mask) :: radial_build  ! /radial_build - Simple description of this vessel unit for the radial_build in system codes
endtype
  
type type_wall_vessel_mask  !    Mechanical structure of the vacuum vessel. Vessel assumed as set of nested layers with given physics properties; Two representatio
  type (type_identifier_mask) :: vessel_id  ! /vessel_id - Use this identifier to tag the type of vessel you are using. Use flag=0 for the official single/mult
  type (type_wall_vessel_unit_mask),pointer :: vessel_unit(:) => null()  ! /vessel_unit(i) - Array of vacuum vessel units. Replicate this vessel_unit element ncomponents times. Each unit contai
endtype
  
type type_wall_limiter_mask  !    Description of the immobile limiting surface(s) or plasma facing components for defining the Last Closed Flux Surface. Two represe
  type (type_identifier_mask) :: limiter_id  ! /limiter_id - Use this identifier to tag the type of limiter you are using. Use flag=0 for the official single con
  type (type_limiter_unit_mask),pointer :: limiter_unit(:) => null()  ! /limiter_unit(i) - Array of ncomponents limiting surfaces making up the limiter type (single contour or disjoint PFC). 
endtype
  
type type_element_desc_mask  !    Element description (equivalent to wall/compositions/nuclei, can link there using nucindex).
  integer  :: nucindex=0       ! /nucindex - Index into list of nuclei in wall/compositions/nuclei if the element is present there. Otherwise it 
  integer  :: label=0       ! /label - Element name/label
  integer  :: zn=0       ! /zn - Nuclear charge [units of elementary charge];
  integer  :: amn=0       ! /amn - Mass of atom [amu]
endtype
  
type type_mhd_ideal_wall2d_mask  !    Ideal wall
  type (type_identifier_mask) :: walltype  ! /walltype - Tag the type of wall to be used, 0 (conformal) or 1 (free)
  type (type_rz1D_mask) :: position  ! /position - RZ description of the wall;
endtype
  
type type_mhd_res_wall2d_mask  !    Resistive wall
  type (type_identifier_mask) :: walltype  ! /walltype - Tag the type of wall to be used, 0 (conformal) or 1 (free)
  integer  :: delta=0       ! /delta - Wall thickness [m]; Scalar
  integer  :: eta=0       ! /eta - Wall resistivity [ohm.m]; Scalar
  integer  :: npoloidal=0       ! /npoloidal - Number of poloidal coordinates for each wall (dimension of R and Z);
  type (type_rz1D_mask) :: position  ! /position - RZ description of the wall; wall coordinates are defined at a middle line (line passing through the 
  type (type_holes_mask) :: holes  ! /holes - Structure to describe the placing and properties of the holes
endtype
  
type type_compound_desc_mask  !    
  integer  :: label=0       ! /label - Compound name/label
  integer  :: stochiometry=0       ! /stochiometry - Fractional composition of the compound. Float vector, dimensions: 1. element number (numbering as in
  integer  :: density=0       ! /density - Compound density (molecules/m^3)
  integer  :: heat_cap=0       ! /heat_cap - Specific heat capacity [J/(eV kg)]
  integer  :: heat_cond=0       ! /heat_cond - Thermal conductivity [W/(m eV)]
  integer  :: surf_recrate=0       ! /surf_recrate - Recombination rate on surface (only for pure elements, not compounds) [molecules*m^2/s]; Dimensions:
endtype
  
type type_wall_types_layers_mask  !    Engineering layers composing the wall element; array of structures (number of engineering layers). First layer is facing the plasm
  integer  :: thickness=0       ! /thickness - Thickness of layer [m]
  integer  :: chem_comp=0       ! /chem_comp - Chemical composition of the layer in terms of the chemical compounds defined in wall/design_comp/com
endtype

  
type type_wall2d_mhd  !    
  type (type_mhd_res_wall2d),pointer :: res_wall(:) => null()  ! /wall/wall2d_mhd/res_wall(i) - Resistive Wall(s).
  type (type_mhd_ideal_wall2d) :: ideal_wall  ! /wall/wall2d_mhd/ideal_wall - Ideal wall
endtype

  
type type_wall2d  !    A 2D wall type; Structure array. Replicate this element for each type of possible physics configurations necessary (gas tight vs w
  type (type_identifier) :: wall_id  ! /wall/wall2d(i)/wall_id - Use this identifier to tag the type of 2d wall you are using. Use 0 for equilibrium codes (single cl
  type (type_wall_limiter) :: limiter  ! /wall/wall2d(i)/limiter - Description of the immobile limiting surface(s) or plasma facing components for defining the Last Cl
  type (type_wall_vessel) :: vessel  ! /wall/wall2d(i)/vessel - Mechanical structure of the vacuum vessel. Vessel assumed as set of nested layers with given physics
  type (type_plasmaComplexType),pointer :: plasma(:) => null()  ! /wall/wall2d(i)/plasma(i) - Description of incoming plasma for every wall component. Array of structures (number of wall compone
  type (type_wall_unitsComplexType),pointer :: wall_state(:) => null()  ! /wall/wall2d(i)/wall_state(i) - Dynamic wall state of every wall component. Array of structures (number of wall components). The geo
endtype

  
type type_wall3d  !    
  type (type_identifier) :: wall_id  ! /wall/wall3d(i)/wall_id - Identify the type of wall - 0 for gas tight and 1 for a wall with holes/open ports
  type (type_complexgrid) :: grid  ! /wall/wall3d(i)/grid - Grid description
  type (type_plasmaComplexType),pointer :: plasma(:) => null()  ! /wall/wall3d(i)/plasma(i) - Description of incoming plasma for every wall component. Array of structures (number of wall compone
  type (type_wall_unitsComplexType),pointer :: wall_state(:) => null()  ! /wall/wall3d(i)/wall_state(i) - Dynamic wall state of every wall component. Array of structures (number of wall components). The geo
  integer  :: basis_index=-999999999       ! /wall/wall3d(i)/basis_index - Index of basis vectors in wall/wall3d/grid/basis used to define vector quantities e.g. in plasma.
endtype

  
type type_wall_types  !    Reference wall type
  character(len=132), dimension(:), pointer ::label => null()       ! /wall/wall_types(i)/label - Label for this reference wall type
  type (type_wall_types_layers),pointer :: layers(:) => null()  ! /wall/wall_types(i)/layers(i) - Engineering layers composing the wall element; array of structures (number of engineering layers). F
endtype
  
type type_wall2d_mhd_mask  !    
  type (type_mhd_res_wall2d_mask),pointer :: res_wall(:) => null()  ! /wall/wall2d_mhd/res_wall(i) - Resistive Wall(s).
  type (type_mhd_ideal_wall2d_mask) :: ideal_wall  ! /wall/wall2d_mhd/ideal_wall - Ideal wall
endtype
  
type type_wall2d_mask  !    A 2D wall type; Structure array. Replicate this element for each type of possible physics configurations necessary (gas tight vs w
  type (type_identifier_mask) :: wall_id  ! /wall/wall2d(i)/wall_id - Use this identifier to tag the type of 2d wall you are using. Use 0 for equilibrium codes (single cl
  type (type_wall_limiter_mask) :: limiter  ! /wall/wall2d(i)/limiter - Description of the immobile limiting surface(s) or plasma facing components for defining the Last Cl
  type (type_wall_vessel_mask) :: vessel  ! /wall/wall2d(i)/vessel - Mechanical structure of the vacuum vessel. Vessel assumed as set of nested layers with given physics
  type (type_plasmaComplexType_mask),pointer :: plasma(:) => null()  ! /wall/wall2d(i)/plasma(i) - Description of incoming plasma for every wall component. Array of structures (number of wall compone
  type (type_wall_unitsComplexType_mask),pointer :: wall_state(:) => null()  ! /wall/wall2d(i)/wall_state(i) - Dynamic wall state of every wall component. Array of structures (number of wall components). The geo
endtype
  
type type_wall3d_mask  !    
  type (type_identifier_mask) :: wall_id  ! /wall/wall3d(i)/wall_id - Identify the type of wall - 0 for gas tight and 1 for a wall with holes/open ports
  type (type_complexgrid_mask) :: grid  ! /wall/wall3d(i)/grid - Grid description
  type (type_plasmaComplexType_mask),pointer :: plasma(:) => null()  ! /wall/wall3d(i)/plasma(i) - Description of incoming plasma for every wall component. Array of structures (number of wall compone
  type (type_wall_unitsComplexType_mask),pointer :: wall_state(:) => null()  ! /wall/wall3d(i)/wall_state(i) - Dynamic wall state of every wall component. Array of structures (number of wall components). The geo
  integer  :: basis_index=0       ! /wall/wall3d(i)/basis_index - Index of basis vectors in wall/wall3d/grid/basis used to define vector quantities e.g. in plasma.
endtype
  
type type_wall_types_mask  !    Reference wall type
  integer  :: label=0       ! /wall/wall_types(i)/label - Label for this reference wall type
  type (type_wall_types_layers_mask),pointer :: layers(:) => null()  ! /wall/wall_types(i)/layers(i) - Engineering layers composing the wall element; array of structures (number of engineering layers). F
endtype

  
type type_wall  !    
  type (type_datainfo) :: datainfo  ! /wall/datainfo - 
  type (type_wall_wall0d) :: wall0d  ! /wall/wall0d - Simple 0D description of plasma-wall interaction
  type (type_wall2d_mhd) :: wall2d_mhd  ! /wall/wall2d_mhd - Simplified wall that encloses necessary information for RWM codes.
  type (type_wall2d),pointer :: wall2d(:) => null()  ! /wall/wall2d(i) - 2D wall descriptions; Array of structures (number of wall descriptions). Replicate this element for 
  type (type_wall3d),pointer :: wall3d(:) => null()  ! /wall/wall3d(i) - 3D wall descriptions; Array of structures (number of wall descriptions). Replicate this element for 
  type (type_wall_types),pointer :: wall_types(:) => null()  ! /wall/wall_types(i) - List of reference wall types (e.g. bulk tungsten, tungsten-coated CFC, ...) ; Array of structures (n
  type (type_compound_desc),pointer :: compounds(:) => null()  ! /wall/compounds(i) - Chemical compounds (e.g. solid tungsten, WC, CFC, ...) possibly present in the wall. Array of struct
  type (type_element_desc),pointer :: elements(:) => null()  ! /wall/elements(i) - Chemical elements present in the wall units, including elements from the plasma (gas + impurities). 
  type (type_compositions_type) :: compositions  ! /wall/compositions - 
  type (type_codeparam) :: codeparam  ! /wall/codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /wall/time - Time [s]; Time-dependent; Scalar.
endtype
  
type type_wall_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /wall/datainfo - 
  type (type_wall_wall0d_mask) :: wall0d  ! /wall/wall0d - Simple 0D description of plasma-wall interaction
  type (type_wall2d_mhd_mask) :: wall2d_mhd  ! /wall/wall2d_mhd - Simplified wall that encloses necessary information for RWM codes.
  type (type_wall2d_mask),pointer :: wall2d(:) => null()  ! /wall/wall2d(i) - 2D wall descriptions; Array of structures (number of wall descriptions). Replicate this element for 
  type (type_wall3d_mask),pointer :: wall3d(:) => null()  ! /wall/wall3d(i) - 3D wall descriptions; Array of structures (number of wall descriptions). Replicate this element for 
  type (type_wall_types_mask),pointer :: wall_types(:) => null()  ! /wall/wall_types(i) - List of reference wall types (e.g. bulk tungsten, tungsten-coated CFC, ...) ; Array of structures (n
  type (type_compound_desc_mask),pointer :: compounds(:) => null()  ! /wall/compounds(i) - Chemical compounds (e.g. solid tungsten, WC, CFC, ...) possibly present in the wall. Array of struct
  type (type_element_desc_mask),pointer :: elements(:) => null()  ! /wall/elements(i) - Chemical elements present in the wall units, including elements from the plasma (gas + impurities). 
  type (type_compositions_type_mask) :: compositions  ! /wall/compositions - 
  type (type_codeparam_mask) :: codeparam  ! /wall/codeparam - 
  integer  :: time=0       ! /wall/time - Time [s]; Time-dependent; Scalar.
endtype

! ***********  Include waves.xsd
  
type type_theta_info  !    
  integer  :: angl_type=-999999999       ! /theta_info/angl_type - Type of poloidal angle: 1 : same as the poloidal angle in the equlibrium cpo; 2 : geometrical polar 
  real(EUITM_R8),pointer  :: th2th_pol(:,:) => null()     ! /theta_info/th2th_pol - Geometrical poloidal angle at grid points in theta, i.e. the transformation from theta to the polar 
endtype
  
type type_theta_info_mask  !    
  integer  :: angl_type=0       ! /theta_info/angl_type - Type of poloidal angle: 1 : same as the poloidal angle in the equlibrium cpo; 2 : geometrical polar 
  integer  :: th2th_pol=0       ! /theta_info/th2th_pol - Geometrical poloidal angle at grid points in theta, i.e. the transformation from theta to the polar 
endtype

  
type type_waves_global_param  !    Global wave deposition parameters
  character(len=132), dimension(:), pointer ::name => null()       ! /name - Antenna name, String
  character(len=132), dimension(:), pointer ::type => null()       ! /type - Wave type (LH, EC, IC, ...), String
  integer,pointer  :: f_assumption(:) => null()      ! /f_assumption - Assumption on the functions distribution used by the wave solver to calculate the power deposition :
  integer  :: code_type=-999999999       ! /code_type - Type of wave deposition code for a given frequency: 1=beam/ray tracing; 2=full wave; Integer
  real(EUITM_R8)  :: frequency=-9.0E40_EUITM_R8       ! /frequency - Wave frequency [Hz]; Time-dependent, floating
  integer,pointer  :: ntor(:) => null()      ! /ntor - Toroidal mode numbers; Time-dependent; Vector (ntor)
  real(EUITM_R8)  :: power_tot=-9.0E40_EUITM_R8       ! /power_tot - Total absorbed wave power [W]; Time-dependent
  real(EUITM_R8),pointer  :: p_frac_ntor(:) => null()     ! /p_frac_ntor - Fraction of wave power per toroidal mode number; Time-dependent; Vector (ntor)
  real(EUITM_R8)  :: pow_e=-9.0E40_EUITM_R8       ! /pow_e - Wave power absorbed by the thermal electrons [W]; Time-dependent; Float
  real(EUITM_R8),pointer  :: pow_i(:) => null()     ! /pow_i - Wave power absorbed by the thermal ion species [W]; Time-dependent; Vector (nion)
  real(EUITM_R8),pointer  :: pow_z(:,:) => null()     ! /pow_z - Wave power absorbed by the thermal impurity species [W]; Time-dependent; Vector (nimpur, nzimp)
  real(EUITM_R8)  :: pow_fe=-9.0E40_EUITM_R8       ! /pow_fe - Wave power absorbed by the fast electrons [W]; Time-dependent; Float
  real(EUITM_R8),pointer  :: pow_fi(:) => null()     ! /pow_fi - Wave power absorbed by the fast ion species [W]; Time-dependent; Vector (nion)
  real(EUITM_R8),pointer  :: pow_fz(:,:) => null()     ! /pow_fz - Wave power absorbed by the fast impurity species [W]; Time-dependent; Vector (nimpur, nzimp)
  real(EUITM_R8),pointer  :: pow_ntor_e(:) => null()     ! /pow_ntor_e - Wave power absorbed by the thermal electrons for each toroidal mode [W]; Time-dependent; Vector (nto
  real(EUITM_R8),pointer  :: pow_ntor_i(:,:) => null()     ! /pow_ntor_i - Wave power absorbed by an the thermal ion species for each toroidal mode [W]; Time-dependent; Matrix
  real(EUITM_R8),pointer  :: pow_ntor_z(:,:,:) => null()     ! /pow_ntor_z - Wave power absorbed by an the thermal impurity species for each toroidal mode [W]; Time-dependent; M
  real(EUITM_R8),pointer  :: pow_ntor_fe(:) => null()     ! /pow_ntor_fe - Wave power absorbed by the fast electrons for each toroidal mode [W]; Time-dependent; Vector (ntor)
  real(EUITM_R8),pointer  :: pow_ntor_fi(:,:) => null()     ! /pow_ntor_fi - Wave power absorbed by an the fast ion species for each toroidal mode [W]; Time-dependent; Matrix (n
  real(EUITM_R8),pointer  :: pow_ntor_fz(:,:,:) => null()     ! /pow_ntor_fz - Wave power absorbed by an the fast impurity species for each toroidal mode [W]; Time-dependent; Matr
  real(EUITM_R8)  :: cur_tor=-9.0E40_EUITM_R8       ! /cur_tor - Wave driven toroidal current from a stand alone calculation (not consistent with other sources) [A];
  real(EUITM_R8),pointer  :: cur_tor_ntor(:) => null()     ! /cur_tor_ntor - Wave driven toroidal current for each toroidal mode number from a stand alone calculation (not consi
  type (type_rz0D) :: mag_axis  ! /mag_axis - Position of the magnetic axis. Time-dependent; Scalar
  type (type_b0r0) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field (used to define the rho_tor coordinate and the normalis
endtype

  
type type_waves_grid_1d  !    Grid points for profiles
  real(EUITM_R8),pointer  :: rho_tor(:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  real(EUITM_R8),pointer  :: rho_tor_norm(:) => null()     ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal flux function [Wb], evaluated without 1/2pi, such that Bp=|grad psi| /R/2/pi. Time-dependen
  real(EUITM_R8),pointer  :: volume(:) => null()     ! /volume - Volume enclosed by the flux surface [m^3]. Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: area(:) => null()     ! /area - Cross-sectional area of the flux surface [m^2]. Time-dependent; Vector (npsi)
endtype

  
type type_waves_grid_2d  !    Grid points for 2D profiles
  integer  :: grid_type=-999999999       ! /grid_type - Grid type. 1: rectangular grid in (R,Z). 2: rectangular grid in (psi, theta). 3: unstructured grid. 
  real(EUITM_R8),pointer  :: rho_tor_norm(:,:) => null()     ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  real(EUITM_R8),pointer  :: rho_tor(:,:) => null()     ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  real(EUITM_R8),pointer  :: psi(:,:) => null()     ! /psi - Grid points in poloidal flux function [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-
  real(EUITM_R8),pointer  :: theta(:,:) => null()     ! /theta - Poloidal angle at the grid points (see theta_info for detailed definition); Time-dependent; Matrix (
  real(EUITM_R8),pointer  :: r(:,:) => null()     ! /r - R (major radius) of grid points; Time-dependent; Matrix(ndim1, ndim2)
  real(EUITM_R8),pointer  :: z(:,:) => null()     ! /z - Z (altitude) of grid points; Time-dependent; Matrix (ndim1, ndim2)
  type (type_theta_info) :: theta_info  ! /theta_info - Information on the poloidal angle theta.
endtype

  
type type_waves_profiles_1d  !    waves 1D radial profiles
  real(EUITM_R8),pointer  :: powd_tot(:) => null()     ! /powd_tot - Total flux surface averaged wave power density [W/m^3]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: powd_e(:) => null()     ! /powd_e - Flux surface averaged absorbed wave power density on the thermal electrons [W/m^3]; Time-dependent; 
  real(EUITM_R8),pointer  :: powd_i(:,:) => null()     ! /powd_i - Flux surface averaged absorbed wave power density on the thermal ion species [W/m^3]; Time-dependent
  real(EUITM_R8),pointer  :: powd_z(:,:,:) => null()     ! /powd_z - Flux surface averaged absorbed wave power density on the thermal impurities species [W/m^3]; Time-de
  real(EUITM_R8),pointer  :: powd_fe(:) => null()     ! /powd_fe - Flux surface averaged absorbed wave power density on the fast electrons [W/m^3]; Time-dependent; Vec
  real(EUITM_R8),pointer  :: powd_fi(:,:) => null()     ! /powd_fi - Flux surface averaged absorbed wave power density on the fast ion species [W/m^3]; Time-dependent; M
  real(EUITM_R8),pointer  :: powd_fz(:,:,:) => null()     ! /powd_fz - Flux surface averaged absorbed wave power density on the fast impurities species [W/m^3]; Time-depen
  real(EUITM_R8),pointer  :: powd_ntor(:,:) => null()     ! /powd_ntor - Flux surface averaged power density for each toroidal mode number [W/m^3]; Time-dependent; Matrix(np
  real(EUITM_R8),pointer  :: powd_ntor_e(:,:) => null()     ! /powd_ntor_e - Flux surface averaged power density absorbed for each toroidal mode number on the thermal electrons 
  real(EUITM_R8),pointer  :: powd_ntor_i(:,:,:) => null()     ! /powd_ntor_i - Flux surface averaged power density absorbed for each toroidal mode number on each thermal ions spec
  real(EUITM_R8),pointer  :: powd_ntor_z(:,:,:,:) => null()     ! /powd_ntor_z - Flux surface averaged power density absorbed for each toroidal mode number on each thermal impurity 
  real(EUITM_R8),pointer  :: powd_ntor_fe(:,:) => null()     ! /powd_ntor_fe - Flux surface averaged power density absorbed for each toroidal mode number on the fast electrons [W/
  real(EUITM_R8),pointer  :: powd_ntor_fi(:,:,:) => null()     ! /powd_ntor_fi - Flux surface averaged power density absorbed for each toroidal mode number on each fast ions species
  real(EUITM_R8),pointer  :: powd_ntor_fz(:,:,:,:) => null()     ! /powd_ntor_fz - Flux surface averaged power density absorbed for each toroidal mode number on each fast impurity spe
  real(EUITM_R8),pointer  :: curd_tor(:) => null()     ! /curd_tor - Flux surface averaged wave driven toroidal current density = average(jphi/R) / average(1/R) [A/m^2];
  real(EUITM_R8),pointer  :: curd_torntor(:,:) => null()     ! /curd_torntor - Flux surface averaged wave driven toroidal current density for each toroidal mode number = average(j
  real(EUITM_R8),pointer  :: pow_tot(:) => null()     ! /pow_tot - Cumulative volume integral of the absorbed wave power density [W]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: pow_e(:) => null()     ! /pow_e - Cumulative volume integral of the absorbed wave power on the thermal electrons [W]; Time-dependent; 
  real(EUITM_R8),pointer  :: pow_i(:,:) => null()     ! /pow_i - Cumulative volume integral of the absorbed wave power on the thermal ion species [W]; Time-dependent
  real(EUITM_R8),pointer  :: pow_z(:,:,:) => null()     ! /pow_z - Cumulative volume integral of the absorbed wave power on the thermal impurities species [W]; Time-de
  real(EUITM_R8),pointer  :: pow_fe(:) => null()     ! /pow_fe - Cumulative volume integral of the absorbed wave power on the fast electrons [W]; Time-dependent; Vec
  real(EUITM_R8),pointer  :: pow_fi(:,:) => null()     ! /pow_fi - Cumulative volume integral of the absorbed wave power on the fast ion species [W]; Time-dependent; M
  real(EUITM_R8),pointer  :: pow_fz(:,:,:) => null()     ! /pow_fz - Cumulative volume integral of the absorbed wave power on the fast impurities species [W]; Time-depen
  real(EUITM_R8),pointer  :: pow_ntor(:,:) => null()     ! /pow_ntor - Cumulative volume integral of the absorbed wave power for each toroidal mode number [W]; Time-depend
  real(EUITM_R8),pointer  :: pow_ntor_e(:,:) => null()     ! /pow_ntor_e - Cumulative volume integral of the absorbed wave power for each toroidal mode number on the thermal e
  real(EUITM_R8),pointer  :: pow_ntor_i(:,:,:) => null()     ! /pow_ntor_i - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each thermal 
  real(EUITM_R8),pointer  :: pow_ntor_z(:,:,:) => null()     ! /pow_ntor_z - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each thermal 
  real(EUITM_R8),pointer  :: pow_ntor_fe(:,:) => null()     ! /pow_ntor_fe - Cumulative volume integral of the absorbed wave power for each toroidal mode number on the fast elec
  real(EUITM_R8),pointer  :: pow_ntor_fi(:,:,:) => null()     ! /pow_ntor_fi - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each fast ion
  real(EUITM_R8),pointer  :: pow_ntor_fz(:,:,:) => null()     ! /pow_ntor_fz - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each fast imp
  real(EUITM_R8),pointer  :: curd_par(:) => null()     ! /curd_par - Flux surface averaged wave driven parallel current density = average(j.B) / B0, where B0 = global_pa
  real(EUITM_R8),pointer  :: curd_parntor(:,:) => null()     ! /curd_parntor - Flux surface averaged wave driven parallel current density for each toroidal mode number = average(j
  real(EUITM_R8),pointer  :: cur_tor(:) => null()     ! /cur_tor - Wave driven toroidal current inside a flux surface [A]; Time-dependent; Vector (npsi)
  real(EUITM_R8),pointer  :: cur_tor_ntor(:,:) => null()     ! /cur_tor_ntor - Wave driven toroidal current inside a flux surface for each toroidal mode number [A]; Time-dependent
  real(EUITM_R8),pointer  :: e_plus_ave(:,:) => null()     ! /e_plus_ave - The left hand polarised electric field component, E_plus [V/m], averaged over the flux surface, wher
  real(EUITM_R8),pointer  :: e_minus_ave(:,:) => null()     ! /e_minus_ave - The right hand polarised electric field component, E_minus [V/m], averaged over the flux surface, wh
  real(EUITM_R8),pointer  :: e_para_ave(:,:) => null()     ! /e_para_ave - The parallel electric field component, E_para [V/m], averaged over the flux surface, where the avera
  real(EUITM_R8),pointer  :: k_perp_ave(:,:) => null()     ! /k_perp_ave - The perpendicular wave number, k_perp [1/m], averaged over the flux surface, where the averaged is w
endtype

  
type type_waves_profiles_2d  !    waves 2D profiles in poloidal cross-section
  real(EUITM_R8),pointer  :: powd_tot(:,:) => null()     ! /powd_tot - Total wave power density; Time-dependent [W/m^3]; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: powd_e(:,:) => null()     ! /powd_e - Absorbed wave power density on the thermal electrons [W/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: powd_i(:,:,:) => null()     ! /powd_i - Absorbed wave power density on each thermal ion species [W/m^3]; Time-dependent; Array3D (ndim1, ndi
  real(EUITM_R8),pointer  :: powd_z(:,:,:,:) => null()     ! /powd_z - Absorbed wave power density on each thermal impurity species [W/m^3]; Time-dependent; Array3D (ndim1
  real(EUITM_R8),pointer  :: powd_fe(:,:) => null()     ! /powd_fe - Absorbed wave power density on the fast electrons [W/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  real(EUITM_R8),pointer  :: powd_fi(:,:,:) => null()     ! /powd_fi - Absorbed wave power density on each fast ion species [W/m^3]; Time-dependent; Array3D (ndim1, ndim2,
  real(EUITM_R8),pointer  :: powd_fz(:,:,:,:) => null()     ! /powd_fz - Absorbed wave power density on each fast impurity species [W/m^3]; Time-dependent; Array3D (ndim1, n
  real(EUITM_R8),pointer  :: powd_ntor(:,:,:) => null()     ! /powd_ntor - Absorbed power density for each toroidal mode number [W/m^3]; Time-dependent; Array 3D (ndim1, ndim2
  real(EUITM_R8),pointer  :: powd_ntor_e(:,:,:) => null()     ! /powd_ntor_e - Absorbed power density for each toroidal mode number on the thermal electrons [W/m^3]; Time-dependen
  real(EUITM_R8),pointer  :: powd_ntor_i(:,:,:,:) => null()     ! /powd_ntor_i - Absorbed power density for each toroidal mode number on each thermal ions species [W/m^3]; Time-depe
  real(EUITM_R8),pointer  :: powd_ntor_z(:,:,:,:,:) => null()     ! /powd_ntor_z - Absorbed power density for each toroidal mode number on each thermal impurity species [W/m^3]; Time-
  real(EUITM_R8),pointer  :: powd_ntor_fe(:,:,:) => null()     ! /powd_ntor_fe - Absorbed power density for each toroidal mode number on the fast electrons [W/m^3]; Time-dependent; 
  real(EUITM_R8),pointer  :: powd_ntor_fi(:,:,:,:) => null()     ! /powd_ntor_fi - Absorbed power density for each toroidal mode number on each fast ions species [W/m^3]; Time-depende
  real(EUITM_R8),pointer  :: powd_ntor_fz(:,:,:,:,:) => null()     ! /powd_ntor_fz - Absorbed power density for each toroidal mode number on each fast impurity species [W/m^3]; Time-dep
  real(EUITM_R8),pointer  :: powd_iharm(:,:,:,:,:) => null()     ! /powd_iharm - Power density absorbed by an ion species for each toroidal mode numer at a given harmonic cyclotron 
endtype

  
type type_waves_rtposition  !    Ray/beam position
  real(EUITM_R8),pointer  :: r(:) => null()     ! /r - Major radius location [m]; Time-dependent; Vector (npoints)
  real(EUITM_R8),pointer  :: z(:) => null()     ! /z - Vertical location [m]; Time-dependent; Vector (npoints)
  real(EUITM_R8),pointer  :: phi(:) => null()     ! /phi - Toroidal angle location [rad]; Time-dependent; Vector (npoints)
  real(EUITM_R8),pointer  :: psi(:) => null()     ! /psi - Poloidal magnetic flux coordinate [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi; Time-depe
  real(EUITM_R8),pointer  :: theta(:) => null()     ! /theta - Poloidal angle location [rad]; Time-dependent; Vector (npoints). PRECISE THE DEFINITION OF THE POLOI
endtype

  
type type_waves_rtwavevector  !    Ray/beam wave vector
  real(EUITM_R8),pointer  :: kr(:) => null()     ! /kr - Wave vector in the major radius direction [m**-1], Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: kz(:) => null()     ! /kz - Wave vector in the vertical direction [m**-1], Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: kphi(:) => null()     ! /kphi - Wave vector in the toroidal direction [m**-1], Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: npar(:) => null()     ! /npar - Parallel refractive index, Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: nperp(:) => null()     ! /nperp - Perpendicular refractive index, Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: ntor(:) => null()     ! /ntor - Toroidal wave number, Vector (npoints/1). If var_ntor=0, ntor is constant along the ray path and the
  integer  :: var_ntor=-999999999       ! /var_ntor - Flag telling whether ntor is constant along the ray path (0) or varying (1). Integer
endtype
  
type type_waves_global_param_mask  !    Global wave deposition parameters
  integer  :: name=0       ! /name - Antenna name, String
  integer  :: type=0       ! /type - Wave type (LH, EC, IC, ...), String
  integer  :: f_assumption=0       ! /f_assumption - Assumption on the functions distribution used by the wave solver to calculate the power deposition :
  integer  :: code_type=0       ! /code_type - Type of wave deposition code for a given frequency: 1=beam/ray tracing; 2=full wave; Integer
  integer  :: frequency=0       ! /frequency - Wave frequency [Hz]; Time-dependent, floating
  integer  :: ntor=0       ! /ntor - Toroidal mode numbers; Time-dependent; Vector (ntor)
  integer  :: power_tot=0       ! /power_tot - Total absorbed wave power [W]; Time-dependent
  integer  :: p_frac_ntor=0       ! /p_frac_ntor - Fraction of wave power per toroidal mode number; Time-dependent; Vector (ntor)
  integer  :: pow_e=0       ! /pow_e - Wave power absorbed by the thermal electrons [W]; Time-dependent; Float
  integer  :: pow_i=0       ! /pow_i - Wave power absorbed by the thermal ion species [W]; Time-dependent; Vector (nion)
  integer  :: pow_z=0       ! /pow_z - Wave power absorbed by the thermal impurity species [W]; Time-dependent; Vector (nimpur, nzimp)
  integer  :: pow_fe=0       ! /pow_fe - Wave power absorbed by the fast electrons [W]; Time-dependent; Float
  integer  :: pow_fi=0       ! /pow_fi - Wave power absorbed by the fast ion species [W]; Time-dependent; Vector (nion)
  integer  :: pow_fz=0       ! /pow_fz - Wave power absorbed by the fast impurity species [W]; Time-dependent; Vector (nimpur, nzimp)
  integer  :: pow_ntor_e=0       ! /pow_ntor_e - Wave power absorbed by the thermal electrons for each toroidal mode [W]; Time-dependent; Vector (nto
  integer  :: pow_ntor_i=0       ! /pow_ntor_i - Wave power absorbed by an the thermal ion species for each toroidal mode [W]; Time-dependent; Matrix
  integer  :: pow_ntor_z=0       ! /pow_ntor_z - Wave power absorbed by an the thermal impurity species for each toroidal mode [W]; Time-dependent; M
  integer  :: pow_ntor_fe=0       ! /pow_ntor_fe - Wave power absorbed by the fast electrons for each toroidal mode [W]; Time-dependent; Vector (ntor)
  integer  :: pow_ntor_fi=0       ! /pow_ntor_fi - Wave power absorbed by an the fast ion species for each toroidal mode [W]; Time-dependent; Matrix (n
  integer  :: pow_ntor_fz=0       ! /pow_ntor_fz - Wave power absorbed by an the fast impurity species for each toroidal mode [W]; Time-dependent; Matr
  integer  :: cur_tor=0       ! /cur_tor - Wave driven toroidal current from a stand alone calculation (not consistent with other sources) [A];
  integer  :: cur_tor_ntor=0       ! /cur_tor_ntor - Wave driven toroidal current for each toroidal mode number from a stand alone calculation (not consi
  type (type_rz0D_mask) :: mag_axis  ! /mag_axis - Position of the magnetic axis. Time-dependent; Scalar
  type (type_b0r0_mask) :: toroid_field  ! /toroid_field - Characteristics of the vacuum toroidal field (used to define the rho_tor coordinate and the normalis
endtype
  
type type_waves_grid_1d_mask  !    Grid points for profiles
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  integer  :: psi=0       ! /psi - Poloidal flux function [Wb], evaluated without 1/2pi, such that Bp=|grad psi| /R/2/pi. Time-dependen
  integer  :: volume=0       ! /volume - Volume enclosed by the flux surface [m^3]. Time-dependent; Vector (npsi)
  integer  :: area=0       ! /area - Cross-sectional area of the flux surface [m^2]. Time-dependent; Vector (npsi)
endtype
  
type type_waves_grid_2d_mask  !    Grid points for 2D profiles
  integer  :: grid_type=0       ! /grid_type - Grid type. 1: rectangular grid in (R,Z). 2: rectangular grid in (psi, theta). 3: unstructured grid. 
  integer  :: rho_tor_norm=0       ! /rho_tor_norm - The toroidal flux coordinate normalised to be zero at the axis and unity at the last closed flux sur
  integer  :: rho_tor=0       ! /rho_tor - Toroidal flux coordinate [m]. Defined as sqrt((phi-phi_axis)/pi/B0), where B0=../global_param/toroid
  integer  :: psi=0       ! /psi - Grid points in poloidal flux function [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi. Time-
  integer  :: theta=0       ! /theta - Poloidal angle at the grid points (see theta_info for detailed definition); Time-dependent; Matrix (
  integer  :: r=0       ! /r - R (major radius) of grid points; Time-dependent; Matrix(ndim1, ndim2)
  integer  :: z=0       ! /z - Z (altitude) of grid points; Time-dependent; Matrix (ndim1, ndim2)
  type (type_theta_info_mask) :: theta_info  ! /theta_info - Information on the poloidal angle theta.
endtype
  
type type_waves_profiles_1d_mask  !    waves 1D radial profiles
  integer  :: powd_tot=0       ! /powd_tot - Total flux surface averaged wave power density [W/m^3]; Time-dependent; Vector (npsi)
  integer  :: powd_e=0       ! /powd_e - Flux surface averaged absorbed wave power density on the thermal electrons [W/m^3]; Time-dependent; 
  integer  :: powd_i=0       ! /powd_i - Flux surface averaged absorbed wave power density on the thermal ion species [W/m^3]; Time-dependent
  integer  :: powd_z=0       ! /powd_z - Flux surface averaged absorbed wave power density on the thermal impurities species [W/m^3]; Time-de
  integer  :: powd_fe=0       ! /powd_fe - Flux surface averaged absorbed wave power density on the fast electrons [W/m^3]; Time-dependent; Vec
  integer  :: powd_fi=0       ! /powd_fi - Flux surface averaged absorbed wave power density on the fast ion species [W/m^3]; Time-dependent; M
  integer  :: powd_fz=0       ! /powd_fz - Flux surface averaged absorbed wave power density on the fast impurities species [W/m^3]; Time-depen
  integer  :: powd_ntor=0       ! /powd_ntor - Flux surface averaged power density for each toroidal mode number [W/m^3]; Time-dependent; Matrix(np
  integer  :: powd_ntor_e=0       ! /powd_ntor_e - Flux surface averaged power density absorbed for each toroidal mode number on the thermal electrons 
  integer  :: powd_ntor_i=0       ! /powd_ntor_i - Flux surface averaged power density absorbed for each toroidal mode number on each thermal ions spec
  integer  :: powd_ntor_z=0       ! /powd_ntor_z - Flux surface averaged power density absorbed for each toroidal mode number on each thermal impurity 
  integer  :: powd_ntor_fe=0       ! /powd_ntor_fe - Flux surface averaged power density absorbed for each toroidal mode number on the fast electrons [W/
  integer  :: powd_ntor_fi=0       ! /powd_ntor_fi - Flux surface averaged power density absorbed for each toroidal mode number on each fast ions species
  integer  :: powd_ntor_fz=0       ! /powd_ntor_fz - Flux surface averaged power density absorbed for each toroidal mode number on each fast impurity spe
  integer  :: curd_tor=0       ! /curd_tor - Flux surface averaged wave driven toroidal current density = average(jphi/R) / average(1/R) [A/m^2];
  integer  :: curd_torntor=0       ! /curd_torntor - Flux surface averaged wave driven toroidal current density for each toroidal mode number = average(j
  integer  :: pow_tot=0       ! /pow_tot - Cumulative volume integral of the absorbed wave power density [W]; Time-dependent; Vector (npsi)
  integer  :: pow_e=0       ! /pow_e - Cumulative volume integral of the absorbed wave power on the thermal electrons [W]; Time-dependent; 
  integer  :: pow_i=0       ! /pow_i - Cumulative volume integral of the absorbed wave power on the thermal ion species [W]; Time-dependent
  integer  :: pow_z=0       ! /pow_z - Cumulative volume integral of the absorbed wave power on the thermal impurities species [W]; Time-de
  integer  :: pow_fe=0       ! /pow_fe - Cumulative volume integral of the absorbed wave power on the fast electrons [W]; Time-dependent; Vec
  integer  :: pow_fi=0       ! /pow_fi - Cumulative volume integral of the absorbed wave power on the fast ion species [W]; Time-dependent; M
  integer  :: pow_fz=0       ! /pow_fz - Cumulative volume integral of the absorbed wave power on the fast impurities species [W]; Time-depen
  integer  :: pow_ntor=0       ! /pow_ntor - Cumulative volume integral of the absorbed wave power for each toroidal mode number [W]; Time-depend
  integer  :: pow_ntor_e=0       ! /pow_ntor_e - Cumulative volume integral of the absorbed wave power for each toroidal mode number on the thermal e
  integer  :: pow_ntor_i=0       ! /pow_ntor_i - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each thermal 
  integer  :: pow_ntor_z=0       ! /pow_ntor_z - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each thermal 
  integer  :: pow_ntor_fe=0       ! /pow_ntor_fe - Cumulative volume integral of the absorbed wave power for each toroidal mode number on the fast elec
  integer  :: pow_ntor_fi=0       ! /pow_ntor_fi - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each fast ion
  integer  :: pow_ntor_fz=0       ! /pow_ntor_fz - Cumulative volume integral of the absorbed wave power for each toroidal mode number on each fast imp
  integer  :: curd_par=0       ! /curd_par - Flux surface averaged wave driven parallel current density = average(j.B) / B0, where B0 = global_pa
  integer  :: curd_parntor=0       ! /curd_parntor - Flux surface averaged wave driven parallel current density for each toroidal mode number = average(j
  integer  :: cur_tor=0       ! /cur_tor - Wave driven toroidal current inside a flux surface [A]; Time-dependent; Vector (npsi)
  integer  :: cur_tor_ntor=0       ! /cur_tor_ntor - Wave driven toroidal current inside a flux surface for each toroidal mode number [A]; Time-dependent
  integer  :: e_plus_ave=0       ! /e_plus_ave - The left hand polarised electric field component, E_plus [V/m], averaged over the flux surface, wher
  integer  :: e_minus_ave=0       ! /e_minus_ave - The right hand polarised electric field component, E_minus [V/m], averaged over the flux surface, wh
  integer  :: e_para_ave=0       ! /e_para_ave - The parallel electric field component, E_para [V/m], averaged over the flux surface, where the avera
  integer  :: k_perp_ave=0       ! /k_perp_ave - The perpendicular wave number, k_perp [1/m], averaged over the flux surface, where the averaged is w
endtype
  
type type_waves_profiles_2d_mask  !    waves 2D profiles in poloidal cross-section
  integer  :: powd_tot=0       ! /powd_tot - Total wave power density; Time-dependent [W/m^3]; Matrix (ndim1, ndim2)
  integer  :: powd_e=0       ! /powd_e - Absorbed wave power density on the thermal electrons [W/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: powd_i=0       ! /powd_i - Absorbed wave power density on each thermal ion species [W/m^3]; Time-dependent; Array3D (ndim1, ndi
  integer  :: powd_z=0       ! /powd_z - Absorbed wave power density on each thermal impurity species [W/m^3]; Time-dependent; Array3D (ndim1
  integer  :: powd_fe=0       ! /powd_fe - Absorbed wave power density on the fast electrons [W/m^3]; Time-dependent; Matrix (ndim1, ndim2)
  integer  :: powd_fi=0       ! /powd_fi - Absorbed wave power density on each fast ion species [W/m^3]; Time-dependent; Array3D (ndim1, ndim2,
  integer  :: powd_fz=0       ! /powd_fz - Absorbed wave power density on each fast impurity species [W/m^3]; Time-dependent; Array3D (ndim1, n
  integer  :: powd_ntor=0       ! /powd_ntor - Absorbed power density for each toroidal mode number [W/m^3]; Time-dependent; Array 3D (ndim1, ndim2
  integer  :: powd_ntor_e=0       ! /powd_ntor_e - Absorbed power density for each toroidal mode number on the thermal electrons [W/m^3]; Time-dependen
  integer  :: powd_ntor_i=0       ! /powd_ntor_i - Absorbed power density for each toroidal mode number on each thermal ions species [W/m^3]; Time-depe
  integer  :: powd_ntor_z=0       ! /powd_ntor_z - Absorbed power density for each toroidal mode number on each thermal impurity species [W/m^3]; Time-
  integer  :: powd_ntor_fe=0       ! /powd_ntor_fe - Absorbed power density for each toroidal mode number on the fast electrons [W/m^3]; Time-dependent; 
  integer  :: powd_ntor_fi=0       ! /powd_ntor_fi - Absorbed power density for each toroidal mode number on each fast ions species [W/m^3]; Time-depende
  integer  :: powd_ntor_fz=0       ! /powd_ntor_fz - Absorbed power density for each toroidal mode number on each fast impurity species [W/m^3]; Time-dep
  integer  :: powd_iharm=0       ! /powd_iharm - Power density absorbed by an ion species for each toroidal mode numer at a given harmonic cyclotron 
endtype
  
type type_waves_rtposition_mask  !    Ray/beam position
  integer  :: r=0       ! /r - Major radius location [m]; Time-dependent; Vector (npoints)
  integer  :: z=0       ! /z - Vertical location [m]; Time-dependent; Vector (npoints)
  integer  :: phi=0       ! /phi - Toroidal angle location [rad]; Time-dependent; Vector (npoints)
  integer  :: psi=0       ! /psi - Poloidal magnetic flux coordinate [Wb], without 1/2pi and such that Bp=|grad psi| /R/2/pi; Time-depe
  integer  :: theta=0       ! /theta - Poloidal angle location [rad]; Time-dependent; Vector (npoints). PRECISE THE DEFINITION OF THE POLOI
endtype
  
type type_waves_rtwavevector_mask  !    Ray/beam wave vector
  integer  :: kr=0       ! /kr - Wave vector in the major radius direction [m**-1], Vector (npoints). Time-dependent
  integer  :: kz=0       ! /kz - Wave vector in the vertical direction [m**-1], Vector (npoints). Time-dependent
  integer  :: kphi=0       ! /kphi - Wave vector in the toroidal direction [m**-1], Vector (npoints). Time-dependent
  integer  :: npar=0       ! /npar - Parallel refractive index, Vector (npoints). Time-dependent
  integer  :: nperp=0       ! /nperp - Perpendicular refractive index, Vector (npoints). Time-dependent
  integer  :: ntor=0       ! /ntor - Toroidal wave number, Vector (npoints/1). If var_ntor=0, ntor is constant along the ray path and the
  integer  :: var_ntor=0       ! /var_ntor - Flag telling whether ntor is constant along the ray path (0) or varying (1). Integer
endtype

  
type type_polarization  !    
  real(EUITM_R8),pointer  :: epol_p_re(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_p_re - Real part of the left hand polarized electric field (rotating with the ions), Vector (npoints). Time
  real(EUITM_R8),pointer  :: epol_p_im(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_p_im - Imaginary part of the left hand polarized electric field (rotating with the ions), Vector (npoints).
  real(EUITM_R8),pointer  :: epol_m_re(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_m_re - Real part of the right hand polarized electric field (rotating with the electrons), Vector (npoints)
  real(EUITM_R8),pointer  :: epol_m_im(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_m_im - Real part of the right hand polarized electric field (rotating with the electrons), Vector (npoints)
  real(EUITM_R8),pointer  :: epol_par_re(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_par_re - Real part of the electric field polarization vector in the magnetic field direction, Vector (npoints
  real(EUITM_R8),pointer  :: epol_par_im(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_par_im - Imaginary part of the electric field polarization vector in the magnetic field direction, Vector (np
endtype

  
type type_powerflow  !    
  real(EUITM_R8),pointer  :: phi_perp(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/powerflow/phi_perp - Normalized power flow in the direction perpendicular to the magnetic field; Vector (npoints). Time-d
  real(EUITM_R8),pointer  :: phi_par(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/powerflow/phi_par - Normalized power flow in the direction parallel to the magnetic field; Vector (npoints). Time-depend
  real(EUITM_R8),pointer  :: power_e(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/powerflow/power_e - Power absorbed along the beam by electrons [W]; Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: power_i(:,:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/powerflow/power_i - Power absorbed along the beam by an ion species [W]; Matrix (npoints, nion). Time-dependent
endtype

  
type type_e_components  !    
  type (type_complexgrid_scalar_cplx) :: e_plus  ! /waves/coherentwave(i)/fullwave/e_components/e_plus - Left hand circularly polarised component of the perpendicular (to the static magnetic field) electri
  type (type_complexgrid_scalar_cplx) :: e_minus  ! /waves/coherentwave(i)/fullwave/e_components/e_minus - Right hand circularly polarised component of the perpendicular (to the static magnetic field) electr
  type (type_complexgrid_scalar_cplx) :: e_para  ! /waves/coherentwave(i)/fullwave/e_components/e_para - Parallel (to the static magnetic field) component of electric field [V/m]. Time-dependent; Complexgr
  type (type_complexgrid_scalar_cplx) :: e_norm  ! /waves/coherentwave(i)/fullwave/e_components/e_norm - Magnitude of wave electric field normal to a flux surface [V/m]; Time-dependent; Complexgrid_scalar
  type (type_complexgrid_scalar_cplx) :: e_binorm  ! /waves/coherentwave(i)/fullwave/e_components/e_binorm - Magnitude of perpendicular (to the static magnetic field) wave electric field tangent to a flux surf
  type (type_complexgrid_scalar_cplx) :: b_norm  ! /waves/coherentwave(i)/fullwave/e_components/b_norm - Magnitude of perpendicular (to the static magnetic field) wave magnetic field normal to a flux surfa
  type (type_complexgrid_scalar_cplx) :: b_binorm  ! /waves/coherentwave(i)/fullwave/e_components/b_binorm - Magnitude of wave magnetic field tangent to a flux surface [T]; Time-dependent; Complexgrid_scalar
  type (type_complexgrid_scalar_cplx) :: b_para  ! /waves/coherentwave(i)/fullwave/e_components/b_para - Magnitude of wave magnetic field parallel to the equilibrium magnetic field [T]; Time-dependent; Com
  type (type_complexgrid_scalar_cplx) :: k_perp  ! /waves/coherentwave(i)/fullwave/e_components/k_perp - Perpendicular wave number [1/m]; Time-dependent; Complexgrid_scalar
endtype

  
type type_pol_decomp  !    
  integer,pointer  :: mpol(:) => null()      ! /waves/coherentwave(i)/fullwave/pol_decomp/mpol - Poloidal mode numbers; Vector (nmpol)
  real(EUITM_R8),pointer  :: e_plus(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_plus - Magnitude of poloidal Fourier decomposition of left hand polarised component of the wave electric fi
  real(EUITM_R8),pointer  :: e_plus_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_plus_ph - Phase of poloidal Fourier decomposition of left hand polarised component of the wave electric field 
  real(EUITM_R8),pointer  :: e_minus(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_minus - Magnitude of poloidal Fourier decomposition of right hand polarised component of the wave electric f
  real(EUITM_R8),pointer  :: e_minus_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_minus_ph - Phase of poloidal Fourier decomposition of right hand polarised component of the wave electric field
  real(EUITM_R8),pointer  :: e_norm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_norm - Magnitude of poloidal Fourier decomposition of  wave electric field normal to a flux surface [V/m]; 
  real(EUITM_R8),pointer  :: e_norm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_norm_ph - Phase of poloidal Fourier decomposition of  wave electric field normal to a flux surface [rad]; Time
  real(EUITM_R8),pointer  :: e_binorm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_binorm - Magnitude of poloidal Fourier decomposition of wave electric field tangent to a flux surface [V/m]; 
  real(EUITM_R8),pointer  :: e_binorm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_binorm_ph - Phase of poloidal Fourier decomposition of wave electric field tangent to a flux surface [rad]; Time
  real(EUITM_R8),pointer  :: e_para(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_para - Magnitude of poloidal Fourier decomposition of parallel wave electric field [V/m]; Time-dependent; A
  real(EUITM_R8),pointer  :: e_para_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/e_para_ph - Phase of poloidal Fourier decomposition of parallel wave electric field [rad]; Time-dependent; Array
  real(EUITM_R8),pointer  :: b_norm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_norm - Magnitude of poloidal Fourier decomposition of wave magnetic field normal to a flux surface [T]; Tim
  real(EUITM_R8),pointer  :: b_norm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_norm_ph - Phase of poloidal Fourier decomposition of normal wave magnetic field [rad]; Time-dependent; Array 3
  real(EUITM_R8),pointer  :: b_binorm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_binorm - Magnitude of poloidal Fourier decomposition of wave magnetic field tangent to a flux surface [T]; Ti
  real(EUITM_R8),pointer  :: b_binorm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_binorm_ph - Phase of poloidal Fourier decomposition of wave magnetic field tangent to a flux surface [rad]; Time
  real(EUITM_R8),pointer  :: b_para(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_para - Magnitude of Fourier decomposition of wave magnetic field parallel to the equilibrium magnetic field
  real(EUITM_R8),pointer  :: b_para_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/b_para_ph - Phase of Fourier decomposition of wave magnetic field parallel to the equilibrium magnetic field [T]
  real(EUITM_R8),pointer  :: k_perp(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/pol_decomp/k_perp - Perpendicular wave number [T]; Time-dependent; Array 3D (ntor, npsi, nmpol)
endtype

  
type type_local  !    
  real(EUITM_R8),pointer  :: e_plus(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_plus - Magnitude of left hand polarised component of the wave electric field [V/m]; Time-dependent; Array 3
  real(EUITM_R8),pointer  :: e_plus_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_plus_ph - Phase of left hand polarised component of the wave electric field [rad]; Time-dependent; Array 3D (n
  real(EUITM_R8),pointer  :: e_minus(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_minus - Magnitude of right hand polarised component of the wave electric field [v/m]; Time-dependent; Array 
  real(EUITM_R8),pointer  :: e_minus_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_minus_ph - Phase of right hand polarised component of the wave electric field [rad]; Time-dependent; Array 3D (
  integer,pointer  :: e_norm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_norm - Magnitude of wave electric field normal to a flux surface [V/m]; Time-dependent; 3D (ntor, ndim1, nd
  real(EUITM_R8),pointer  :: enorm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/enorm_ph - Phase of wave electric field normal to a flux surface [rad]; Time-dependent; 3D (ntor, ndim1, ndim2)
  real(EUITM_R8),pointer  :: e_binorm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_binorm - Magnitude of wave electric field tangent to a flux surface [V/m]; Time-dependent; 3D (ntor, ndim1, n
  real(EUITM_R8),pointer  :: e_binorm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_binorm_ph - Phase of wave electric field tangent to a flux surface [rad]; Time-dependent; 3D (ntor, ndim1, ndim2
  real(EUITM_R8),pointer  :: e_para(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_para - Magnitude of parallel wave electric field [V/m]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
  real(EUITM_R8),pointer  :: e_para_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/e_para_ph - Phase of parallel wave electric field [rad]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
  real(EUITM_R8),pointer  :: b_norm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_norm - Magnitude of wave magnetic field normal to a flux surface [T]; Time-dependent; Array 3D (ntor, ndim1
  real(EUITM_R8),pointer  :: b_norm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_norm_ph - Phase of wave magnetic field normal to a flux surface [rad]; Time-dependent; Array 3D (ntor, ndim1, 
  real(EUITM_R8),pointer  :: b_binorm(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_binorm - Magnitude of wave magnetic field tangent to a flux surface [T]; Time-dependent; Array 3D (ntor, ndim
  real(EUITM_R8),pointer  :: b_binorm_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_binorm_ph - Phase of wave magnetic field tangent to a flux surface [rad]; Time-dependent; Array 3D (ntor, ndim1,
  real(EUITM_R8),pointer  :: b_para(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_para - Magnitude of wave magnetic field parallel to the equilibrium magnetic field [T]; Time-dependent; Arr
  real(EUITM_R8),pointer  :: b_para_ph(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/b_para_ph - Phase of wave magnetic field parallel to the equilibrium magnetic field [rad]; Time-dependent; Array
  real(EUITM_R8),pointer  :: k_perp(:,:,:) => null()     ! /waves/coherentwave(i)/fullwave/local/k_perp - Perpendicular wave number [T]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
endtype
  
type type_polarization_mask  !    
  integer  :: epol_p_re=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_p_re - Real part of the left hand polarized electric field (rotating with the ions), Vector (npoints). Time
  integer  :: epol_p_im=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_p_im - Imaginary part of the left hand polarized electric field (rotating with the ions), Vector (npoints).
  integer  :: epol_m_re=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_m_re - Real part of the right hand polarized electric field (rotating with the electrons), Vector (npoints)
  integer  :: epol_m_im=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_m_im - Real part of the right hand polarized electric field (rotating with the electrons), Vector (npoints)
  integer  :: epol_par_re=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_par_re - Real part of the electric field polarization vector in the magnetic field direction, Vector (npoints
  integer  :: epol_par_im=0       ! /waves/coherentwave(i)/beamtracing(i)/polarization/epol_par_im - Imaginary part of the electric field polarization vector in the magnetic field direction, Vector (np
endtype
  
type type_powerflow_mask  !    
  integer  :: phi_perp=0       ! /waves/coherentwave(i)/beamtracing(i)/powerflow/phi_perp - Normalized power flow in the direction perpendicular to the magnetic field; Vector (npoints). Time-d
  integer  :: phi_par=0       ! /waves/coherentwave(i)/beamtracing(i)/powerflow/phi_par - Normalized power flow in the direction parallel to the magnetic field; Vector (npoints). Time-depend
  integer  :: power_e=0       ! /waves/coherentwave(i)/beamtracing(i)/powerflow/power_e - Power absorbed along the beam by electrons [W]; Vector (npoints). Time-dependent
  integer  :: power_i=0       ! /waves/coherentwave(i)/beamtracing(i)/powerflow/power_i - Power absorbed along the beam by an ion species [W]; Matrix (npoints, nion). Time-dependent
endtype
  
type type_e_components_mask  !    
  type (type_complexgrid_scalar_cplx_mask) :: e_plus  ! /waves/coherentwave(i)/fullwave/e_components/e_plus - Left hand circularly polarised component of the perpendicular (to the static magnetic field) electri
  type (type_complexgrid_scalar_cplx_mask) :: e_minus  ! /waves/coherentwave(i)/fullwave/e_components/e_minus - Right hand circularly polarised component of the perpendicular (to the static magnetic field) electr
  type (type_complexgrid_scalar_cplx_mask) :: e_para  ! /waves/coherentwave(i)/fullwave/e_components/e_para - Parallel (to the static magnetic field) component of electric field [V/m]. Time-dependent; Complexgr
  type (type_complexgrid_scalar_cplx_mask) :: e_norm  ! /waves/coherentwave(i)/fullwave/e_components/e_norm - Magnitude of wave electric field normal to a flux surface [V/m]; Time-dependent; Complexgrid_scalar
  type (type_complexgrid_scalar_cplx_mask) :: e_binorm  ! /waves/coherentwave(i)/fullwave/e_components/e_binorm - Magnitude of perpendicular (to the static magnetic field) wave electric field tangent to a flux surf
  type (type_complexgrid_scalar_cplx_mask) :: b_norm  ! /waves/coherentwave(i)/fullwave/e_components/b_norm - Magnitude of perpendicular (to the static magnetic field) wave magnetic field normal to a flux surfa
  type (type_complexgrid_scalar_cplx_mask) :: b_binorm  ! /waves/coherentwave(i)/fullwave/e_components/b_binorm - Magnitude of wave magnetic field tangent to a flux surface [T]; Time-dependent; Complexgrid_scalar
  type (type_complexgrid_scalar_cplx_mask) :: b_para  ! /waves/coherentwave(i)/fullwave/e_components/b_para - Magnitude of wave magnetic field parallel to the equilibrium magnetic field [T]; Time-dependent; Com
  type (type_complexgrid_scalar_cplx_mask) :: k_perp  ! /waves/coherentwave(i)/fullwave/e_components/k_perp - Perpendicular wave number [1/m]; Time-dependent; Complexgrid_scalar
endtype
  
type type_pol_decomp_mask  !    
  integer  :: mpol=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/mpol - Poloidal mode numbers; Vector (nmpol)
  integer  :: e_plus=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_plus - Magnitude of poloidal Fourier decomposition of left hand polarised component of the wave electric fi
  integer  :: e_plus_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_plus_ph - Phase of poloidal Fourier decomposition of left hand polarised component of the wave electric field 
  integer  :: e_minus=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_minus - Magnitude of poloidal Fourier decomposition of right hand polarised component of the wave electric f
  integer  :: e_minus_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_minus_ph - Phase of poloidal Fourier decomposition of right hand polarised component of the wave electric field
  integer  :: e_norm=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_norm - Magnitude of poloidal Fourier decomposition of  wave electric field normal to a flux surface [V/m]; 
  integer  :: e_norm_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_norm_ph - Phase of poloidal Fourier decomposition of  wave electric field normal to a flux surface [rad]; Time
  integer  :: e_binorm=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_binorm - Magnitude of poloidal Fourier decomposition of wave electric field tangent to a flux surface [V/m]; 
  integer  :: e_binorm_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_binorm_ph - Phase of poloidal Fourier decomposition of wave electric field tangent to a flux surface [rad]; Time
  integer  :: e_para=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_para - Magnitude of poloidal Fourier decomposition of parallel wave electric field [V/m]; Time-dependent; A
  integer  :: e_para_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/e_para_ph - Phase of poloidal Fourier decomposition of parallel wave electric field [rad]; Time-dependent; Array
  integer  :: b_norm=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_norm - Magnitude of poloidal Fourier decomposition of wave magnetic field normal to a flux surface [T]; Tim
  integer  :: b_norm_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_norm_ph - Phase of poloidal Fourier decomposition of normal wave magnetic field [rad]; Time-dependent; Array 3
  integer  :: b_binorm=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_binorm - Magnitude of poloidal Fourier decomposition of wave magnetic field tangent to a flux surface [T]; Ti
  integer  :: b_binorm_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_binorm_ph - Phase of poloidal Fourier decomposition of wave magnetic field tangent to a flux surface [rad]; Time
  integer  :: b_para=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_para - Magnitude of Fourier decomposition of wave magnetic field parallel to the equilibrium magnetic field
  integer  :: b_para_ph=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/b_para_ph - Phase of Fourier decomposition of wave magnetic field parallel to the equilibrium magnetic field [T]
  integer  :: k_perp=0       ! /waves/coherentwave(i)/fullwave/pol_decomp/k_perp - Perpendicular wave number [T]; Time-dependent; Array 3D (ntor, npsi, nmpol)
endtype
  
type type_local_mask  !    
  integer  :: e_plus=0       ! /waves/coherentwave(i)/fullwave/local/e_plus - Magnitude of left hand polarised component of the wave electric field [V/m]; Time-dependent; Array 3
  integer  :: e_plus_ph=0       ! /waves/coherentwave(i)/fullwave/local/e_plus_ph - Phase of left hand polarised component of the wave electric field [rad]; Time-dependent; Array 3D (n
  integer  :: e_minus=0       ! /waves/coherentwave(i)/fullwave/local/e_minus - Magnitude of right hand polarised component of the wave electric field [v/m]; Time-dependent; Array 
  integer  :: e_minus_ph=0       ! /waves/coherentwave(i)/fullwave/local/e_minus_ph - Phase of right hand polarised component of the wave electric field [rad]; Time-dependent; Array 3D (
  integer  :: e_norm=0       ! /waves/coherentwave(i)/fullwave/local/e_norm - Magnitude of wave electric field normal to a flux surface [V/m]; Time-dependent; 3D (ntor, ndim1, nd
  integer  :: enorm_ph=0       ! /waves/coherentwave(i)/fullwave/local/enorm_ph - Phase of wave electric field normal to a flux surface [rad]; Time-dependent; 3D (ntor, ndim1, ndim2)
  integer  :: e_binorm=0       ! /waves/coherentwave(i)/fullwave/local/e_binorm - Magnitude of wave electric field tangent to a flux surface [V/m]; Time-dependent; 3D (ntor, ndim1, n
  integer  :: e_binorm_ph=0       ! /waves/coherentwave(i)/fullwave/local/e_binorm_ph - Phase of wave electric field tangent to a flux surface [rad]; Time-dependent; 3D (ntor, ndim1, ndim2
  integer  :: e_para=0       ! /waves/coherentwave(i)/fullwave/local/e_para - Magnitude of parallel wave electric field [V/m]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
  integer  :: e_para_ph=0       ! /waves/coherentwave(i)/fullwave/local/e_para_ph - Phase of parallel wave electric field [rad]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
  integer  :: b_norm=0       ! /waves/coherentwave(i)/fullwave/local/b_norm - Magnitude of wave magnetic field normal to a flux surface [T]; Time-dependent; Array 3D (ntor, ndim1
  integer  :: b_norm_ph=0       ! /waves/coherentwave(i)/fullwave/local/b_norm_ph - Phase of wave magnetic field normal to a flux surface [rad]; Time-dependent; Array 3D (ntor, ndim1, 
  integer  :: b_binorm=0       ! /waves/coherentwave(i)/fullwave/local/b_binorm - Magnitude of wave magnetic field tangent to a flux surface [T]; Time-dependent; Array 3D (ntor, ndim
  integer  :: b_binorm_ph=0       ! /waves/coherentwave(i)/fullwave/local/b_binorm_ph - Phase of wave magnetic field tangent to a flux surface [rad]; Time-dependent; Array 3D (ntor, ndim1,
  integer  :: b_para=0       ! /waves/coherentwave(i)/fullwave/local/b_para - Magnitude of wave magnetic field parallel to the equilibrium magnetic field [T]; Time-dependent; Arr
  integer  :: b_para_ph=0       ! /waves/coherentwave(i)/fullwave/local/b_para_ph - Phase of wave magnetic field parallel to the equilibrium magnetic field [rad]; Time-dependent; Array
  integer  :: k_perp=0       ! /waves/coherentwave(i)/fullwave/local/k_perp - Perpendicular wave number [T]; Time-dependent; Array 3D (ntor, ndim1, ndim2)
endtype

  
type type_beamtracing  !    
  integer  :: npoints=-999999999       ! /waves/coherentwave(i)/beamtracing(i)/npoints - Number of points along each ray/beam. Integer
  real(EUITM_R8)  :: power=-9.0E40_EUITM_R8       ! /waves/coherentwave(i)/beamtracing(i)/power - Initial power in each ray/beam [W]. Float. Time-dependent
  real(EUITM_R8),pointer  :: dnpar(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/dnpar - Spectral width in refractive index associated with each ray/beam, Vector (npoints). Time-dependent
  real(EUITM_R8),pointer  :: length(:) => null()     ! /waves/coherentwave(i)/beamtracing(i)/length - Ray/beam curvilinear length [m], Vector (npoints). Time-dependent
  type (type_waves_rtposition) :: position  ! /waves/coherentwave(i)/beamtracing(i)/position - Ray/beam position
  type (type_waves_rtwavevector) :: wavevector  ! /waves/coherentwave(i)/beamtracing(i)/wavevector - Ray/beam wave vector.
  type (type_polarization) :: polarization  ! /waves/coherentwave(i)/beamtracing(i)/polarization - Wave field polarization along the ray/beam.
  type (type_powerflow) :: powerflow  ! /waves/coherentwave(i)/beamtracing(i)/powerflow - Power flow along the ray/beam.
endtype

  
type type_fullwave  !    
  type (type_complexgrid) :: grid  ! /waves/coherentwave(i)/fullwave/grid - Grid for storing the components of the wave field; Time-dependent
  type (type_e_components) :: e_components  ! /waves/coherentwave(i)/fullwave/e_components - E-field representation in terms of the parallel and circularly polarised components
  type (type_pol_decomp) :: pol_decomp  ! /waves/coherentwave(i)/fullwave/pol_decomp - TO BE REMOVED, being replaced by e_components and grid. Kept only to make smooth transition between 
  type (type_local) :: local  ! /waves/coherentwave(i)/fullwave/local - TO BE REMOVED, being replaced by e_components and grid. Kept only to make smooth transition between 
endtype
  
type type_beamtracing_mask  !    
  integer  :: npoints=0       ! /waves/coherentwave(i)/beamtracing(i)/npoints - Number of points along each ray/beam. Integer
  integer  :: power=0       ! /waves/coherentwave(i)/beamtracing(i)/power - Initial power in each ray/beam [W]. Float. Time-dependent
  integer  :: dnpar=0       ! /waves/coherentwave(i)/beamtracing(i)/dnpar - Spectral width in refractive index associated with each ray/beam, Vector (npoints). Time-dependent
  integer  :: length=0       ! /waves/coherentwave(i)/beamtracing(i)/length - Ray/beam curvilinear length [m], Vector (npoints). Time-dependent
  type (type_waves_rtposition_mask) :: position  ! /waves/coherentwave(i)/beamtracing(i)/position - Ray/beam position
  type (type_waves_rtwavevector_mask) :: wavevector  ! /waves/coherentwave(i)/beamtracing(i)/wavevector - Ray/beam wave vector.
  type (type_polarization_mask) :: polarization  ! /waves/coherentwave(i)/beamtracing(i)/polarization - Wave field polarization along the ray/beam.
  type (type_powerflow_mask) :: powerflow  ! /waves/coherentwave(i)/beamtracing(i)/powerflow - Power flow along the ray/beam.
endtype
  
type type_fullwave_mask  !    
  type (type_complexgrid_mask) :: grid  ! /waves/coherentwave(i)/fullwave/grid - Grid for storing the components of the wave field; Time-dependent
  type (type_e_components_mask) :: e_components  ! /waves/coherentwave(i)/fullwave/e_components - E-field representation in terms of the parallel and circularly polarised components
  type (type_pol_decomp_mask) :: pol_decomp  ! /waves/coherentwave(i)/fullwave/pol_decomp - TO BE REMOVED, being replaced by e_components and grid. Kept only to make smooth transition between 
  type (type_local_mask) :: local  ! /waves/coherentwave(i)/fullwave/local - TO BE REMOVED, being replaced by e_components and grid. Kept only to make smooth transition between 
endtype

  
type type_coherentwave  !    
  type (type_enum_instance) :: wave_id  ! /waves/coherentwave(i)/wave_id - List of identifiers for the coherent-wave, in terms of the type and name of the antenna driving the 
  type (type_composition) :: composition  ! /waves/coherentwave(i)/composition - 
  type (type_compositions_type) :: compositions  ! /waves/coherentwave(i)/compositions - Contains detailed information on the plasma composition (main ions, impurities, neutrals, edge speci
  type (type_waves_global_param) :: global_param  ! /waves/coherentwave(i)/global_param - Global wave deposition parameters
  type (type_waves_grid_1d) :: grid_1d  ! /waves/coherentwave(i)/grid_1d - Grid points for 1D profiles.
  type (type_waves_grid_2d) :: grid_2d  ! /waves/coherentwave(i)/grid_2d - Grid points for 2D profiles and for full wave solutions.
  type (type_waves_profiles_1d) :: profiles_1d  ! /waves/coherentwave(i)/profiles_1d - 1D radial profiles
  type (type_waves_profiles_2d) :: profiles_2d  ! /waves/coherentwave(i)/profiles_2d - 2D profiles in poloidal cross-section
  type (type_beamtracing),pointer :: beamtracing(:) => null()  ! /waves/coherentwave(i)/beamtracing(i) - Beam-tracing or ray-tracing solver. Vector(nbeams). Time-dependent
  type (type_fullwave) :: fullwave  ! /waves/coherentwave(i)/fullwave - Solution by full wave code
  type (type_codeparam) :: codeparam  ! /waves/coherentwave(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype
  
type type_coherentwave_mask  !    
  type (type_enum_instance_mask) :: wave_id  ! /waves/coherentwave(i)/wave_id - List of identifiers for the coherent-wave, in terms of the type and name of the antenna driving the 
  type (type_composition_mask) :: composition  ! /waves/coherentwave(i)/composition - 
  type (type_compositions_type_mask) :: compositions  ! /waves/coherentwave(i)/compositions - Contains detailed information on the plasma composition (main ions, impurities, neutrals, edge speci
  type (type_waves_global_param_mask) :: global_param  ! /waves/coherentwave(i)/global_param - Global wave deposition parameters
  type (type_waves_grid_1d_mask) :: grid_1d  ! /waves/coherentwave(i)/grid_1d - Grid points for 1D profiles.
  type (type_waves_grid_2d_mask) :: grid_2d  ! /waves/coherentwave(i)/grid_2d - Grid points for 2D profiles and for full wave solutions.
  type (type_waves_profiles_1d_mask) :: profiles_1d  ! /waves/coherentwave(i)/profiles_1d - 1D radial profiles
  type (type_waves_profiles_2d_mask) :: profiles_2d  ! /waves/coherentwave(i)/profiles_2d - 2D profiles in poloidal cross-section
  type (type_beamtracing_mask),pointer :: beamtracing(:) => null()  ! /waves/coherentwave(i)/beamtracing(i) - Beam-tracing or ray-tracing solver. Vector(nbeams). Time-dependent
  type (type_fullwave_mask) :: fullwave  ! /waves/coherentwave(i)/fullwave - Solution by full wave code
  type (type_codeparam_mask) :: codeparam  ! /waves/coherentwave(i)/codeparam - Code parameters of physics code, i.e. codes calculating a wave field.
endtype

  
type type_waves  !    
  type (type_datainfo) :: datainfo  ! /waves/datainfo - 
  type (type_coherentwave),pointer :: coherentwave(:) => null()  ! /waves/coherentwave(i) - Wave description for each frequency. Time-dependent. Structure array(nfreq)
  type (type_codeparam) :: codeparam  ! /waves/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /waves/time - Time [s]; Time-dependent; Scalar
endtype
  
type type_waves_mask  !    
  type (type_datainfo_mask) :: datainfo  ! /waves/datainfo - 
  type (type_coherentwave_mask),pointer :: coherentwave(:) => null()  ! /waves/coherentwave(i) - Wave description for each frequency. Time-dependent. Structure array(nfreq)
  type (type_codeparam_mask) :: codeparam  ! /waves/codeparam - Code parameters of datajoiners, i.e. codes that merge the wave field of two or more physics codes.
  integer  :: time=0       ! /waves/time - Time [s]; Time-dependent; Scalar
endtype

  
type type_mdinfo  !    
  integer  :: shot_min=-999999999       ! /top/topinfo/mdinfo/shot_min - Minimum shot number to which the machine description applies
  integer  :: shot_max=-999999999       ! /top/topinfo/mdinfo/shot_max - Maximum shot number to which the machine description applies
  type (type_entry_def) :: md_entry  ! /top/topinfo/mdinfo/md_entry - Entry of the machine description used. NB : just for information : for the moment, no guarantee that
endtype

  
type type_topinfo  !    
  character(len=132), dimension(:), pointer ::dataprovider => null()       ! /top/topinfo/dataprovider - Name of the main data provider (the person who filled the original data)
  character(len=132), dimension(:), pointer ::description => null()       ! /top/topinfo/description - Pulse/Entry description
  character(len=132), dimension(:), pointer ::firstputdate => null()       ! /top/topinfo/firstputdate - Date of the original data submission
  character(len=132), dimension(:), pointer ::lastupdate => null()       ! /top/topinfo/lastupdate - Date of the last data addition in the tree
  character(len=132), dimension(:), pointer ::source => null()       ! /top/topinfo/source - Exact reference of the data source (e.g. original reference in the native machine data base)
  character(len=132), dimension(:), pointer ::comment => null()       ! /top/topinfo/comment - Any additional comment
  character(len=132), dimension(:), pointer ::dataversion => null()       ! /top/topinfo/dataversion - Version of the data structure
  character(len=132), dimension(:), pointer ::workflow => null()       ! /top/topinfo/workflow - Workflow which has been used to produce the present entry. Exact format to be defined with the platf
  type (type_entry_def) :: entry  ! /top/topinfo/entry - Definition of this database entry
  type (type_entry_def) :: parent_entry  ! /top/topinfo/parent_entry - Definition of the entry of the direct parent (if any)
  type (type_mdinfo) :: mdinfo  ! /top/topinfo/mdinfo - Information related to machine description for this entry
endtype
 
type type_interfdiag  ! Special type CPO (lineintegraldiag) 
  type (type_datainfo) :: datainfo  ! /datainfo - 
  character(len=132), dimension(:), pointer ::expression => null()       ! /expression - Formal expression for the line integral to be evaluated as a function of ne, ni, Te, Ti, Zeff, Br, B
  type (type_setup_line) :: setup_line  ! /setup_line - Geometric description of the lines of sight
  type (type_exp1D) :: measure  ! /measure - Measured value. Time-dependent; Vector (nchords)
  type (type_codeparam) :: codeparam  ! /codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Time [s]; Time-dependent; Scalar
end type
 
type type_polardiag  ! Special type CPO (lineintegraldiag) 
  type (type_datainfo) :: datainfo  ! /datainfo - 
  character(len=132), dimension(:), pointer ::expression => null()       ! /expression - Formal expression for the line integral to be evaluated as a function of ne, ni, Te, Ti, Zeff, Br, B
  type (type_setup_line) :: setup_line  ! /setup_line - Geometric description of the lines of sight
  type (type_exp1D) :: measure  ! /measure - Measured value. Time-dependent; Vector (nchords)
  type (type_codeparam) :: codeparam  ! /codeparam - 
  real(EUITM_R8)  :: time=-9.0E40_EUITM_R8       ! /time - Time [s]; Time-dependent; Scalar
end type

end module

