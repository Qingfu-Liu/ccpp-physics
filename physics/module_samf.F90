! #########################################################################################
!>  \file module_samf.F90
!! This file contains default parameters for the Scale-Aware mass flux Convection scheme.
!!
!! These parameters can be overwritten by the host by calling ty_cfg_samf%setup().
!!
! #########################################################################################
module module_samf
  use machine, only : kind_phys
  implicit none

  public ty_cfg_samf_shal, ty_cfg_samf_deep

! #########################################################################################
!! \section arg_table_ty_cfg_samf_shal Argument Table
!! \htmlinclude ty_cfg_samf_shal.html
!!
! ######################################################################################### 
  type ty_cfg_samf_shal
     ! Scheme parameters (default)
     real(kind_phys) :: d0       = 0.001 ! From han_et_al_2017 equation 8
     real(kind_phys) :: cm       = 1.0   ! Enhancement factor in entrainment rates for momentum
     real(kind_phys) :: cq       = 1.0   !
     real(kind_phys) :: clamd    = 0.1   !
     real(kind_phys) :: tkemx    = 0.65  ! Maximum value for turbulent kinetic energy (TKE).
     real(kind_phys) :: tkemn    = 0.05  ! Minimum value for turbulent kinetic energy (TKE).
     real(kind_phys) :: cthk     = 200.  ! Maximum cloud depth for shallow convection.
     real(kind_phys) :: cthkmn   = 0.    ! Minimum cloud depth for shallow convection.
     real(kind_phys) :: dthk     = 25.   ! With entrainment, recalculate the LFC as the first level 
                                         ! where buoyancy is positive. The difference in pressure 
                                         ! levels between LFCs calculated with/without entrainment
                                         ! must be less than a threshold (dthk), in hPa.
     real(kind_phys) :: sfclfac  = 0.2   !
     real(kind_phys) :: rhcrt    = 0.75  ! Minimum mean relative humidity in the subcloud layers 
                                         ! for convection to be triggered.
     real(kind_phys) :: cinpcrmx = 180.  ! Maximum pressure depth between parcel source level
                                         ! for convection to be triggered.
     real(kind_phys) :: cinpcrmn = 120.  ! Minimum pressure depth between parcel source level 
                                         ! for convection to be triggered.
     real(kind_phys) :: cinacrmx = -120  ! Minimum CIN for convection to be triggered.
     real(kind_phys) :: shevf    = 2.0   ! Enhancement factor for evaporation.
     real(kind_phys) :: dtmax    = 10800 ! Maximum timestep
     real(kind_phys) :: dtmin    = 600   ! Minimum timestep
     real(kind_phys) :: bb1      = 4.0   ! From han_et_al_2017 equation 7
     real(kind_phys) :: bb2      = 0.8   ! From han_et_al_2017 equation 7
     real(kind_phys) :: csmf     = 0.2   ! Parameter for updraft velocity calculation.
     real(kind_phys) :: tkcrt    = 2.    !
     real(kind_phys) :: cmxfac   = 15.   !
     real(kind_phys) :: betaw    = .03   ! From han_et_al_2017 equation 6
     real(kind_phys) :: dxcrtc0  = 9.e3  ! Parameter for scale-aware rain conversion calculation.
     real(kind_phys) :: escav    = 0.8   !
     real(kind_phys) :: tf       = 233.16!
     real(kind_phys) :: tcr      = 263.16!
     real(kind_phys) :: dxcrtas  = 30.e3 !
     real(kind_phys) :: sigmind  = 0.01  ! progsigma: Minimum area-fraction for deep clouds
     real(kind_phys) :: sigmins  = 0.03  ! progsigma: Minimum area-fraction for shallow clouds
     real(kind_phys) :: sigminm  = 0.01  ! progsigma: Minimum area-fraction for mid-level clouds
     ! Derived scheme parameters
     real(kind_phys) :: tcrf             !
     real(kind_phys) :: dtke             ! Valid range for TKE
     real(kind_phys) :: cinacrmn         ! Set by host (NOTE. No default value is provided!!!!)
   contains
     procedure, public :: setup => setup_param_shal
  end type ty_cfg_samf_shal

