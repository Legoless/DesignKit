@primaryFontName: HelveticaNeue;
@secondaryFontName: HelveticaNeue-Light;
@primaryFontColor: #333333;
@primaryBackgroundColor: #E6E6E6;

Button
{
    background-color: @primaryBackgroundColor;
    border-color: #A2A2A2;
    border-width: 1.0;
    font-color: @primaryFontColor;
    font-color-highlighted: #999999;
    font-name: @primaryFontName;
    font-size: 18;
    corner-radius: 7;
    content: MyTest;
}

NavigationBar
{
    background-tint-color: @primaryBackgroundColor;
    font-name: @secondaryFontName;
    font-size: 20;
    font-color: @primaryFontColor;
    text-shadow-color: #666666;
    text-shadow-offset: 1,1;
}