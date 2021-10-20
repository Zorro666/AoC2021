using Xunit;
namespace Day07
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"dotted black bags contain no other bags."
        }, 4)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
