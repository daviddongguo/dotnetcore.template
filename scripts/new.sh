#!/usr/bin/env bash
Root=${PWD##*/}

# Create projects Add into solution, Add references

mkdir -p src/$Root.Console && cd ./src/*Console && dotnet new console --force && cd ../..
mkdir -p src/$Root.Classlib && cd ./src/*Classlib && dotnet new classlib --force && cd ../..
mkdir -p src/$Root.Mvc && cd ./src/*Mvc && dotnet new mvc  --force && cd ../..
mkdir -p src/$Root.Webapi && cd ./src/*Webapi && dotnet new webapi  --force && cd ../..
mkdir -p tests/$Root.NunitTests && cd ./tests/*NunitTests && dotnet new nunit --force && cd ../..
mkdir -p tests/$Root.RestSharpTests && cd ./tests/*RestSharpTests && dotnet new nunit --force && cd ../..

dotnet new sln --force
dotnet sln add ./src/$Root.Console/$Root.Console.csproj
dotnet sln add ./src/$Root.Classlib/$Root.Classlib.csproj
dotnet sln add ./src/$Root.Mvc/$Root.Mvc.csproj
dotnet sln add ./src/$Root.Webapi/$Root.Webapi.csproj
dotnet sln add ./tests/$Root.NunitTests/$Root.NunitTests.csproj
#dotnet sln add ./$Root.RestSharpTests/$Root.RestSharpTests.csproj

dotnet add ./src/$Root.Console/$Root.Console.csproj reference ./src/$Root.Classlib/$Root.Classlib.csproj
dotnet add ./src/$Root.Mvc/$Root.Mvc.csproj reference ./src/$Root.Classlib/$Root.Classlib.csproj
dotnet add ./tests/$Root.NunitTests/$Root.NunitTests.csproj reference ./src/$Root.Classlib/$Root.Classlib.csproj
dotnet add ./tests/$Root.NunitTests/$Root.NunitTests.csproj reference ./src/$Root.Mvc/$Root.Mvc.csproj
dotnet add ./tests/$Root.NunitTests/$Root.NunitTests.csproj reference ./src/$Root.Webapi/$Root.Webapi.csproj
dotnet add ./tests/$Root.RestSharpTests/$Root.RestSharpTests.csproj reference ./src/$Root.Classlib/$Root.Classlib.csproj
dotnet add ./tests/$Root.RestSharpTests/$Root.RestSharpTests.csproj reference ./src/$Root.Webapi/$Root.Webapi.csproj
dotnet add ./tests/$Root.RestSharpTests/$Root.RestSharpTests.csproj reference ./src/$Root.Mvc/$Root.Mvc.csproj
