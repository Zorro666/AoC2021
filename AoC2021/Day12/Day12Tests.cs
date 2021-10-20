using Xunit;
namespace Day12
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"F11"
        }, 25)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
