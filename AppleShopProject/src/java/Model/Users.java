
package Model;

public class Users {
    private int userID;
    private String userName, email, tel, password;
    private boolean status;
    private int roleID;
    private String firstName, lastName, address, zipcode;

    public Users() {
    }

    public Users(String userName, String email, String tel, String password) {
        this.userName = userName;
        this.email = email;
        this.tel = tel;
        this.password = password;
    }

    public Users(String userName, String email, String tel, String password, boolean status, int roleID, String firstName, String lastName, String address, String zipcode) {
        this.userName = userName;
        this.email = email;
        this.tel = tel;
        this.password = password;
        this.status = status;
        this.roleID = roleID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.zipcode = zipcode;
    }

    public Users(String userName, String email, String tel, String password, int roleID) {
        this.userName = userName;
        this.email = email;
        this.tel = tel;
        this.password = password;
        this.roleID = roleID;
    }

    public Users(int userID, String userName, String email, String tel, String password, boolean status, int roleID, String firstName, String lastName, String address, String zipcode) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.tel = tel;
        this.password = password;
        this.status = status;
        this.roleID = roleID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.zipcode = zipcode;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    
    
}
