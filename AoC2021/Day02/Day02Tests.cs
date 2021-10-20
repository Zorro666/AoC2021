using Xunit;
namespace Day02
{
    public class Tests
    {
        [Theory]
        [InlineData("2-9 c: ccccccccc", 1)]
        public void ValidPassword1(string rule, int valid)
        {
            Assert.Equal(valid, int.Parse(rule));
        }
    }
}
