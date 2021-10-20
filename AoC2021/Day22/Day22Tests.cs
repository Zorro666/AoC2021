using Xunit;
namespace Day22
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"Player 1:",
        }, 306)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
