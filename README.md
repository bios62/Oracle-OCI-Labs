# Oracle-OCI-Labs
Collection of Hands On Labs for Oracle OCI Cloud

The repository contains files for completing a serioes of Hands On Labs for Oracle Cloud Infrastrucutre OCI.

It is recommended that you read the OCI_initialSetup lab first. This lab adds a few gothcas on the logon process.

For FN project, jump to note 11 below.

The Following labs are available:

    1) Allocate free trial. 
    Files included in lab: trial.pdf
    
    2) Initial setup. logon to the console with oracle IDCS, and navigate to the Oracle Cloud Infrastructure Dashboard.
    Files included in the lab: OCI_InitialSetup_V2.pdf
    
    3) Oracle VCN Labs, create your first virtual Cloud Network across 3 Availability Domains. 
    Files included in the lab: OCI_VCN_V2.pdf
    
    4) Oracle Linux VM lab, create a linux VM that is prepafed to later install Oracle 12c software. The lab configures 
    the VM for tunnelling VNC and firefox over SSH for a full UI for the VM. 
    Files included in lab: OCI_linux_vm_V2.pdf, oel_oci_setup.sh 
    The script oel_oci_setup.sh covers all commands in the lab document OCI_linux_vm_V2.pdf.
        
    5) Oracle OCI Load balancer lab. This lab creates a service deployed on two Linux inctances in two availability 
    domains, and cofigures the loadbalance service in front ot the services. 
    Files included in the lab: OCI_Load_Balancer_Service v2.pdf
    
    6) Terraform lab, create a OCI infrastrutcure with several compute instances with Hashicorp Terraform. 
    Files included in lab: OCI_Terraform_V2.pdf and OCI_Terraform_V2.tar.gz
    
    7) Removal of password expiry for compuute instances and recovery if password on an instance has expired. 
    Files included in lab: OCI_OEL_Password_lock_V2.pdf, OCI_oel_recover_from_pwd_rotation.sh, 
    OCI_oel_remove_pwd_rotation.sh. 
    The scripts OCI_oel_recover_from_pwd_rotation.sh and OCI_oel_remove_pwd_rotation.sh covers all commands in 
    the lab document.
    
    8) Initial creation of database cloud service, Oracle DBCS, OCI_DatabaseCloudServicebasics_V2.pdf
    
    9) For benchmarking of the DBCS and local envrionment, we have created the performance labs, OCI_Loadtest_V2, with the load_test_package.zip, script colelction required to do the performance test.
    10) The last lab is on how to establich conectivity bewteen on-prem and cloud over port 1521 in a secure manner. Please review  OCI_OpenPort1521_V1.pdf. This is a premliminary lab and will be extended
    
    11) For the FN, functions lab, please review OCI_Function_lab_V2.pdf, and http://fnproject.io/tutorials/ Cloud envrinments for instructor led session is provides in the zip file envs.zip
    
