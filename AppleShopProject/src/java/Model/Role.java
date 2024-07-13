package Model;

public class Role {
    private int roleId;
    private String rolename;

    public Role() {
    }

    public Role(int roleId, String rolename) {
        this.roleId = roleId;
        this.rolename = rolename;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
    
}
