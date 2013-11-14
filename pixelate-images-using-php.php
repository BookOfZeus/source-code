<?php

function convertToPixel($image, $size) {
  $im = imagecreatefromjpeg($image);
  $size = (int)$size;
  $sizeX = imagesx($im);
  $sizeY = imagesy($im);
  if($sizeX < 3 && $sizeX < 3) { // or you can choose any size you want
    return;
  }
  for($i = 0;$i < $sizeX; $i += $size) {
    for($j = 0;$j < $sizeY; $j += $size) {
      $colors = Array('alpha' => 0, 'red' => 0, 'green' => 0, 'blue' => 0, 'total' => 0);
      for($k = 0; $k < $size; ++$k) {
        for($l = 0; $l < $size; ++$l) {
          if($i + $k >= $sizeX || $j + $l >= $sizeY) {
            continue;
          }
          $color = imagecolorat($im, $i + $k, $j + $l);
          imagecolordeallocate($im, $color);
          $colors['alpha'] += ($color >> 24) & 0xFF;
          $colors['red'] += ($color >> 16) & 0xFF;
          $colors['green'] += ($color >> 8) & 0xFF;
          $colors['blue'] += $color & 0xFF;
          ++$colors['total'];
        }
      }
      $color = imagecolorallocatealpha($im, $colors['red'] / $colors['total'], $colors['green'] / $colors['total'], $colors['blue'] / $colors['total'], $colors['alpha'] / $colors['total']);
      imagefilledrectangle($im, $i, $j, ($i + $size - 1), ($j + $size - 1), $color);
    }
  }
  header('Content-type: image/jpg');
  imagejpeg($im, '', 100);
}
$image = 'lion.jpg';
convertToPixel($image, 10);
