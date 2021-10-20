using Xunit;

namespace Day16
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"38,6,12"
        }, 71)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
