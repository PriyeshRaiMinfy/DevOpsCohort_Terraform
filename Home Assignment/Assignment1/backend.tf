terraform {
    backend "s3" {
        bucket  = "assignmet1-remote-backend"  
        key     = "priyeshterraform/state.tfstate"
        #folder inside bucket - where tfstate file will we saved
        region  = "ap-south-1"
        profile = "AdminAccess-611837361078"
        #sso profile
    }
}
