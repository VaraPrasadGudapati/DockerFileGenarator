package prasad.dockerfilegenerater.Dockerfile.model;

public class DockerfileRequest {
private String appName;
private String version;
public String getAppName() {
	return appName;
}
public void setAppName(String appName) {
	this.appName = appName;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
}
