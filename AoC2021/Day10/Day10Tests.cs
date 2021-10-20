using Xunit;
namespace Day10
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"4"
        }, 7 * 5)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
