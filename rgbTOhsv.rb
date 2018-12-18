def min(v1, v2, v3)
    if (v1 <=  v2 && v1 <=  v3)
        return v1;
    end
    if (v2 <=  v1 && v2 <=  v3)
        return v2;
    end
    if (v3 <=  v1 && v3 <=  v2)
        return v3;
    end
end

def max(v1, v2, v3)
    if (v1 >=   v2 && v1 >=   v3)
        return v1;
    end
    if (v2 >=   v1 && v2 >=   v3)
        return v2;
    end
    if (v3 >=   v1 && v3 >=   v2)
        return v3;
    end
end

r, g, b = ARGV;

r = r.to_f;
g = g.to_f;
b = b.to_f;

h, s, v = 0.0;

min = min(r,g,b);
puts "Minimum of #{r}, #{g} and #{b} = #{min}";
max = max(r,g,b);
puts "Maximum of #{r}, #{g} and #{b} = #{max}";

v = max;
delta = max - min;
puts "V is #{max} and delta is #{delta}";

if (v == 0)
    s = 0;
    puts("V == 0, therefore S = 0");
else
    s = delta/v
    puts("V != 0, therfore S = Delta/V = #{s}");
end

if (s == 0)
    h = 0;
    #abort("Error I guess since V and S are 0?!")
else
    if (r == v)
        h = 60 * ((g - b)/delta);
        puts("R == V, therfore H = 60 * (G - B)/Delta = #{h}")
    elsif (g == v)
        h = 120 + 60 * ((b - r)/delta)
        puts("G == V, therfore H = 120 + 60 * (B - R)/Delta = #{h}")
    else
        h = 240 + 60 * ((r - g)/delta)    
        puts("G == V, therfore H = 2400 + 60 * (R - G)/Delta = #{h}")
    end
end

if (h < 0)
    h = h + 360;
    puts ("H is smaller than 0, therefore H = H + 360 = #{h} and V = V / 255 = #{v}")
end

v = v / 255 * 100;
s = s * 100;

puts ("Final result:\nHue is\t#{h}°\nSaturation is\t#{s}%\nValue is\t#{v}%")