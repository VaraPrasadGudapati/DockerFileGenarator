package prasad.dockerfilegenerater.Dockerfile.Service;

import org.springframework.stereotype.Service;

import prasad.dockerfilegenerater.Dockerfile.model.DockerfileRequest;
@Service
public class DockerfileGeneratorService {
    public String generateDockerfile(DockerfileRequest request) {
        // Logic to generate Dockerfile content
        // Replace placeholders with user-provided values
        String dockerfileContent = "FROM " + request.getAppName() +":"+request.getVersion()+ "\n"+ "\n"+"\n";
            // ... (other Dockerfile sections)
        return dockerfileContent;
    }
}