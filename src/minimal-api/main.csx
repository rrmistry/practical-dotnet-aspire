#r "sdk:Microsoft.NET.Sdk.Web"

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

var app = WebApplication.Create();

app.MapGet("/", () => "Hello world");

app.MapGet("/error", () => {
    throw new Exception(message: @"
    Something went wrong!
    I don't know what to say!!
    Fix your damn code!!!
");
});

// Generic map-all fallback and respond with 404
app.MapFallback(() => {
    // Write a multi-line message to the console
    Console.WriteLine(@"
    Http method of endpoint not found!
    What's wrong with you people!!
    Leave me alone please!!!
    ");
    return Results.NotFound("Http method of endpoint not found!");
});

app.Run();
