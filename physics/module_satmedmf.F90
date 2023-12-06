! #########################################################################################
!>  \file module_satmedmf.F90
!! This file contains default real(kind_phys)s for the Scale-Aware mass flux Convection scheme.
!!
!! These real(kind_phys)s can be overwritten by the host by calling ty_cfg_satmedmf%setup().
!!
! #########################################################################################
module module_satmedmf
  use machine, only : kind_phys
  implicit none

  public ty_cfg_satmedmf,ty_cfg_satmedmfq

! #########################################################################################
!! \section arg_table_ty_cfg_satmedmf Argument Table
!! \htmlinclude ty_cfg_satmedmf.html
!!
! ######################################################################################### 
  type ty_cfg_satmedmf
     ! Scheme parameters (default)
     real(kind_phys) :: wfac     = 7.0
     real(kind_phys) :: cfac     = 4.5
     real(kind_phys) :: gamcrt   = 3.
     real(kind_phys) :: gamcrq   = 0.
     real(kind_phys) :: sfcfrac  = 0.1
     real(kind_phys) :: vk       = 0.4
     real(kind_phys) :: rimin    = -100.
     real(kind_phys) :: rbcr     = 0.25
     real(kind_phys) :: zolcru   = -0.02
     real(kind_phys) :: tdzmin   = 1.e-3
     real(kind_phys) :: rlmn     = 30.
     real(kind_phys) :: rlmx     = 500.
     real(kind_phys) :: elmx     = 500.
     real(kind_phys) :: prmin    = 0.25
     real(kind_phys) :: prmax    = 4.0
     real(kind_phys) :: pr0      = 1.0
     real(kind_phys) :: prtke    = 1.0
     real(kind_phys) :: prscu    = 0.67
     real(kind_phys) :: f0       = 1.e-4
     real(kind_phys) :: crbmin   = 0.15
     real(kind_phys) :: crbmax   = 0.35
     real(kind_phys) :: tkmin    = 1.e-9
     real(kind_phys) :: dspmax   = 10.0
     real(kind_phys) :: dspfac   = 0.5
     real(kind_phys) :: qmin     = 1.e-8
     real(kind_phys) :: qlmin    = 1.e-12
     real(kind_phys) :: zfmin    = 1.e-8
     real(kind_phys) :: aphi5    = 5.
     real(kind_phys) :: aphi16   = 16.
     real(kind_phys) :: elmfac   = 1.0
     real(kind_phys) :: elefac   = 1.0
     real(kind_phys) :: cql      = 100.
     real(kind_phys) :: dw2min   = 1.e-4
     real(kind_phys) :: dkmax    = 1000.
     real(kind_phys) :: xkgdx    = 25000.
     real(kind_phys) :: qlcr     = 3.5e-5
     real(kind_phys) :: zstblmax = 2500.
     real(kind_phys) :: xkzinv   = 0.15
     real(kind_phys) :: h1       = 0.33333333
     real(kind_phys) :: ck0      = 0.4
     real(kind_phys) :: ch0      = 0.4
     real(kind_phys) :: ck1      = 0.15
     real(kind_phys) :: ch1      = 0.15
     real(kind_phys) :: ce0      = 0.4
     real(kind_phys) :: rchck    = 1.5
     real(kind_phys) :: cdtn     = 25
   contains
     procedure, public :: setup => setup_satmedmf
  end type ty_cfg_satmedmf

