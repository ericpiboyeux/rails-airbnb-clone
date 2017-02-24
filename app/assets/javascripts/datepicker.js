$.fn.datepicker.dates['fr'] = {
  days: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"],
  daysShort: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
  daysMin: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
  months: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
  monthsShort: ["Jan", "Fev", "Mar", "Avr", "Mai", "Jui", "Jul", "Aou", "Sep", "Oct", "Nov", "Dec"],
  today: "Aujourd'hui",
  clear: "Clear",
  format: "mm/dd/yyyy",
  titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
  weekStart: 1
};
$('#mydatepicker').datepicker({
  startDate: 'today',
  language: 'fr',
  format: 'dd/mm/yyyy',
  endDate: '+7d',
  todayHighlight: true,
  language: 'fr'
});