! #########################################################################################
!! \section arg_table_ty_cfg_samf_deep Argument Table
!! \htmlinclude ty_cfg_samf_deep.html
!!
! #########################################################################################
  type ty_cfg_samf_deep
     ! Scheme parameters (default)
     real(kind_phys) :: d0       = 0.001 ! From han_et_al_2017 equation 8
     real(kind_phys) :: cm       = 1.0   ! Enhancement factor in entrainment rates for momentum
     real(kind_phys) :: cq       = 1.0   !
     real(kind_phys) :: clamd    = 0.03  !
     real(kind_phys) :: tkemx    = 0.65  ! Maximum value for turbulent kinetic energy (TKE).
     real(kind_phys) :: tkemn    = 0.05  ! Minimum value for turbulent kinetic energy (TKE).
     real(kind_phys) :: clamca   = 0.03  !
     real(kind_phys) :: cthk     = 200.  ! Maximum cloud depth for deep convection.
     real(kind_phys) :: dthk     = 25.   ! With entrainment, recalculate the LFC as the first level
                                         ! where buoyancy is positive. The difference in pressure
                                         ! levels between LFCs calculated with/without entrainment
                                         ! must be less than a threshold (dthk), in hPa.
     real(kind_phys) :: sfclfac  = 0.2   !
     real(kind_phys) :: rhcrt    = 0.75  ! Minimum mean relative humidity in the subcloud layers
                                         ! for convection to be triggered.
     real(kind_phys) :: cinpcrmx = 180.  ! Maximum pressure depth between parcel source level
                                         ! for convection to be triggered.
     real(kind_phys) :: cinpcrmn = 120.  ! Minimum pressure depth between parcel source level
                                         ! for convection to be triggered.
     real(kind_phys) :: cinacrmx = -120  ! Minimum CIN for convection to be triggered.
     real(kind_phys) :: cinacrmn = -80   ! Maximum CIN for convection to be triggered.
     real(kind_phys) :: bb1      = 4.0   ! From han_et_al_2017 equation 7
     real(kind_phys) :: bb2      = 0.8   ! From han_et_al_2017 equation 7 
     real(kind_phys) :: csmf     = 0.2   ! Parameter for updraft velocity calculation.
     real(kind_phys) :: tkcrt    = 2.    !
     real(kind_phys) :: cmxfac   = 15.   !
     real(kind_phys) :: betaw    = .03   ! From han_et_al_2017 equation 6
     ! Derived scheme parameters
     real(kind_phys) :: dtke             ! Valid range for TKE
   contains
     procedure, public :: setup => setup_param_deep
  end type ty_cfg_samf_deep
