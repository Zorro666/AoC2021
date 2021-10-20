using System;

/*


*/

namespace Day18
{
    class Program
    {
        private Program(string inputFile, bool part1)
        {
            var lines = AoC.Program.ReadLines(inputFile);

            if (part1)
            {
                var result1 = Part1(lines);
                Console.WriteLine($"Day18 : Result1 {result1}");
                var expected = 16332191652452;
                if (result1 != expected)
                {
                    throw new InvalidProgramException($"Part1 is broken {result1} != {expected}");
                }
            }
            else
            {
                var result2 = Part2(lines);
                Console.WriteLine($"Day18 : Result2 {result2}");
                var expected = 351175492232654L;
                if (result2 != expected)
                {
                    throw new InvalidProgramException($"Part2 is broken {result2} != {expected}");
                }
            }
        }

        public static long Part1(string[] lines)
        {
            return 10;
        }

        public static long Part2(string[] lines)
        {
            return 20;
        }

        public static void Run()
        {
            Console.WriteLine("Day18 : Start");
            _ = new Program("Day18/input.txt", true);
            _ = new Program("Day18/input.txt", false);
            Console.WriteLine("Day18 : End");
        }
    }
}

/*

2 * 3 + 4

Values
2
3
4

Operators
*
+

2 + 3 * 4

Operators
+
* : apply the +

*/

