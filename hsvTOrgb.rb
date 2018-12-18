h, s, v = ARGV;

h = h.to_f;
s = s.to_f;
v = v.to_f;

r, g, b = 0;

f, p1, h2, q, t = 0.0;

i = 0;

puts("Initialized values f, p, h2, q and t with 0.0");

v = v * 255;

puts("Multiplied V with 255 to get #{v}");

if (s == 0)
    puts("S == 0")
    if (h == 0)
        r, g, b = v.round.to_i;
        puts("H == 0, therefore are R, G and B = V = #{v}");
    else
        abort("Error in spec!");
    end
else
    puts("S != 0")
    if (h == 360.0)
        puts("H == 0, therefore H = 0");
        h = 0.0;
    end
    h2 = h / 60;
    puts("H2 = H / 60 = #{h} / 60 = #{h2}");
    i = h2.floor;
    puts("I = h2.floor = #{i}");
    f = h2 - i;
    puts("F = delta(h2, i) = #{f}");
    p1 = v * (1.0 - s);
    puts("P = V * (1.0 - S) = #{v} * (1.0 - #{s}) = #{p1}");
    q = v * (1.0 - (s * f));
    puts("Q = V * (1.0 - (S * F)) = #{v} * (1.0 - (#{s} * #{f})) = #{q}");
    t = v * (1.0 - (s * (1.0 - f)));
    puts("T = V * (S * (1.0 - F)) = #{v} * (S * (1.0 - #{f})) = #{t}");
    if (i == 0)
        r = v;
        g = t;
        b = p1;
        puts("I == 0, therefore R = V = #{r}, G = T = #{g} and B = P = #{b}");       
    elsif (i == 1)
        r = q;
        g = v;
        b = p1;
        puts("I == 1, therefore R = Q = #{r}, G = V = #{g} and B = P = #{b}");       
    elsif (i == 2)
        r = p1;
        g = v;
        b = t;
        puts("I == 2, therefore R = P = #{r}, G = V = #{g} and B = T = #{b}");       
    elsif (i == 3)
        r = p1;
        g = q;
        b = v;
        puts("I == 3, therefore R = P = #{r}, G = Q = #{g} and B = V = #{b}");       
    elsif (i == 4)
        r = t;
        g = p1;
        b = v;
        puts("I == 4, therefore R = T = #{r}, G = P = #{g} and B = V = #{b}");       
    elsif (i == 5)
        r = v;
        g = p1;
        b = q;
        puts("I == 5, therefore R = V = #{r}, G = P = #{g} and B = Q = #{b}");       
    else
        abort("Error!");
    end
end

r = r.round.to_i;
g = g.round.to_i;
b = b.round.to_i;

puts("Rounding Red, Green and Blue to nearest Integer Value...")

puts ("Final result:\nRed: \t#{r}/255 or ~#{(r/255.0*100).to_i}%\nGreen: \t#{g}/255 or ~#{(g/255.0*100).to_i}%\nBlue: \t#{b}/255 or ~#{(b/255.0*100).to_i}%")