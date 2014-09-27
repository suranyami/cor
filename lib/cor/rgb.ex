defmodule Cor.Rgb do

  defstruct r: 0.0, g: 0.0, b: 0.0

  def red,   do: %Cor.Rgb{r: 1.0, g: 0.0, b: 0.0}
  def green, do: %Cor.Rgb{r: 0.0, g: 1.0, b: 0.0}
  def blue,  do: %Cor.Rgb{r: 0.0, g: 0.0, b: 1.0}

  def as_percent(color) do
    %Cor.Rgb{r: as_per(color.r), g: as_per(color.g), b: as_per(color.b)}
  end

  def as_bytes(color) do
    %Cor.Rgb{r: as_byte(color.r), g: as_byte(color.g), b: as_byte(color.b)}
  end

  def html(color) do
    "\##{hex_digits color.r}#{hex_digits color.g}#{hex_digits color.b}"
  end

  def hex_digits(num) do
    list = num * 255 |> Hexate.encode 2
    String.upcase list
  end

  @doc """
  Returns a new colour with the brightness adjusted by the specified
  percentage. Negative percentages will darken the colour; positive
  percentages will brighten the colour.

  ## Example:
      iex> Rgb.blue |> Rgb.adjust_brightness 10 |> Rgb.html
      "#1a1aff"
  """
  def adjust_brightness(color, percent) do
    norm_percent = normalize_percent percent
    to_hsl(color).l
    |> * percent
    Hsl.to_rgb
  end


  def normalize_percent(percent) do
    percent / 100.0
    |> + 1.0
    |> min 2.0
    |> max 0.0
  end

  @doc """
  Converts a float from 0.0 to 1.0 into the range 0..100%
  as an integer
  ## Example
      iex> Cor.Rgb.as_byte(1.0)
      255
  """
  def as_per(float) do
    round(float * 100.0)
  end

  @doc """
  Converts a float from 0.0 to 1.0 into the range 0..255

  ## Example
      iex> Cor.Rgb.as_byte(1.0)
      255
  """
  def as_byte(float) do
    round(float * 255.0)
  end
end
