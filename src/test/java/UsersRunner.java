import com.intuit.karate.junit5.Karate;

class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        // Apunta directamente al archivo .feature en resources usando el classpath
        return Karate.run("classpath:features/user/users-crud.feature");
    }
}