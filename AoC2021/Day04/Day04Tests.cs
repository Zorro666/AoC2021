using Xunit;
namespace Day04
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"iyr:2011 ecl:brn hgt:59in"
        }, 2)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
