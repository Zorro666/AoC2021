using Xunit;
namespace Day14
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X",
"mem[8] = 11",
"mem[7] = 101",
"mem[8] = 0"
        }, 165)]
        public void Part1(string[] lines, long expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