contains
  ! #########################################################################################
  ! Procedure (type-bound) to setup parameters needed by scheme.
  ! #########################################################################################
  subroutine setup_param_shal(this,d0,cm,cq,clamd,tkemx,tkemn,cthk,cthkmn,dthk,sfclfac,     &
       rhcrt,cinpcrmx,cinpcrmn,cinacrmx,cinacrmn,shevf,dtmax,dtmin,bb1,bb2,csmf,tkcrt,      &
       cmxfac,betaw,dxcrtc0,h1,dxcrtas,sigmind,sigmins,sigminm,escav,tf,tcr)
    !
    class(ty_cfg_samf_shal), intent(inout) :: this
    real(kind_phys), intent(in), optional :: d0,cm,cq,clamd,tkemx,tkemn,cthk,cthkmn,dthk,   &
         sfclfac,rhcrt,cinpcrmx,cinpcrmn,cinacrmx,cinacrmn,shevf,dtmax,dtmin,bb1,bb2,csmf,  &
         tkcrt,cmxfac,betaw,dxcrtc0,h1,dxcrtas,sigmind,sigmins,sigminm,escav,tf,tcr

    ! If provided, override default values for parameters
    if (present(d0      )) this%d0       = d0
    if (present(cm      )) this%cm       = cm
    if (present(cq      )) this%cq       = cq
    if (present(clamd   )) this%clamd    = clamd
    if (present(tkemx   )) this%tkemx    = tkemx
    if (present(tkemn   )) this%tkemn    = tkemn
    if (present(cthk    )) this%cthk     = cthk
    if (present(cthkmn  )) this%cthkmn   = cthkmn
    if (present(dthk    )) this%dthk     = dthk
    if (present(sfclfac )) this%sfclfac  = sfclfac
    if (present(rhcrt   )) this%rhcrt    = rhcrt
    if (present(cinpcrmx)) this%cinpcrmx = cinpcrmx
    if (present(cinpcrmn)) this%cinpcrmn = cinpcrmn
    if (present(cinacrmx)) this%cinacrmx = cinacrmx
    if (present(cinacrmn)) this%cinacrmn = cinacrmn
    if (present(shevf   )) this%shevf    = shevf
    if (present(dtmax   )) this%dtmax    = dtmax
    if (present(dtmin   )) this%dtmin    = dtmin
    if (present(bb1     )) this%bb1      = bb1
    if (present(bb2     )) this%bb2      = bb2
    if (present(csmf    )) this%csmf     = csmf
    if (present(tkcrt   )) this%tkcrt    = tkcrt
    if (present(cmxfac  )) this%cmxfac   = cmxfac
    if (present(betaw   )) this%betaw    = betaw
    if (present(dxcrtc0 )) this%dxcrtc0  = dxcrtc0
    if (present(dxcrtas )) this%dxcrtas  = dxcrtas
    if (present(sigmind )) this%sigmind  = sigmind
    if (present(sigmins )) this%sigmins  = sigmins
    if (present(sigminm )) this%sigminm  = sigminm
    if (present(escav   )) this%escav    = escav
    if (present(tf      )) this%tf       = tf
    if (present(tcr     )) this%tcr      = tcr

    ! Compute derived parameters
    this%tcrf = 1._kind_phys/(this%tcr-this%tf)
    this%dtke = this%tkemx-this%tkemn
    
  end subroutine setup_param_shal

  ! #########################################################################################
  ! Procedure (type-bound) to setup parameters needed by scheme.
  ! #########################################################################################
  subroutine setup_param_deep(this,d0,cm,cq,clamd,tkemx,tkemn,clamca,cthk,dthk,sfclfac,     &
       rhcrt,cinpcrmx,cinpcrmn,cinacrmx,cinacrmn,bb1,bb2,csmf,tkcrt,cmxfac,betaw)
    !
    class(ty_cfg_samf_deep), intent(inout) :: this
    real(kind_phys), intent(in), optional :: d0,cm,cq,clamd,tkemx,tkemn,clamca,cthk,dthk,   &
         sfclfac,rhcrt,cinpcrmx,cinpcrmn,cinacrmx,cinacrmn,bb1,bb2,csmf,tkcrt,cmxfac,betaw

    ! If provided, override default values for parameters
    if (present(d0      )) this%d0       = d0
    if (present(cm      )) this%cm       = cm
    if (present(cq      )) this%cq       = cq
    if (present(clamd   )) this%clamd    = clamd
    if (present(tkemx   )) this%tkemx    = tkemx
    if (present(tkemn   )) this%tkemn    = tkemn
    if (present(cthk    )) this%cthk     = cthk
    if (present(dthk    )) this%dthk     = dthk
    if (present(sfclfac )) this%sfclfac  = sfclfac
    if (present(rhcrt   )) this%rhcrt    = rhcrt
    if (present(cinpcrmx)) this%cinpcrmx = cinpcrmx
    if (present(cinpcrmn)) this%cinpcrmn = cinpcrmn
    if (present(cinacrmx)) this%cinacrmx = cinacrmx
    if (present(cinacrmn)) this%cinacrmn = cinacrmn
    if (present(bb1     )) this%bb1      = bb1
    if (present(bb2     )) this%bb2      = bb2
    if (present(csmf    )) this%csmf     = csmf
    if (present(tkcrt   )) this%tkcrt    = tkcrt
    if (present(cmxfac  )) this%cmxfac   = cmxfac
    if (present(betaw   )) this%betaw    = betaw

    ! Compute derived parameters
    this%dtke = this%tkemx-this%tkemn

  end subroutine setup_param_deep
  !
end module module_samf