! #########################################################################################
!! \section arg_table_ty_cfg_satmedmfq Argument Table
!! \htmlinclude ty_cfg_satmedmfq.html
!!
! #########################################################################################
  type ty_cfg_satmedmfq
     ! Scheme parameters (default)
     real(kind_phys) :: bfac     = 100.
     real(kind_phys) :: wfac     = 7.0
     real(kind_phys) :: cfac     = 4.5
     real(kind_phys) :: gamcrt   = 3.
     real(kind_phys) :: gamcrq   = 0.
     real(kind_phys) :: sfcfrac  = 0.1
     real(kind_phys) :: vk       = 0.4
     real(kind_phys) :: rimin    = -100.
     real(kind_phys) :: slfac    = 0.1
     real(kind_phys) :: rbcr     = 0.25
     real(kind_phys) :: zolcru   = -0.02
     real(kind_phys) :: tdzmin   = 1.e-3
     real(kind_phys) :: rlmn     = 30.
     real(kind_phys) :: rlmn0    = 5.
     real(kind_phys) :: rlmn1    = 5.
     real(kind_phys) :: rlmn2    = 10.
     real(kind_phys) :: prmin    = 0.25
     real(kind_phys) :: prmax    = 4.0
     real(kind_phys) :: pr0      = 1.0
     real(kind_phys) :: prtke    = 1.0
     real(kind_phys) :: prscu    = 0.67
     real(kind_phys) :: f0       = 1.e-4
     real(kind_phys) :: crbmin   = 0.15
     real(kind_phys) :: crbmax   = 0.35
     real(kind_phys) :: tkmin    = 1.e-9
     real(kind_phys) :: tkbmx    = 0.2
     real(kind_phys) :: dspmax   = 10.0
     real(kind_phys) :: qmin     = 1.e-8
     real(kind_phys) :: qlmin    = 1.e-12
     real(kind_phys) :: zfmin    = 1.e-8
     real(kind_phys) :: aphi5    = 5.
     real(kind_phys) :: aphi16   = 16.
     real(kind_phys) :: elmfac   = 1.0
     real(kind_phys) :: elefac   = 1.0
     real(kind_phys) :: cql      = 100.
     real(kind_phys) :: dw2min   = 1.e-4
     real(kind_phys) :: dkmax    = 1000.
     real(kind_phys) :: xkgdx    = 1000.
     real(kind_phys) :: qlcr     = 3.5e-5
     real(kind_phys) :: zstblmax = 2500.
     real(kind_phys) :: xkinv1   = 0.15
     real(kind_phys) :: xkinv2   = 0.3
     real(kind_phys) :: h1       = 0.33333333
     real(kind_phys) :: hcrinv   = 250.
     real(kind_phys) :: vegflo   = 0.1
     real(kind_phys) :: vegfup   = 1.0
     real(kind_phys) :: z0lo     = 0.1
     real(kind_phys) :: z0up     = 1.0
     real(kind_phys) :: vc0      = 1.0
     real(kind_phys) :: zc0      = 1.0
     real(kind_phys) :: ck1      = 0.15
     real(kind_phys) :: ch1      = 0.15
     real(kind_phys) :: cs0      = 0.4
     real(kind_phys) :: csmf     = 0.5
     real(kind_phys) :: rchck    = 1.5
     real(kind_phys) :: ndt      = 20
     real(kind_phys) :: ck0      = 0.4
     real(kind_phys) :: ch0      = 0.4
     real(kind_phys) :: ce0      = 0.4
   contains
     procedure, public :: setup => setup_satmedmfq
  end type ty_cfg_satmedmfq

