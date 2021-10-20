using Xunit;

namespace Day19
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"0: 4 1 5"
        }, 2)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
