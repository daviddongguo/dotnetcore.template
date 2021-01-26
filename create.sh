#!/usr/bin/env bash
Root=${PWD##*/}

# Create projects, solution, And add references
./scripts/new.sh
pwd
ls ./src -ls
ls ./tests -ls
sleep 10

# Console project for debugging
cd ./src/$Root.Console && pwd
cat > Program.cs << EOF
namespace $Root.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("-----------------------, \n");
            System.Console.WriteLine("Console project Created, \n");
            System.Console.WriteLine("-----------------------, \n");
        }
    }
}
EOF
dotnet run
cd ../..

# Nunit project
cd ./tests/$Root.NunitTests && pwd
rm UnitTest1.cs
cat > AlwaysPassTest.cs << EOF
using NUnit.Framework;

namespace $Root.NunitTests
{
    public class AlwaysPassTest
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Always_Pass_Test()
        {
            System.Console.WriteLine("Always Pass");
            Assert.Pass();
            Assert.That(true);
            Assert.That("Hello!", Is.EqualTo("HELLO!").IgnoreCase);
        }
    }
}
EOF
dotnet test -l "console;verbosity=detailed"
cd ../..
