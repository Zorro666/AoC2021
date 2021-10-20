﻿using System;

/*
*/

namespace Day04
{
    class Program
    {
        private Program(string inputFile, bool part1)
        {
            var lines = AoC.Program.ReadLines(inputFile);

            if (part1)
            {
                var result1 = 10;
                Console.WriteLine($"Day04 : Result1 {result1}");
                var expected = 228;
                if (result1 != expected)
                {
                    throw new InvalidProgramException($"Part1 is broken {result1} != {expected}");
                }
            }
            else
            {
                var result2 = 20;
                Console.WriteLine($"Day04 : Result2 {result2}");
                var expected = 175;
                if (result2 != expected)
                {
                    throw new InvalidProgramException($"Part2 is broken {result2} != {expected}");
                }
            }
        }


        public static void Run()
        {
            Console.WriteLine("Day04 : Start");
            _ = new Program("Day04/input.txt", true);
            _ = new Program("Day04/input.txt", false);
            Console.WriteLine("Day04 : End");
        }
    }
}
