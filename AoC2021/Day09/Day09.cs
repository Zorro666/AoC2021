using System;

/*

*/

namespace Day09
{
    class Program
    {
        private Program(string inputFile, bool part1)
        {
            var lines = AoC.Program.ReadLines(inputFile);

            if (part1)
            {
                var result1 = Program.Part1(lines, 25);
                Console.WriteLine($"Day09 : Result1 {result1}");
                var expected = 85848519;
                if (result1 != expected)
                {
                    throw new InvalidProgramException($"Part1 is broken {result1} != {expected}");
                }
            }
            else
            {
                var result2 = Program.Part2(lines, 25);
                Console.WriteLine($"Day09 : Result2 {result2}");
                var expected = 13414198;
                if (result2 != expected)
                {
                    throw new InvalidProgramException($"Part2 is broken {result2} != {expected}");
                }
            }
        }

        public static int Part1(string[] lines, int preambleCount)
        {
            return 10;
        }

        public static int Part2(string[] lines, int preambleCount)
        {
            return 20;
        }

        public static void Run()
        {
            Console.WriteLine("Day09 : Start");
            _ = new Program("Day09/input.txt", true);
            _ = new Program("Day09/input.txt", false);
            Console.WriteLine("Day09 : End");
        }
    }
}
