using System;

/*

*/

namespace Day05
{
    class Program
    {
        private Program(string inputFile, bool part1)
        {
            var lines = AoC.Program.ReadLines(inputFile);

            if (part1)
            {
                var result1 = Part1(lines);
                Console.WriteLine($"Day05 : Result1 {result1}");
                var expected = 959;
                if (result1 != expected)
                {
                    throw new InvalidProgramException($"Part1 is broken {result1} != {expected}");
                }
            }
            else
            {
                var result2 = Part2(lines);
                Console.WriteLine($"Day55 : Result2 {result2}");
                var expected = 527;
                if (result2 != expected)
                {
                    throw new InvalidProgramException($"Part2 is broken {result2} != {expected}");
                }
            }
        }

        private static int Part1(string[] lines)
        {
            return 10;
        }

        private static int Part2(string[] lines)
        {
            return 209;
        }

        public static void Run()
        {
            Console.WriteLine("Day05 : Start");
            _ = new Program("Day05/input.txt", true);
            _ = new Program("Day05/input.txt", false);
            Console.WriteLine("Day05 : End");
        }
    }
}
