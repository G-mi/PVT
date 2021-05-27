package tennisPartner.accessingdatamysql;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.springframework.boot.jackson.JsonComponent;

import java.io.IOException;

@JsonComponent
public class UserJsonSerializer extends JsonSerializer<User> {


    @Override
    public void serialize(User user, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeStartObject();
        jsonGenerator.writeStringField(
                "userName",
              user.getName());
        jsonGenerator.writeStringField(
                "firstName",
                user.getFirstName());
        jsonGenerator.writeStringField(
                "lastName",
                user.getLastName());
        jsonGenerator.writeStringField("email", user.getEmail());
        jsonGenerator.writeNumberField(
                "skillLevel",
                user.getSkillLevel());
        jsonGenerator.writeNumberField(
                "age",
                  user.getAge());
        jsonGenerator.writeStringField(
                "gender",
              user.getGender());
        jsonGenerator.writeStringField("aboutImage", user.getAboutInfo());

        jsonGenerator.writeEndObject();
    }
}
