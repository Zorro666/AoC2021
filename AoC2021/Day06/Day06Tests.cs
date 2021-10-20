using Xunit;
namespace Day06
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"abc",
"b"}, 11)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
