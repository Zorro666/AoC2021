using Xunit;
namespace Day13
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"939",
        }, 295)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