contains
  ! #########################################################################################
  ! Procedure (type-bound) to setup parameters needed by scheme.
  ! #########################################################################################
  subroutine setup_satmedmf(this,wfac,cfac,gamcrt,gamcrq,sfcfrac,vk,rimin,rbcr,zolcru,      &
       tdzmin,rlmn,rlmx,elmx,prmin,prmax,pr0,prtke,prscu,f0,crbmin,crbmax,tkmin,dspmax,     &
       dspfac,qmin,qlmin,zfmin,aphi5,aphi16,elmfac,elefac,cql,dw2min,dkmax,xkgdx,qlcr,      &
       zstblmax,xkzinv,h1,ck0,ch0,ck1,ch1,ce0,rchck,cdtn)
    !
    class(ty_cfg_satmedmf), intent(inout) :: this
    real(kind_phys),intent(in),optional :: wfac,cfac,gamcrt,gamcrq,sfcfrac,vk,rimin,rbcr,   &
         zolcru,tdzmin,rlmn,rlmx,elmx,prmin,prmax,pr0,prtke,prscu,f0,crbmin,crbmax,tkmin,   &
         dspmax,dspfac,qmin,qlmin,zfmin,aphi5,aphi16,elmfac,elefac,cql,dw2min,dkmax,xkgdx,  &
         qlcr,zstblmax,xkzinv,h1,rchck,ck0,ch0,ck1,ch1,ce0,cdtn

    ! If provided, override default values for parameters
    if (present(wfac    )) this%wfac     = wfac
    if (present(cfac    )) this%cfac     = cfac
    if (present(gamcrt  )) this%gamcrt   = gamcrt
    if (present(gamcrq  )) this%gamcrq   = gamcrq
    if (present(sfcfrac )) this%sfcfrac  = sfcfrac
    if (present(vk      )) this%vk       = vk
    if (present(rimin   )) this%rimin    = rimin
    if (present(rbcr    )) this%rbcr     = rbcr
    if (present(zolcru  )) this%zolcru   = zolcru
    if (present(tdzmin  )) this%tdzmin   = tdzmin
    if (present(rlmn    )) this%rlmn     = rlmn
    if (present(rlmx    )) this%rlmx     = rlmx
    if (present(elmx    )) this%elmx     = elmx
    if (present(prmin   )) this%prmin    = prmin
    if (present(prmax   )) this%prmax    = prmax
    if (present(pr0     )) this%pr0      = pr0
    if (present(prtke   )) this%prtke    = prtke
    if (present(prscu   )) this%prscu    = prscu
    if (present(f0      )) this%f0       = f0
    if (present(crbmin  )) this%crbmin   = crbmin
    if (present(crbmax  )) this%crbmax   = crbmax
    if (present(tkmin   )) this%tkmin    = tkmin
    if (present(dspmax  )) this%dspmax   = dspmax
    if (present(dspfac  )) this%dspfac   = dspfac
    if (present(qmin    )) this%qmin     = qmin
    if (present(qlmin   )) this%qlmin    = qlmin
    if (present(zfmin   )) this%zfmin    = zfmin
    if (present(aphi5   )) this%aphi5    = aphi5
    if (present(aphi16  )) this%aphi16   = aphi16
    if (present(elmfac  )) this%elmfac   = elmfac
    if (present(elefac  )) this%elefac   = elefac
    if (present(cql     )) this%cql      = cql
    if (present(dw2min  )) this%dw2min   = dw2min
    if (present(dkmax   )) this%dkmax    = dkmax
    if (present(xkgdx   )) this%xkgdx    = xkgdx
    if (present(qlcr    )) this%qlcr     = qlcr
    if (present(zstblmax)) this%zstblmax = zstblmax
    if (present(xkzinv  )) this%xkzinv   = xkzinv
    if (present(h1      )) this%h1       = h1
    if (present(ck0     )) this%ck0      = ck0
    if (present(ch0     )) this%ch0      = ch0
    if (present(ck1     )) this%ck1      = ck1
    if (present(ch1     )) this%ch1      = ch1
    if (present(ce0     )) this%ce0      = ce0
    if (present(rchck   )) this%rchck    = rchck
    if (present(cdtn    )) this%cdtn     = cdtn
    !
  end subroutine setup_satmedmf

  ! #########################################################################################
  ! Procedure (type-bound) to setup parameters needed by scheme.
  ! #########################################################################################
  subroutine setup_satmedmfq(this,bfac,wfac,cfac,gamcrt,gamcrq,sfcfrac,vk,rimin,slfac,rbcr, &
       zolcru,tdzmin,rlmn,rlmn0,rlmn1,rlmn2,prmin,prmax,pr0,prtke,prscu,f0,crbmin,crbmax,   &
       tkmin,tkbmx,dspmax,qmin,qlmin,zfmin,aphi5,aphi16,elmfac,elefac,cql,dw2min,dkmax,     &
       xkgdx,qlcr,zstblmax,xkinv1,xkinv2,h1,hcrinv,vegflo,vegfup,z0lo,z0up,vc0,zc0,ck1,ch1, &
       cs0,ck0,ch0,ce0,csmf,rchck,ndt)
    !
    class(ty_cfg_satmedmfq), intent(inout) :: this
    real(kind_phys),intent(in),optional :: bfac,wfac,cfac,gamcrt,gamcrq,sfcfrac,vk,rimin,   &
         slfac,rbcr,zolcru,tdzmin,rlmn,rlmn0,rlmn1,rlmn2,prmin,prmax,pr0,prtke,prscu,f0,    &
         crbmin,crbmax,tkmin,tkbmx,dspmax,qmin,qlmin,zfmin,aphi5,aphi16,elmfac,elefac,cql,  &
         dw2min,dkmax,xkgdx,qlcr,zstblmax,xkinv1,xkinv2,h1,hcrinv,vegflo,vegfup,z0lo,z0up,  &
         vc0,zc0,ck1,ch1,cs0,ck0,ch0,ce0,csmf,rchck,ndt

    ! If provided, override default values for parameters
    if (present(bfac))     this%bfac     = bfac
    if (present(wfac))     this%wfac     = wfac
    if (present(cfac))     this%cfac     = cfac
    if (present(gamcrt))   this%gamcrt   = gamcrt
    if (present(gamcrq))   this%gamcrq   = gamcrq
    if (present(sfcfrac))  this%sfcfrac  = sfcfrac
    if (present(vk))       this%vk       = vk
    if (present(rimin))    this%rimin    = rimin
    if (present(slfac))    this%slfac    = slfac
    if (present(rbcr))     this%rbcr     = rbcr
    if (present(zolcru))   this%zolcru   = zolcru
    if (present(tdzmin))   this%tdzmin   = tdzmin
    if (present(rlmn))     this%rlmn     = rlmn
    if (present(rlmn0))    this%rlmn0    = rlmn0
    if (present(rlmn1))    this%rlmn1    = rlmn1
    if (present(rlmn2))    this%rlmn2    = rlmn2
    if (present(prmin))    this%prmin    = prmin
    if (present(prmax))    this%prmax    = prmax
    if (present(pr0))      this%pr0      = pr0
    if (present(prtke))    this%prtke    = prtke
    if (present(prscu))    this%prscu    = prscu
    if (present(f0))       this%f0       = f0
    if (present(crbmin))   this%crbmin   = crbmin
    if (present(crbmax))   this%crbmax   = crbmax
    if (present(tkmin))    this%tkmin    = tkmin
    if (present(tkbmx))    this%tkbmx    = tkbmx
    if (present(dspmax))   this%dspmax   = dspmax
    if (present(qmin))     this%qmin     = qmin
    if (present(qlmin))    this%qlmin    = qlmin
    if (present(zfmin))    this%zfmin    = zfmin
    if (present(aphi5))    this%aphi5    = aphi5
    if (present(aphi16))   this%aphi16   = aphi16
    if (present(elmfac))   this%elmfac   = elmfac
    if (present(elefac))   this%elefac   = elefac
    if (present(cql))      this%cql      = cql
    if (present(dw2min))   this%dw2min   = dw2min
    if (present(dkmax))    this%dkmax    = dkmax
    if (present(xkgdx))    this%xkgdx    = xkgdx
    if (present(qlcr))     this%qlcr     = qlcr
    if (present(zstblmax)) this%zstblmax = zstblmax
    if (present(xkinv1))   this%xkinv1   = xkinv1
    if (present(xkinv2))   this%xkinv2   = xkinv2
    if (present(h1))       this%h1       = h1
    if (present(hcrinv))   this%hcrinv   = hcrinv
    if (present(vegflo))   this%vegflo   = vegflo
    if (present(vegfup))   this%vegfup   = vegfup
    if (present(z0lo))     this%z0lo     = z0lo
    if (present(z0up))     this%z0up     = z0up
    if (present(vc0))      this%vc0      = vc0
    if (present(zc0))      this%zc0      = zc0
    if (present(ck1))      this%ck1      = ck1
    if (present(ch1))      this%ch1      = ch1
    if (present(cs0))      this%cs0      = cs0
    if (present(ck0))      this%ck0      = ck0
    if (present(ch0))      this%ch0      = ch0
    if (present(ce0))      this%ce0      = ce0
    if (present(csmf))     this%csmf     = csmf
    if (present(rchck))    this%rchck    = rchck
    if (present(ndt))      this%ndt      = ndt
    !
  end subroutine setup_satmedmfq
  !
end module module_satmedmf
