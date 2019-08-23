function out = favor_getAllProjects(api)
// Get all the projects of a user
//
// Syntax
//    out = favor_getAllProjects(api)
//
// Parameters
//     out : A structure containing the projects' properties 
//     api : The user's API key
//
// Description
//    Retrieves all the projects of a user using the API key provided by api. The structure contains 3 fields. The first field (statusCode) shows the HTTP request result (200 means success). The second field (numFound) shows the number of projects found. The third field (results) contains a structure which contains all the properties of the projects.
//
// See also
//    favor_createData
//    favor_createSensors
//    favor_filterSensor
//    favor_getAllApplications
//    favor_getAllData 
//    favor_getAllDevices
//    favor_getAllGroups
//    favor_getAllProjects
//    favor_getApplication
//    favor_getDevice
//    favor_getDeviceData
//    favor_getGroup
//    favor_getProject
//    favor_sendData
//    favor_struct2json
//
// Authors
//     Joshua T., C.L. Tan, Bytecode    
//

    jimport okhttp3.OkHttpClient;
    jimport okhttp3.Request$Builder

    client = jnewInstance(OkHttpClient);
    reqbuilder = jnewInstance(Request$Builder)

    reqbuilder.url("https://api.favoriot.com/v1/projects");
    reqbuilder.addHeader("content-type", "application/json");
    reqbuilder.addHeader("cache-control", "no-cache");
    reqbuilder.addHeader("apikey", api);
    request = jinvoke(reqbuilder,"build");

    req_call = client.newCall(request);
    result = jinvoke(req_call,"execute"); // Send the HTTP request

    result_response=jinvoke(result,"body");
    response_body = jinvoke(result_response,"string"); // response body can only be consumed once

    //out = response_body;
    out = JSONParse(response_body)
endfunction



