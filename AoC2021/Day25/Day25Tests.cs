using Xunit;
namespace Day25
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"17807724"
         }, 14897079L)]
        public void Part1(string[] lines, long expected)
        {
            Assert.Equal(expected, long.Parse(lines[0]));

        }
    }
}
