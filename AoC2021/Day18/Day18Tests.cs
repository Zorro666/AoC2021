using Xunit;

namespace Day18
{
    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"1 + 2 * 3 + 4 * 5 + 6"
        }, 71)]
        public void Part1(string[] lines, long expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
