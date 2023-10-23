package prasad.dockerfilegenerater.Dockerfile.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import prasad.dockerfilegenerater.Dockerfile.Service.DockerfileGeneratorService;
import prasad.dockerfilegenerater.Dockerfile.model.DockerfileRequest;
@Controller
public class DockerfileGeneratorController {
	   @Autowired
	    private DockerfileGeneratorService generatorService;
	   @GetMapping("/msg")
	   public String Msg() {
		   return "hello this vara prasad i am a fullstack guy";
	   }

	    @PostMapping("/generate-dockerfile")
	    public ResponseEntity<String> generateDockerfile(@RequestBody DockerfileRequest request) {
	        String dockerfileContent = generatorService.generateDockerfile(request);
	        return ResponseEntity.ok(dockerfileContent);
	    }
}
