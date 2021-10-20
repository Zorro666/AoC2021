using Xunit;
namespace Day15
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"0,3,6"
        }, 436)]
        [InlineData(new string[] {
"3,1,2"
        }, 1836)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }

    }
}
