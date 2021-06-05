# passbox

A Ruby based minimalistic offline cli password manager using strong AES encryption.     

## Table of Contents   
- [1. Introduction](#introduction)   
- [2. Installation](#install)   
    - [2a. Homebrew](#brew)
    - [2b. Rubygems](#gem)
- [3. Usage](#usage)   
    - [3a. Initial Setup](#init)    
    - [3b. Add a new password](#add)    
    - [3c. Read an existing password](#read)   
    - [3d. Update an existing password](#update)  
    - [3e. Delete an existing account](#delete)   
    - [3f. List all available accounts](#list)
- [Contributing](#contributing)   
- [Issues](#issues)  
     
     
## <a name="introduction"></a> 1. Introduction    
Passbox is a Ruby based cli password manager which uses strong AES encryption and is completely offline.   

I had initially created this little password manager utility for my personal use and one fine day a few colleagues saw it, liked it and suggested to share it with them and here it is, so yeah, its pretty minimalistic but gets the job done and that too securely.   

If you feel you can improve passbox, feel free to drop in your suggestions or even better, fork it and start contributing.    
      
Note: I wouldn't say its uncrackable as nothing in the world is.
     
     
## <a name="install"></a> 2. Installation  
Passbox currently only supports Linux/MacOS based envvrionments.   
    
### <a name="brew"></a> 2a. Homebrew    
Easiest way to install on macos is using [Homebrew](https://brew.sh)     
```console
$ brew tap krupani/homebrew-formulae
$ brew install passbox
```    

### <a name="gem"></a> 2b. Rubygems   
If you have a working installation of ruby, passbox can be installed as a rubygem simply by using gem command.   
      
```console
$ gem install passbox 
```     
      
     
## <a name="usage"></a> 3. Usage    
As mentioned above, passbox is a cli based utility. Below are few basic functions which you can perform.     
      
### <a name="init"></a> 3a. Initial Setup
Before starting, you need to setup the passbox utility which will include creating a base directory and creating your master password.    
This can be easily done using the init command as follows:    
     
```console
$ passbox init 
```    

This will ask you create a master password, its recommended you create this one time master password really complex and more than 10 characters to make it really difficult to brute force.    
      
### <a name="add"></a> 3b. Add a new password      
Once passbox is setup, you can start adding password. It can be done using the create command which can be used as follows:     
     
```console
$ passbox add 
```     

This command will give you an option to chose the type of secret you want to add into passbox:     
- Login 
  - Username<sup>*</sup>      
  - Password<sup>*</sup>    
  - Url (optional)     
  - Note (optional)    
- Pin (Pin)
  - Pin<sup>*</sup>    
  - Note (optional)    
- Credit / Debit Card
  - Card Number<sup>*</sup>    
  - Card Expiry<sup>*</sup>    
  - Card CVV<sup>*</sup>    
  - Card Pin (optional)     
  - Note (optional)    

After chosing an option above, the utility will ask you 2 questions:
- to enter you account name for which you want to view the password.     
- to enter you master password for authentication purposes. 
     
### <a name="read"></a> 3c. Read an existing password     
Once you have saved your password, you can view them as and when needed, authenticating using your master password and entering your account name of the password you want to view, as follows :     
       
```console
$ passbox read 
```    
     
This command will ask you 2 questions:
- to enter you account name for which you want to view the password.     
- to enter you master password for authentication purposes.    
     
### <a name="update"></a> 3d. Update an existing password     
You can update your account details (username and password) when needed, authenticating using your master password and entering your account name you need to update :     
       
```console
$ passbox update 
```    
     
This command will first ask you 2 questions:   
- First to enter you account name for which you want to update the password.     
- Next, to enter you master password for authentication purposes.    
   
Then depending the account type, appropriate fields will be asked to be filled. If you wish to not change the exisitng value, just hit enter and move onto next field or enter a new value to update the field to new value.    
     
### <a name="delete"></a> 3e. Delete an existing account
You can delete an existing account, if you do not need it anymore. It can be done using the delete command and does not require any kind of authentication.     
     
```console
$ passbox delete 
```   
    
This command will first ask you 2 questions:   
- First to enter you account name which you want to delete.      
- Next, to enter you master password for authentication purposes.      

### <a name="list"></a> 3f. List all available accounts   
You can list all accounts you have using the following command without any authentication required.    
    
```console
$ passbox list 
```    
    
## <a name="contributing"></a> 4. Contributing    
Ideas and suggestions are always always most welcome. Please fork this code and feel free to add any updates, suggestions etc and create a pull request.   

## <a name="issues"></a> 5. Issues    
If you face any problem related to syntax, usability, documentation then please raise an [issue](https://github.com/krupani/passbox/issues) . Please note to add details of the issue you are facing.    