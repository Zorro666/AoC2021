using System;

/*

*/

namespace Day01
{
    class Program
    {
        private Program(string inputFile, bool part1)
        {
            var lines = AoC.Program.ReadLines(inputFile);
            Parse(lines);

            if (part1)
            {
                var result1 = 10;
                Console.WriteLine($"Day01 : Result1 {result1}");
                var expected = 444019;
                if (result1 != expected)
                {
                    throw new InvalidProgramException($"Part1 is broken {result1} != {expected}");
                }
            }
            else
            {
                var result2 = 20;
                Console.WriteLine($"Day01 : Result2 {result2}");
                var expected = 29212176;
                if (result2 != expected)
                {
                    throw new InvalidProgramException($"Part2 is broken {result2} != {expected}");
                }
            }
        }

        static void Parse(string[] lines)
        {
            var count = lines.Length;
            foreach (var line in lines)
            {
            }
        }

        public static void Run()
        {
            Console.WriteLine("Day01 : Start");
            _ = new Program("Day01/input.txt", true);
            _ = new Program("Day01/input.txt", false);
            Console.WriteLine("Day01 : End");
        }
    }
}
