<%= @ingredient.inspect %>
<%= link_to 'update @ingredient', update_status_ingredient_path(@ingredient) %>

<table>
  <thead>
    <tr>
      <th>Meal</th>
      <th>Grocery</th>
      <th>Measurement</th>
      <th>Quantity</th>
    </tr>
  </thead>
  <tbody>
    <% @ingredients.each do |ingredient| %>
      <tr>
        <td><%= link_to "#{ingredient.ingredientable_name}", ingredient_path(ingredient) %></td>
        <td><%= ingredient.grocery %></td>
        <td><%= ingredient.measurement %></td>
        <td><%= ingredient.quantity %></td>
      </tr>
    <% end %>
  </tbody>
</table>