# mvg - mvn generate 
mvg() { 
  mvn -B archetype:generate \
    -DgroupId=com.sciencefidelity."$@" \
    -DartifactId="$@" \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=1.4
  cd "$@";
}
