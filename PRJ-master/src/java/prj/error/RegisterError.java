/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj.error;


public class RegisterError {
    private String fullName="";
    private String userName="";
    private String password="";
    private String phone="";
    private String email="";
    private String address="";
    
    public boolean check(String data, int min, int max){
        return (data.length()>= min) & (data.length()<=max);
    }
    
    public boolean checkUserName(String user, int min, int max){
        if(!check(user,min ,max)){
            userName="UserName must have length between "+ min +" and "+max;
            return false;
        }
        else {
            return true;
        }
    }
    
    public boolean checkPass(String pass, int min, int max){
        if(!check(pass,min,max)){
            password="Password must have length between "+min+" and "+max;
            return false;
        }
        return true;
    }
    
    public boolean checkPhone(String sdt, int min, int max){
        if(!check(sdt,min,max)){
            phone="Phone must have length between "+min+" and "+max;
            return false;
        }
        return true;
    }
    
    public boolean checkEmail(String mail, int min, int max){
        if(!check(mail,min,max)){
            email="Email must have length between "+min+" and "+max;
            return false;
        }
        return true;
    }
    
    public boolean checkAddress(String dc, int min, int max){
        if(!check(dc,min,max)){
            address="Address must have length between "+min+" and "+max;
            return false;
        }
        return true;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
}
