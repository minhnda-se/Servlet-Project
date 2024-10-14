/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamestore.dto;

import gamestore.dao.UserDAO;
import java.sql.SQLException;

/**
 *
 * @author LENOVO
 */
public class ValidData {

    private boolean userNameLengthError;
    private boolean passwordlengthError;
    private boolean notMatchhError;
    private boolean passwordFormatError;
    private boolean phoneNumberLengthError;
    private boolean phoneNumberFormatError;
    private boolean isUserNameExisted;
    private boolean isEmailExisted;

    public boolean isUserNameLengthError() {
        return userNameLengthError;
    }

    public void setUserNameLengthError(boolean userNameLengthError) {
        this.userNameLengthError = userNameLengthError;
    }

    public boolean isPasswordlengthError() {
        return passwordlengthError;
    }

    public void setPasswordlengthError(boolean passwordlengthError) {
        this.passwordlengthError = passwordlengthError;
    }

    public boolean isNotMatchhError() {
        return notMatchhError;
    }

    public void setNotMatchhError(boolean notMatchhError) {
        this.notMatchhError = notMatchhError;
    }

    public boolean isPasswordFormatError() {
        return passwordFormatError;
    }

    public void setPasswordFormatError(boolean passwordFormatError) {
        this.passwordFormatError = passwordFormatError;
    }

    public boolean isIsUserNameExisted() {
        return isUserNameExisted;
    }

    public void setIsUserNameExisted(boolean isUserNameExisted) {
        this.isUserNameExisted = isUserNameExisted;
    }

    public boolean isIsEmailExisted() {
        return isEmailExisted;
    }

    public void setIsEmailExisted(boolean isEmailExisted) {
        this.isEmailExisted = isEmailExisted;
    }

    public boolean isPhoneNumberLengthError() {
        return phoneNumberLengthError;
    }

    public void setPhoneNumberLengthError(boolean phoneNumberLengthError) {
        this.phoneNumberLengthError = phoneNumberLengthError;
    }

    public boolean isPhoneNumberFormatError() {
        return phoneNumberFormatError;
    }

    public void setPhoneNumberFormatError(boolean phoneNumberFormatError) {
        this.phoneNumberFormatError = phoneNumberFormatError;
    }

    public boolean checkUserNameLength(String userName) {
        int length = userName.trim().length();
        userNameLengthError = length < 4 | length > 20;
        return userNameLengthError;
    }

    public boolean checkPasswordLength(String password) {
        int length = password.trim().length();
        passwordFormatError = length < 6;
        return passwordlengthError;
    }

    public boolean checkPhoneNumberFormat(String phoneNumber) {
        String regex = "^\\d{10}$";
        boolean phoneNumberFormatError = !phoneNumber.matches(regex);
        return phoneNumberFormatError;
    }
public boolean checkConfirm(String password, String confirm) {
        notMatchhError = !password.trim().equals(confirm);
        return notMatchhError;
    }

    public boolean checkPasswordFormat(String password) {
        boolean hasNumber = password.matches(".*\\d.*");
        boolean hasLowerCase = password.matches(".*[a-z].*");
        boolean hasUpperCase = password.matches(".*[A-Z].*");
        boolean hasSpecialChar = password.matches(".*[!@#$%^&*()_+=\\[\\]{}|;:',.<>?/].*");
        passwordFormatError = !(hasNumber && hasLowerCase && hasUpperCase && hasSpecialChar);
        return passwordFormatError;
    }

    public boolean checkPhoneNumberLength(String phoneNumber) {
        String digitsOnly = phoneNumber.replaceAll("\\D", "");
        phoneNumberLengthError = digitsOnly.length() != 10;
        return phoneNumberLengthError;
    }

    public boolean checkUserNameExisted(String userName) throws SQLException, ClassNotFoundException {
        UserDAO dao = new UserDAO();
        isUserNameExisted = dao.checkUserDuplicate(userName);
        return isUserNameExisted;
    }

    public boolean checkEmailExisted(String email) throws SQLException, ClassNotFoundException {
        UserDAO dao = new UserDAO();
        isEmailExisted = dao.checEmailkDuplicate(email);
        return isEmailExisted;
    }

}