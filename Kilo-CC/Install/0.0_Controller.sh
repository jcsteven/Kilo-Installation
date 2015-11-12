source comm.sh
source 2.1_BasicEnvironment_CC.sh
source 2.2_Create_Service_Database.sh
source 3.1_AddTheIdentifyservice.sh
source 3.2_CreateTheServiceEntityAndAPIEndpoint.sh
source 3.3_CreateProjectUsersAndRoles.sh
#source 3.4_VerifyOperatopnIdentity.sh
WaitForAnyKey "Please Verify--3.4_VerifyOperatopnIdentity.sh"
source 4.1_ToConfigurePrerequistesImage.sh
source 4.2_ToInstallAnddConfigureImageService.sh
#source 4.3_VerifyOperatopnImage.sh
WaitForAnyKey "Please Verify--4.3_VerifyOperatopnImage.sh"
source 5.1_ToConfigurePrerequistesCompute.sh
source 5.2_ToInstallAnddConfigureComputeService.sh
#source 5.3_VerifyOperatopnCompute.sh
WaitForAnyKey "Please Verify--5.3_VerifyOperatopnCompute.sh"
source 6.1_ToConfigurePrerequistesNetwork.sh
source 6.2_ToInstallAnddConfigureNetworkService.sh
WaitForAnyKey "Please Verify--6.3 and 6.4"
#source 6.3_VerifyOperatopnNetwork.sh
#source 6.4_.CreateInitialNetwork.sh
source 7.1_ToInstallAndConfigure_Dashboard_Service.sh
#source 8.1_ToConfigurePrerequistesBlockStorage.sh
#source 8.2_ToInstallAnddConfigureBlockStorageController.sh
#WaitForAnyKey "Please Verify--8.3"
#source 8.3_VerifyOperatopnBloackStorage.sh