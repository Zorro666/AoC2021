using Xunit;
namespace Day11
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"L.LLLLL.LL"
        }, 37)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
