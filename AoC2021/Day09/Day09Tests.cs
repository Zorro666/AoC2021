using Xunit;
namespace Day09
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"35",
        }, 5 )]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
