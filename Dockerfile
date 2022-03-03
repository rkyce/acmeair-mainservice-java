FROM maven:3.8.4-jdk-11-slim AS build-stage
COPY . /project
WORKDIR /project/
RUN mvn clean install

FROM ibmcom/websphere-liberty:kernel-java8-ibmjava-ubi
#ARG tag="kernel-java8-ibmjava-ubi"
#FROM ibmcom/websphere-liberty:$tag
COPY --chown=1001:0 --from=build-stage /project/src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 --from=build-stage /project/src/main/liberty/config/server.env /config/server.env
COPY --chown=1001:0 --from=build-stage /project/src/main/liberty/config/jvm.options /config/jvm.options
COPY --chown=1001:0 --from=build-stage /project/target/acmeair-mainservice-java-5.0.war /config/apps/
#RUN curl -sL -o /config/apps/jarfile.txt https://ibm.box.com/shared/static/nsp0yq8sicrj0ef2yyuasoz4l0y0g0dt.txt
RUN configure.sh
