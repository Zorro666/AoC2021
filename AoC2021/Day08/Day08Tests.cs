using Xunit;
namespace Day08
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"acc +6"
        }, 5)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
