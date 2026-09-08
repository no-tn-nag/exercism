class Badge {
    public String print(Integer id, String name, String department) {
        if (department == null) {
            if (id == null) {
                return name + " - OWNER";
            } else {
                return "[" + id + "] - " + name + " - OWNER";
            }
        } else {
            if (id == null) {
                return name + " - " + department.toUpperCase();
            } else {
                return "[" + id + "] - " + name + " - " + department.toUpperCase();
            }
        }
    }
}
