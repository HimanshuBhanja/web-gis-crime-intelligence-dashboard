<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor version="1.0.0"
 xmlns="http://www.opengis.net/sld"
 xmlns:sld="http://www.opengis.net/sld"
 xmlns:ogc="http://www.opengis.net/ogc"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
<sld:NamedLayer>
<sld:Name>dacoity_density</sld:Name>
<sld:UserStyle>
<sld:Name>dacoity_density</sld:Name>
<sld:Title>Dacoity Cases per km²</sld:Title>
<sld:FeatureTypeStyle>
<sld:Rule>
<sld:Name>No Cases</sld:Name><sld:Title>No Cases</sld:Title>
<ogc:Filter><ogc:PropertyIsEqualTo><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0</ogc:Literal></ogc:PropertyIsEqualTo></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#F5F5F5</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
<sld:Rule>
<sld:Name>Very Low</sld:Name><sld:Title>Very Low: &gt;0 – 0.0001</sld:Title>
<ogc:Filter><ogc:And>
<ogc:PropertyIsGreaterThan><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0</ogc:Literal></ogc:PropertyIsGreaterThan>
<ogc:PropertyIsLessThanOrEqualTo><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0001</ogc:Literal></ogc:PropertyIsLessThanOrEqualTo>
</ogc:And></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#FFFFCC</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
<sld:Rule>
<sld:Name>Low</sld:Name><sld:Title>Low: &gt;0.0001 – 0.0009</sld:Title>
<ogc:Filter><ogc:And>
<ogc:PropertyIsGreaterThan><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0001</ogc:Literal></ogc:PropertyIsGreaterThan>
<ogc:PropertyIsLessThanOrEqualTo><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0009</ogc:Literal></ogc:PropertyIsLessThanOrEqualTo>
</ogc:And></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#FED976</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
<sld:Rule>
<sld:Name>Moderate</sld:Name><sld:Title>Moderate: &gt;0.0009 – 0.0025</sld:Title>
<ogc:Filter><ogc:And>
<ogc:PropertyIsGreaterThan><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0009</ogc:Literal></ogc:PropertyIsGreaterThan>
<ogc:PropertyIsLessThanOrEqualTo><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0025</ogc:Literal></ogc:PropertyIsLessThanOrEqualTo>
</ogc:And></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#FEB24C</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
<sld:Rule>
<sld:Name>High</sld:Name><sld:Title>High: &gt;0.0025 – 0.0068</sld:Title>
<ogc:Filter><ogc:And>
<ogc:PropertyIsGreaterThan><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0025</ogc:Literal></ogc:PropertyIsGreaterThan>
<ogc:PropertyIsLessThanOrEqualTo><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0068</ogc:Literal></ogc:PropertyIsLessThanOrEqualTo>
</ogc:And></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#FD8D3C</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
<sld:Rule>
<sld:Name>Very High</sld:Name><sld:Title>Very High: &gt;0.0068</sld:Title>
<ogc:Filter><ogc:PropertyIsGreaterThan><ogc:PropertyName>cases_per_km2</ogc:PropertyName><ogc:Literal>0.0068</ogc:Literal></ogc:PropertyIsGreaterThan></ogc:Filter>
<sld:PolygonSymbolizer><sld:Fill><sld:CssParameter name="fill">#E31A1C</sld:CssParameter></sld:Fill>
<sld:Stroke><sld:CssParameter name="stroke">#555555</sld:CssParameter><sld:CssParameter name="stroke-width">0.6</sld:CssParameter></sld:Stroke></sld:PolygonSymbolizer>
</sld:Rule>
</sld:FeatureTypeStyle>
</sld:UserStyle>
</sld:NamedLayer>
</sld:StyledLayerDescriptor>
