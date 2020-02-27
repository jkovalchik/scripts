import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class APIKeyGenerator {
    public static void main(String[] args) {
        generateApiKey();
    }

    private static void generateApiKey() 
    {
        String uuidStr = UUID.randomUUID().toString();
        byte[] randBytes = uuidStr.getBytes();

        StringBuilder result = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(randBytes);
            byte[] bytes = md.digest();

            /*
            Convert to hexidecimal format and ...
            For bytes < 16, ensure a leading zero.
            This will match PHP's way of doing things.
            */

            for (byte singleByte : bytes) {
                result.append(String.format("%02x", 0xFF & singleByte));
            }
            System.out.println(result);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}